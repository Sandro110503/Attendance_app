import 'package:flutter/material.dart';
import 'attendance_screen.dart'; // Import untuk akses attendanceHistory

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Absensi'),
        centerTitle: true,
        backgroundColor: const Color(0xFF88CC88), // Hijau muda
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Kehadiran:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: attendanceHistory.length,
                itemBuilder: (context, index) {
                  final entry = attendanceHistory[index].split(' - ');
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      tileColor: const Color(0xFFE8F5E9), // Hijau sangat muda
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF88CC88),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        entry[0], // Tanggal dan waktu
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${entry[1]} - ${entry[2]}\nStatus: ${entry[3]}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
