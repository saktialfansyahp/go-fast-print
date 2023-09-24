# Go Fast Print

Selamat datang di Proyek Go Fast Print! Proyek ini berisi implementasi backend untuk layanan Anda. Di bawah ini, Anda akan menemukan informasi tentang cara menjalankan proyek, endpoint yang tersedia, dan bagaimana cara menggunakannya.

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

1. Rute untuk mengambil data kategori.

   ```http
   GET /api/kategori
   ```

2. Rute untuk menambah data kategori.

   ```http
   POST /api/kategori
   ```

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

4. Rute untuk menambah data status.

   ```http
   POST /api/status
   ```

   Body (Json)

   ```sh
   {
      "nama_status": "Nama Status"
   }
   ```

5. Rute untuk mengambil data produk.

   ```http
   GET /api/produk
   ```

6. Rute untuk menambah data produk.

   ```http
   POST /api/produk
   ```

   Body (Json)

   ```sh
   {
      "nama_produk": "Nama Produk",
      "harga": "Harga",
      "kategori_id": "ID Kategori",
      "status_id": "ID Status",
   }
   ```

7. Rute untuk mengubah data produk berdasarkan id.

   ```http
   PUT /api/produk/:id
   ```

   Body (Json)

   ```sh
   {
      "nama_produk": "Nama Produk",
      "harga": "Harga",
      "kategori_id": "ID Kategori",
      "status_id": "ID Status",
   }
   ```

8. Rute untuk menghapus data produk berdasarkan id.

   ```http
   DELETE /api/produk/:id
   ```

9. Rute untuk mengambil data produk yang bisa dijual.

   ```http
   GET /api/sale
   ```

10. Rute untuk mengambil data produk berdasarkan id.

    ```http
    GET /api/produk/:id
    ```
