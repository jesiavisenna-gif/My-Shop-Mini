Berikut **daftar lengkap widget penting** yang digunakan dalam project beserta **fungsi-fungsi utamanya**, ditulis ringkas, jelas, dan rapi seperti laporan tugas akhir.

---

# **📘 Daftar Widget dan Fungsinya (Final Version)**

## **1. `MaterialApp`**

**Fungsi:**
Sebagai root aplikasi. Mengatur navigasi, tema, dan halaman pertama (StartScreen atau HomeScreen).

---

## **2. `Scaffold`**

**Fungsi:**
Kerangka dasar halaman, menyediakan struktur seperti `body`, `appBar`, dan background transparan agar layer sky & clouds tetap terlihat.

---

## **3. `SafeArea`**

**Fungsi:**
Menjaga seluruh konten agar tidak tertutup notch, kamera, status bar.

---

## **4. `GrowtopiaBackground` (Custom Widget)**

**Fungsi:**
Membangun background bergaya Growtopia:

* Lapisan langit (sky)
* Animasi awan acak bergerak terus
* Lapisan tanah (ground)
* Area child untuk menampilkan halaman di atas background

Widget ini memberi tampilan dunia Growtopia yang hidup.

---

## **5. `GrowtopiaClouds` (Custom Widget)**

**Fungsi:**
Menghasilkan beberapa awan dengan:

* posisi acak
* kecepatan acak
* ukuran acak
* looping otomatis tanpa hentian
  Membuat animasi awan natural seperti game.

---

## **6. `GrowtopiaBackButton` (Custom Widget)**

**Fungsi:**
Tombol kembali bergaya Growtopia:

* kotak putih pixel dengan border hitam
* ikon panah
* bisa dipanggil di semua halaman
  Untuk admin, tombol ini sekaligus fungsi logout spesifik.

---

## **7. `GrowtopiaMenuButton` (Custom Widget)**

**Fungsi:**
Tombol besar bergaya Growtopia pada HomeScreen:

* gambar icon kategori
* animasi kecil saat ditekan
* digunakan memilih kategori: Makanan, Minuman, Elektronik.

---

## **8. `GrowtopiaVendingSlot` (Custom Widget)**

**Fungsi:**
Slot item vending yang ditampilkan di GridView:

* tampilan menyerupai block Growtopia
* icon item di tengah
* label nama muncul dengan *floating tooltip* saat pointer berada di atas
* digunakan di halaman ProductListScreen

---

## **9. `StartScreen`**

**Fungsi:**
Halaman pembuka aplikasi:

* Background Growtopia
* Tombol kecil “Login” (admin saja)
* Tombol utama “Let’s Start” → menuju HomeScreen dan memulai BGM
  Tempat user umum memulai aplikasi.

---

## **10. `LoginScreen`**

**Fungsi:**
Halaman login admin:

* Input nickname dan password
* Validasi `admin/admin`
* Jika benar → masuk ke HomeScreen sebagai Moderator
* Jika salah → menampilkan alert

---

## **11. `HomeScreen`**

**Fungsi:**
Halaman utama toko:

* Menampilkan tiga kategori dalam bentuk `GrowtopiaMenuButton`
* Judul berubah menjadi

  * *“MyShop Mini”* untuk user
  * *“Hello, @Moderator”* (warna orange) untuk admin
* Menyediakan tombol logout atau kembali sesuai role.

---

## **12. `GridView.builder`**

**Fungsi:**
Menampilkan daftar item secara responsif dalam grid 3 kolom.
Memudahkan user/admin menelusuri banyak item sekaligus.

---

## **13. `AlertDialog`**

**Fungsi:**
Memberikan dialog interaksi penting:

* Tambah item
* Edit item
* Konfirmasi hapus item
* Peringatan login gagal
  Menjaga alur CRUD tetap aman & terstruktur.

---

## **14. `TextField`**

**Fungsi:**
Digunakan admin untuk mengedit:

* nama item
* harga item
* memasukkan username/password saat login
  User biasa hanya melihat nilai tanpa bisa mengedit.

---

## **15. `SnackBar`**

**Fungsi:**
Menampilkan notifikasi ringan setelah aksi:

* “Item berhasil ditambahkan”
* “Item berhasil disimpan”
* “Item berhasil dihapus”

---

## **16. `Navigator` / `MaterialPageRoute` / `PageRouteBuilder`**

**Fungsi:**
Mengatur perpindahan halaman:

* Slide-in animation untuk berpindah kategori → detail
* Pop-up transition untuk kembali
* PushReplacement untuk berpindah dari Start → Home
* pushAndRemoveUntil untuk logout atau setelah simpan/hapus item

---

## **17. `ProductDetailScreen`**

**Fungsi:**
Halaman khusus setiap item:

* Menampilkan icon, nama, harga
* Jika admin login, halaman berubah menjadi mode edit:

  * Ganti nama
  * Ganti harga
  * Random icon sesuai kategori
  * Tombol simpan perubahan
  * Tombol hapus item
* User biasa melihat tampilan yang sudah dirapikan & center layout

---

## **18. `AuthController` (Controller)**

**Fungsi:**
Mengatur sistem login sederhana:

* Menyimpan status login admin
* Validasi username dan password
* Logout otomatis pada kondisi tertentu

---

## **19. `BGMController` (Controller)**

**Fungsi:**
Memutar musik latar (BGM) secara looping setelah user menekan tombol Start.

---

# **Kesimpulan**

Seluruh project ini dibangun menggunakan kombinasi:
✔ Widget bawaan Flutter
✔ Widget custom bergaya Growtopia
✔ Controller untuk login & music
✔ Dummy data + CRUD realtime

Sehingga menghasilkan aplikasi toko mini dengan nuansa Growtopia, lengkap dengan:
⭐ animasi awan alami
⭐ background responsif
⭐ sistem login admin
⭐ CRUD item
⭐ UI vending block yang interaktif
⭐ musik latar
⭐ navigasi halus
⭐ layout rapi untuk user & admin
