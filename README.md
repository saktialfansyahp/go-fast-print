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

5. Import SQL

   Import SQL dengan nama fastprint.sql ke dalam database postgreSQL

6. Konfigurasi PostgreSQL (Golang)

   Untuk menyesuaikan konfigurasi PostgreSQL pada proyek Golang menggunakan GORM:

   Gantilah variabel dsn pada file setup.go dengan konfigurasi yang sesuai:

   ```sh
   dsn := "host=your_host user=your_user password=your_password dbname=your_db port=5432 sslmode=disable TimeZone=Asia/Jakarta"
   ```

7. Setelah dependensi terinstal, database telah di konfigurasi lalu jalankan perintah berikut untuk memulai server:

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

## Header Custom yang Diberikan

Website ini menggunakan beberapa header kustom yang perlu diperhatikan untuk pengelolaan permintaan HTTP. Berikut adalah beberapa header beserta penjelasan masing-masing:

### Access-Control-Allow-Headers:

Nilai: Content-Type, Authorization
Keterangan: Header ini memungkinkan server untuk menerima permintaan yang memiliki header Content-Type dan Authorization.

### Access-Control-Allow-Methods:

Nilai: GET
Keterangan: Header ini mengizinkan metode HTTP GET untuk digunakan dalam permintaan.

### Access-Control-Allow-Origin:

Nilai: http://localhost:8081
Keterangan: Header ini mengizinkan akses permintaan dari domain yang diberikan (localhost pada port 8081).

### Cache-Control:

Nilai: no-cache, no-store, max-age=0, must-revalidate
Keterangan: Header ini mengendalikan perilaku caching, memastikan konten tidak disimpan dalam cache.

### Connection:

Nilai: keep-alive
Keterangan: Header ini mengindikasikan bahwa koneksi harus dijaga agar tetap terbuka setelah merespons permintaan.

### Content-Type:

Nilai: application/json; charset=utf-8
Keterangan: Header ini memberikan informasi mengenai tipe konten yang dikirim dalam respons, yaitu JSON dengan pengodean karakter UTF-8.

### Date:

Nilai: Sun, 24 Sep 2023 15:07:22 GMT
Keterangan: Header ini menunjukkan waktu saat respons HTTP dihasilkan.

### Pragma:

Nilai: no-cache
Keterangan: Header ini menginstruksikan agen pengguna untuk tidak menggunakan cache saat memproses respons.

### Server:

Nilai: golang
Keterangan: Header ini menyatakan server yang digunakan (GoLang dalam hal ini).

### Set-Cookie:

Nilai: ci_session=sXhNYptpnUXQZUBk9uacp3g95X08cUGvK1tBkDq2hu4=; Path=/; Expires=Session; HttpOnly;
Keterangan: Header ini digunakan untuk mengirim informasi tentang cookie yang harus diatur pada sisi klien.

### Strict-Transport-Security:

Nilai: max-age=31536000
Keterangan: Header ini menginstruksikan browser untuk selalu menggunakan HTTPS selama periode waktu tertentu (dalam detik).

### Transfer-Encoding:

Nilai: chunked
Keterangan: Header ini mengindikasikan bahwa konten dikirim dalam bagian-bagian "chunked".

### X-Credentials-Username:

Nilai: tesprogrammer230923C02
Keterangan: Header ini menampilkan nama pengguna yang dihasilkan secara dinamis berdasarkan waktu server.

### X-Credentials-Password:

Nilai: md5 dari = bisacoding-'tanggal sekarang (angka)'-'bulan sekarang (angka)'-'2 digit terakhir tahun sekarang (angka)'
Keterangan: Header ini menyediakan informasi terenkripsi terkait kata sandi.

### X-Powered-By:

Nilai: it-programmer
Keterangan: Header ini memberikan informasi tentang teknologi yang digunakan untuk menggerakkan website ini.

# Note

Pastikan untuk menjalankan server backend terlebih dahulu
