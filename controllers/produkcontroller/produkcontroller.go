package produkcontroller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/saktialfansyahp/go-rest-api/models"
)

func Index(c *gin.Context) {
	var produk []models.Produk

	if err := models.DB.Preload("Kategori").Preload("Status").Find(&produk).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": 1})
		return
	}

    var response []models.ProdukResponse

    // Melakukan mapping data dari models.Produk ke ProdukResponse
    for _, prod := range produk {
        produkResp := models.ProdukResponse{
            Id: prod.Id,
            Nama_Produk: prod.Nama_Produk,
            Harga: prod.Harga,
            Kategori: prod.Kategori.Kategori,
            Status: prod.Status.Nama_Status,
        }
        response = append(response, produkResp)
    }

	c.JSON(http.StatusOK, gin.H{"error": 0, "data": response})
}

func ById(c *gin.Context, id string) {
	var produk models.Produk

	if err := models.DB.Preload("Kategori").Preload("Status").Where("id = ?", id).First(&produk).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": 1})
		return
	}

	c.JSON(http.StatusOK, gin.H{"error": 0, "data": produk})
}

func Sale(c *gin.Context) {
	var produk []models.Produk

	if err := models.DB.Preload("Kategori").Preload("Status").Find(&produk).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": 1})
		return
	}

    var response []models.ProdukResponse

    // Melakukan mapping data dari models.Produk ke ProdukResponse
    for _, prod := range produk {
		if prod.Status.Nama_Status == "bisa dijual" {
			produkResp := models.ProdukResponse{
				Id: prod.Id,
				Nama_Produk: prod.Nama_Produk,
				Harga: prod.Harga,
				Kategori: prod.Kategori.Kategori,
				Status: prod.Status.Nama_Status,
			}
			response = append(response, produkResp)
		}
    }

	c.JSON(http.StatusOK, gin.H{"error": 0, "data": response})
}

func Create(c *gin.Context) {
	var produkInput models.ProdukInput

	if err := c.ShouldBindJSON(&produkInput); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "1"})
		return
	}

    var produk models.Produk

    if produkInput.Id > 0 {
        produk.Id = produkInput.Id
    }

    produk.Nama_Produk = produkInput.Nama_Produk
    produk.Harga = produkInput.Harga
    produk.KategoriID = produkInput.KategoriID
    produk.StatusID = produkInput.StatusID

	if err := models.DB.Where("nama_produk = ?", &produkInput.Nama_Produk).First(&produk); err == nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"error": "1"})
		return
	}

	if err := models.DB.Create(&produk).Error; err != nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{"error": "1"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"error": "0", "data": &produk})
}

func Edit(c *gin.Context, id string) {
    var produkInput models.ProdukInput
    if err := c.ShouldBindJSON(&produkInput); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "1"})
		return
	}

    // Cek apakah produk dengan product_id tersebut ada dalam database
    var existingProduct models.Produk
    if err := models.DB.Where("id = ?", id).First(&existingProduct).Error; err != nil {
        c.JSON(http.StatusNotFound, gin.H{"error": "1"})
		return
    }

    existingProduct.Nama_Produk = produkInput.Nama_Produk
	existingProduct.Harga = produkInput.Harga
	existingProduct.KategoriID = produkInput.KategoriID
	existingProduct.StatusID = produkInput.StatusID

    if err := models.DB.Save(&existingProduct).Error; err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"error": "1"})
		return
    }

	c.JSON(http.StatusOK, gin.H{"error": "0", "data": &existingProduct})
}

func Delete(c *gin.Context, id string) {
    var existingProduct models.Produk
    if err := models.DB.Where("id = ?", id).First(&existingProduct).Error; err != nil {
        c.JSON(http.StatusNotFound, gin.H{"error": "1"})
		return
    }

    if err := models.DB.Delete(&existingProduct).Error; err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"error": "1"})
		return
    }

    c.JSON(http.StatusNoContent, gin.H{"error": "0", "data": &existingProduct})
}