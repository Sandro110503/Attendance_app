import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
        backgroundColor: const Color(0xFF88CC88), // Hijau muda
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Aplikasi Absensi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Versi 1.0.0',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Aplikasi Absensi adalah solusi sederhana dan intuitif untuk mencatat kehadiran secara digital. '
              'Dengan antarmuka yang mudah digunakan, pengguna dapat mencatat nama, NIM, kelas, dan waktu kehadiran '
              'dengan cepat. Data absensi disimpan dan dapat diakses melalui fitur riwayat.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Fitur Utama:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '- Input nama, NIM, dan kelas.\n'
              '- Rekap absensi real-time.\n'
              '- Riwayat absensi dengan tampilan menarik.\n'
              '- Navigasi mudah dan antarmuka ramah pengguna.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pengembang:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Aplikasi ini bertujuan untuk membantu mencatat '
              'kehadiran dengan lebih efisien dan ramah lingkungan tanpa menggunakan kertas.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
