package models

import (
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDatabase(){
	dsn := "host=localhost user=postgres password=alfan12345 dbname=postgres port=5432"
    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
    
    if err !=nil {
        panic("failed to connect database")
    }

    db.AutoMigrate(&Produk{}, &Kategori{}, &Status{}, &Satuan{})

    DB = db
}