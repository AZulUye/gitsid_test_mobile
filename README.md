# GITS ID Problem Solving Test - Mobile (Dart)

## Analisis Kompleksitas Kode Program Balanced Brackets

### Penjelasan Time Complexity

Time Complexity pada program ini adalah O(n), dimana n adalah panjang dari string input. Program berjalan dengan linear time karena harus memeriksa setiap karakter dalam string input tepat satu kali. Setiap karakter yang diperiksa melakukan operasi dasar seperti penambahan ke stack atau pengecekan pasangan bracket yang membutuhkan waktu konstan O(1).

### Penjelasan Space Complexity

Space Complexity pada program ini adalah O(n) karena menggunakan struktur data stack untuk menyimpan bracket. Dalam worst scenario, stack akan menyimpan setengah dari jumlah karakter input (semua bracket pembuka).
