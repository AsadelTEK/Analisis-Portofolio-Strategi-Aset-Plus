
# Analisis Portofolio: Strategi Aset Plus

## Deskripsi Program

"Analisis Portofolio: Strategi Aset Plus" adalah aplikasi berbasis web yang dirancang untuk membantu pengguna dalam melakukan analisis portofolio investasi. Aplikasi ini dibangun menggunakan framework CodeIgniter, Bootstrap untuk frontend, dan MySQL atau SQLite sebagai basis data. Pengguna dapat membuat, mengelola, dan menganalisis portofolio aset mereka dengan mudah.

### Fitur Utama
- **Manajemen Pengguna:** Registrasi dan login untuk mengakses fitur aplikasi.
- **Manajemen Portofolio:** Membuat, mengedit, dan menghapus portofolio investasi.
- **Manajemen Aset:** Menambah, mengelola, dan memantau aset investasi dalam portofolio.
- **Analisis Risiko dan Return:** Menghitung kinerja portofolio berdasarkan indikator risiko dan return.
- **Visualisasi Data:** Menyediakan visualisasi alokasi aset dan performa portofolio.

## Instalasi pada GitHub Codespace

Berikut adalah langkah-langkah untuk menginstal aplikasi ini menggunakan GitHub Codespace:

### 1. Buat Codespace dari Repository
1. Buka repository di GitHub.
2. Klik tombol `Code` dan pilih `Open with Codespaces`.
3. Jika ini pertama kali menggunakan Codespaces, klik `New Codespace` untuk membuat environment baru.

### 2. Clone Repository
1. Setelah Codespace terbuka, jalankan perintah berikut di terminal untuk meng-clone repository:
    ```bash
    git clone <repository-url> portfolio_analysis
    ```
2. Masuk ke dalam direktori proyek:
    ```bash
    cd portfolio_analysis
    ```

### 3. Pilih Database: MySQL atau SQLite

#### a. Instalasi Menggunakan MySQL
1. Jalankan script setup untuk MySQL:
    ```bash
    bash setup_ci_portfolio_analysis.sh
    ```
2. Buat database baru di MySQL dengan nama `portfolio_analysis`.
3. Impor file SQL untuk skema database:
    ```bash
    mysql -u root -p portfolio_analysis < /mnt/data/portfolio_analysis_schema.sql
    ```
4. Ubah konfigurasi database pada file `.env`:
    ```
    database.default.hostname = localhost
    database.default.database = portfolio_analysis
    database.default.username = root
    database.default.password = <password-anda>
    ```

#### b. Instalasi Menggunakan SQLite
1. Jalankan script setup untuk SQLite:
    ```bash
    bash setup_ci_portfolio_analysis_sqlite.sh
    ```
2. Script ini akan membuat file database `portfolio_analysis.db` di direktori `writable/database`.
3. Ubah konfigurasi database pada file `.env`:
    ```
    database.default.DBDriver = SQLite3
    database.default.database = writable/database/portfolio_analysis.db
    ```

### 4. Jalankan Aplikasi
1. Jalankan server pengembangan CodeIgniter dengan perintah berikut:
    ```bash
    php spark serve
    ```
2. Buka browser dan akses `http://localhost:8080` untuk melihat aplikasi berjalan.

### 5. Catatan Tambahan
- Pastikan environment Codespace memiliki `PHP`, `MySQL` (jika menggunakan MySQL), dan `Composer` yang terinstal.
- Anda bisa mengedit dan menambah fitur sesuai kebutuhan Anda.

Jika ada pertanyaan atau masalah, silakan buka [Issues](https://github.com/username/repository/issues) atau hubungi kami melalui email.

## Kontribusi
Kami menyambut kontribusi dari siapa saja. Silakan buat pull request atau diskusikan ide Anda melalui fitur issues.

## Lisensi
Program ini dilindungi oleh hak cipta dari Niki Kristiani Gulo, Helita Br Sitorus, Jayanti Mandasari, Della Adellia, Andy Ismail, dan Rike Setiawati. Semua hak cipta dilindungi.
