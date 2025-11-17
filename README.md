# 💊 Big Data Analyst Challenge - Kimia Farma Performance Analytics (2020-2023)

## 👤 Peserta
* **Nama:** Mustafid Kaisalana
* **Program:** Project-Based Internship: Performance Analytics - Analisis kinerja bisnis Kimia Farma Tahun 2020-2023

---

## 🎯 Ringkasan Proyek

Proyek ini bertujuan untuk mengevaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023, menggunakan data transaksi, inventaris, kantor cabang, dan produk. Hasil akhir proyek ini adalah Tabel Analisis yang teragregasi di BigQuery dan visualisasi kinerja bisnis dalam bentuk Dashboard di Google Looker Studio.

---

## 🛠️ Tools dan Teknologi

| Teknologi | Tujuan |
| :--- | :--- |
| **Google Cloud Platform (GCP)** | Lingkungan utama untuk hosting data dan komputasi. |
| **BigQuery** | Warehouse data untuk mengimpor *dataset* dan menjalankan *syntax* SQL analisis kinerja. |
| **Google Looker Studio** | Platform untuk membuat *Dashboard Performance Analytics*. |
| **GitHub** | Repositori untuk menyimpan semua *syntax* SQL yang telah dibuat. |

---

## 📂 Struktur Repositori

Repositori ini menyimpan *syntax* SQL yang digunakan untuk pengolahan data di BigQuery.

---

## ⚙️ Detail Pengerjaan (BigQuery SQL)

File utama yang dikumpulkan adalah `SQL/create_analysis_table.sql`. File ini mencakup langkah-langkah berikut:

1.  **Penggabungan Data:** Melakukan operasi `LEFT JOIN` antara `kf_final_transaction`, `kf_kantor_cabang`, dan `kf_product`.
2.  **Perhitungan Metrik:** Menghitung kolom-kolom *mandatory* yang baru:
    * `nett_sales`: Harga setelah diskon[cite: 54].
    * `persentase_gross_laba`: Persentase laba berdasarkan kategori harga jual obat.
    * `nett_profit`: Keuntungan yang diperoleh Kimia Farma.
3.  **Tabel Hasil:** Hasil *query* disimpan sebagai tabel **`kf_analysis_table`** di dalam *dataset* `kimia_farma`.

### Referensi Tabel Sumber:
* `kf_final_transaction`
* `kf_inventory`
* `kf_kantor_cabang` 
* `kf_product`

---

## 📈 Dashboard Performance Analytics

*Dashboard* ini dibuat di Google Looker Studio menggunakan tabel `kf_analysis_table` sebagai sumber data.

**Link Dashboard Looker Studio:** [[Link Looker Studio]](https://lookerstudio.google.com/reporting/1e3486cf-30f1-4ec7-b2f2-333d6cc7b854)

### Komponen Wajib Dashboard:
1.  Judul dan Summary Dashboard.
2.  Filter Control (Tanggal dan Provinsi)
3.  Snapshot Data (KPI utama).
4.  Perbandingan Pendapatan Kimia Farma dari tahun ke tahun.
5.  Top 10 Total transaksi cabang provinsi.
6.  Top 10 Nett sales cabang provinsi.
7.  Top 5 Cabang Dengan Rating Tertinggi, namun Rating Transaksi Terendah.
8.  Indonesia's Geo Map Untuk Total Profit Masing-masing Provinsi.

---

## 🎬 Video Presentasi

**Link Video Presentasi/Penjelasan Proyek:** [Link YouTube / Google Drive Video]

---
