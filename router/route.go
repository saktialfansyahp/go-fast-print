package router

import (
	"crypto/rand"
	"encoding/base64"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/saktialfansyahp/go-rest-api/controllers/authcontroller"
	"github.com/saktialfansyahp/go-rest-api/controllers/kategoricontroller"
	"github.com/saktialfansyahp/go-rest-api/controllers/produkcontroller"
	"github.com/saktialfansyahp/go-rest-api/controllers/statuscontroller"
	"github.com/saktialfansyahp/go-rest-api/models"
)

// 	api := r.PathPrefix("api").Subrouter()
// 	api.HandleFunc("/product", productcontroller.Index).Methods("GET")
// 	api.Use(middleware.JWTMiddleware)

func generateRandomValue(length int) (string, error) {
	bytes := make([]byte, length)
	_, err := rand.Read(bytes)
	if err != nil {
		return "", err
	}
	return base64.URLEncoding.EncodeToString(bytes), nil
}

func DefineRoutes() {
	r := gin.Default()
	models.ConnectDatabase()

	r.Use(func(c *gin.Context) {
		c.Writer.Header().Set("Strict-Transport-Security", "max-age=31536000")
		c.Writer.Header().Set("X-Powered-By", "it-programmer")
		c.Writer.Header().Set("X-Credentials-Username", "tesprogrammer230923C02 (username akan berubah2 mengikuti waktu server)")
		c.Writer.Header().Set("X-Credentials-Password", "md5 dari  = bisacoding-'tanggal sekarang (angka)'-'bulan sekarang (angka)'-'2 digit terakhir tahun sekarang (angka)', Contoh : bisacoding-12-20-21")

		c.Writer.Header().Set("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate")
		c.Writer.Header().Set("Pragma", "no-cache")

		cookieValue, err := generateRandomValue(32)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate random value for cookie"})
			return
		}
		c.Writer.Header().Set("Connection", "keep-alive")
		
		c.Writer.Header().Set("Server", "golang")
		c.Writer.Header().Set("Transfer-Encoding", "chunked")

		c.Writer.Header().Set("Access-Control-Allow-Origin", "http://localhost:8081")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

		if c.Request.Method == "OPTIONS" {
			c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS")
			c.JSON(http.StatusOK, gin.H{"message": "Preflight request successful"})
			c.Abort()
			return
		}

		if c.Request.Method == "POST" {
			c.Writer.Header().Set("Access-Control-Allow-Methods", "POST")
		} else if c.Request.Method == "GET" {
			c.Writer.Header().Set("Access-Control-Allow-Methods", "GET")
			c.Writer.Header().Set("Set-Cookie", "ci_session="+cookieValue+"; Path=/; Expires=Session; HttpOnly;")
		} else if c.Request.Method == "PUT" {
			c.Writer.Header().Set("Access-Control-Allow-Methods", "PUT")
		} else if c.Request.Method == "DELETE" {
			c.Writer.Header().Set("Access-Control-Allow-Methods", "DELETE")
		}

		c.Next()
	})

	r.POST("/api/login", authcontroller.Login)
	r.POST("/api/register", authcontroller.Register)
	r.POST("/api/role", authcontroller.Role)
	r.GET("/api/role", authcontroller.GetRole)

	r.GET("/api/kategori", kategoricontroller.Index)
	r.POST("/api/kategori", kategoricontroller.Create)

	r.GET("/api/status", statuscontroller.Index)
	r.POST("/api/status", statuscontroller.Create)

	r.GET("/api/sale", produkcontroller.Sale)

	r.GET("/api/produk", produkcontroller.Index)
	r.POST("/api/produk", produkcontroller.Create)
	r.GET("/api/produk/:id", func(ctx *gin.Context) {
		produkcontroller.ById(ctx, ctx.Param("id"))
	})
	r.PUT("/api/produk/:id", func(ctx *gin.Context) {
		produkcontroller.Edit(ctx, ctx.Param("id"))
	})
	r.DELETE("/api/produk/:id", func(ctx *gin.Context) {
		produkcontroller.Delete(ctx, ctx.Param("id"))
	})

	r.Run()
}