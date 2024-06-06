package main

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func main() {
  var err error
  db, err = sql.Open("mysql", "root:yourpassword@tcp(127.0.0.1:3306)/berita_app")
  if err != nil {
    panic(err)
  }

  router := gin.Default()
  router.Use(cors.Default())

  router.GET("/articles", getArticles)
  router.POST("/articles", createArticle)
  router.GET("/bookmarks", getBookmarks)
  router.POST("/bookmarks", createBookmark)
  router.DELETE("/bookmarks/:id", deleteBookmark)
  router.POST("/upload", uploadImage)

  router.Run(":3000")
}

type Article struct {
  ID          int    `json:"id"`
  Title       string `json:"title"`
  Description string `json:"description"`
  ImageURL    string `json:"image_url"`
}

func getArticles(c *gin.Context) {
  rows, err := db.Query("SELECT id, title, description, image_url FROM articles")
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }
  defer rows.Close()

  var articles []Article
  for rows.Next() {
    var article Article
    if err := rows.Scan(&article.ID, &article.Title, &article.Description, &article.ImageURL); err != nil {
      c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
      return
    }
    articles = append(articles, article)
  }

  c.JSON(http.StatusOK, articles)
}

func createArticle(c *gin.Context) {
  var article Article
  if err := c.ShouldBindJSON(&article); err != nil {
    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
    return
  }

  res, err := db.Exec("INSERT INTO articles (title, description, image_url) VALUES (?, ?, ?)", article.Title, article.Description, article.ImageURL)
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }

  id, err := res.LastInsertId()
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }

  article.ID = int(id)
  c.JSON(http.StatusOK, article)
}

type Bookmark struct {
  ID        int `json:"id"`
  ArticleID int `json:"article_id"`
}

func getBookmarks(c *gin.Context) {
  rows, err := db.Query("SELECT b.id, a.title, a.description, a.image_url FROM bookmarks b JOIN articles a ON b.article_id = a.id")
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }
  defer rows.Close()

  var bookmarks []Article
  for rows.Next() {
    var bookmark Article
    if err := rows.Scan(&bookmark.ID, &bookmark.Title, &bookmark.Description, &bookmark.ImageURL); err != nil {
      c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
      return
    }
    bookmarks = append(bookmarks, bookmark)
  }

  c.JSON(http.StatusOK, bookmarks)
}

func createBookmark(c *gin.Context) {
  var bookmark Bookmark
  if err := c.ShouldBindJSON(&bookmark); err != nil {
    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
    return
  }

  res, err := db.Exec("INSERT INTO bookmarks (article_id) VALUES (?)", bookmark.ArticleID)
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }

  id, err := res.LastInsertId()
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }

  bookmark.ID = int(id)
  c.JSON(http.StatusOK, bookmark)
}

func deleteBookmark(c *gin.Context) {
  id := c.Param("id")

  _, err := db.Exec("DELETE FROM bookmarks WHERE id = ?", id)
  if err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }

  c.JSON(http.StatusOK, gin.H{"message": "Bookmark deleted"})
}

func uploadImage(c *gin.Context) {
  file, err := c.FormFile("file")
  if err != nil {
    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
    return
  }

  filename := fmt.Sprintf("uploads/%s", file.Filename)
  if err := c.SaveUploadedFile(file, filename); err != nil {
    c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
    return
  }

  c.JSON(http.StatusOK, gin.H{"url": filename})
}
