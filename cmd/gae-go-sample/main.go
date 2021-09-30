package main

import (
	"github.com/dn365/gin-zerolog"
	"github.com/gin-gonic/gin"
	_ "github.com/rs/zerolog"
	"net/http"
	"os"
)

func main() {
	r := gin.Default()
	r.Use(ginzerolog.Logger("gin"))
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})
	r.Run(":" + os.Getenv("PORT"))
}
