package kategoricontroller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/saktialfansyahp/go-rest-api/models"
)

func Index(c *gin.Context) {
	var kategori []models.Kategori

	if err := models.DB.Find(&kategori).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "success", "data": kategori})
}

func Create(c *gin.Context) {
	var kategori models.Kategori

	if err := c.ShouldBindJSON(&kategori); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "1"})
		return
	}

	if err := models.DB.Where("kategori = ?", &kategori.Kategori).First(&kategori); err == nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"error": "1"})
		return
	}

	if err := models.DB.Create(&kategori).Error; err != nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"error": "1"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"error": "0", "data": &kategori})
}