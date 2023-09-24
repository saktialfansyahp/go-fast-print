package models

type ProdukInput struct {
	Id          int64  `gorm:"primaryKey" json:"id"`
	Nama_Produk string `gorm:"type:varchar(255);not null" json:"nama_produk"`
	Harga       int64  `gorm:"type:int;not null" json:"harga"`
	KategoriID  int64  `json:"kategori_id"`
	StatusID    int64  `json:"status_id"`
}

type ProdukResponse struct {
	Id          int64  `gorm:"primaryKey" json:"id_produk"`
	Nama_Produk string `gorm:"type:varchar(255);not null" json:"nama_produk"`
	Harga       int64  `gorm:"type:int;not null" json:"harga"`
	Kategori    string `json:"kategori"`
	Status      string `json:"status"`
}

type Produk struct {
	Id          int64    `gorm:"primaryKey" json:"id"`
	Nama_Produk string   `gorm:"type:varchar(255);not null" json:"nama_produk"`
	Harga       int64    `gorm:"type:int;not null" json:"harga"`
	KategoriID  int64    `json:"kategori_id"`
	Kategori    Kategori `gorm:"foreignKey:KategoriID"`
	StatusID    int64    `json:"status_id"`
	Status      Status   `gorm:"foreignKey:StatusID"`
}

type Kategori struct {
	Id       int64  `gorm:"primaryKey" json:"id"`
	Kategori string `gorm:"type:varchar(255)" json:"kategori"`
}

type Status struct {
	Id          int64  `gorm:"primaryKey" json:"id"`
	Nama_Status string `gorm:"type:varchar(255)" json:"nama_status"`
}

type Satuan struct {
	Id          int64  `gorm:"primaryKey" json:"id"`
	Nama_Satuan string `gorm:"type:varchar(255)" json:"nama_satuan"`
}
