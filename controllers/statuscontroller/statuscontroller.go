package statuscontroller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/saktialfansyahp/go-rest-api/models"
)

func Index(c *gin.Context) {
	var status []models.Status

	if err := models.DB.Find(&status).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "success", "data": status})
}

func Create(c *gin.Context) {
	var status models.Status

	if err := c.ShouldBindJSON(&status); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "1"})
		return
	}

	if err := models.DB.Where("nama_status = ?", &status.Nama_Status).First(&status); err == nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"error": "1"})
		return
	}

	if err := models.DB.Create(&status).Error; err != nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"error": "1"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"error": "0", "data": &status})
}