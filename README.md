# Go Rest Api

Selamat datang di Proyek Go Rest Api! Proyek ini berisi implementasi backend untuk layanan Anda. Di bawah ini, Anda akan menemukan informasi tentang cara menjalankan proyek, endpoint yang tersedia, dan bagaimana cara menggunakannya.

## Menjalankan Proyek

1. Pastikan Anda memiliki Go (Golang) diinstal pada mesin Anda.
2. Clone repositori ini ke direktori lokal Anda.
3. Buka terminal dan navigasikan ke direktori repositori yang baru saja Anda klon.
4. Jalankan perintah berikut untuk menginstal dependensi:

   ```sh

   go mod download

   ```

5. Setelah dependensi terinstal, jalankan perintah berikut untuk memulai server:

   ```sh

   go run main.go
   Server akan berjalan pada alamat http://localhost:8080.

   ```

# Endpoint

1. GET /api/kategori Rute untuk mengambil data kategori.
2. POST /api/kategori Rute untuk menambah data kategori.

   Body (Json)

   ```sh
   {
      "kategori": "Nama Kategori"
   }
   ```

3. Rute untuk mengambil data status.

   ```http
   GET /api/status
   ```

4. POST /api/status Rute untuk menambah data status.

   Body (Json)

   ```sh
   {
      "nama_status": "Nama Status"
   }
   ```

5. GET /api/produk Rute untuk mengambil data produk.
6. POST /api/produk Rute untuk menambah data produk.

   Body (Json)

   ```sh
   {
      "nama_produk": "Nama Produk",
      "harga": "Harga",
      "kategori_id": "ID Kategori",
      "status_id": "ID Status",
   }
   ```

7. PUT /api/produk/:id Rute untuk mengubah data produk berdasarkan id.

   Body (Json)

   ```sh
   {
      "nama_produk": "Nama Produk",
      "harga": "Harga",
      "kategori_id": "ID Kategori",
      "status_id": "ID Status",
   }
   ```

8. DELETE /api/produk/:id Rute untuk menghapus data produk berdasarkan id.
9. GET /api/sale Rute untuk mengambil data produk yang bisa dijual.
10. GET /api/produk/:id Rute untuk mengambil data produk berdasarkan id.
