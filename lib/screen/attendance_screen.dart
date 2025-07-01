import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// List global untuk menyimpan riwayat
List<String> attendanceHistory = [];

class StudyScreen extends StatelessWidget {
  const StudyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Mata Pelajaran'),
        centerTitle: true,
        backgroundColor: const Color(0xFF88CC88), // Hijau muda
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Mata Pelajaran 1
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Matematika'),
              subtitle: const Text('Kelas untuk belajar Matematika'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(subject: 'Matematika'),
                    ),
                  );
                },
                child: const Text('Masuk Kelas'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Mata Pelajaran 2
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Fisika'),
              subtitle: const Text('Kelas untuk belajar Fisika'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(subject: 'Fisika'),
                    ),
                  );
                },
                child: const Text('Masuk Kelas'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Mata Pelajaran 3
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Kimia'),
              subtitle: const Text('Kelas untuk belajar Kimia'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(subject: 'Kimia'),
                    ),
                  );
                },
                child: const Text('Masuk Kelas'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Mata pelajaran 4
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Bahasa Inggris'),
              subtitle: const Text('Kelas untuk belajar Bahasa Inggris'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(subject: 'Bahasa Inggris'),
                    ),
                  );
                },
                child: const Text('Masuk Kelas'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Mata Pelajaran 5
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Sistem Operasi'),
              subtitle: const Text('Kelas untuk belajar Sistem Operasi'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(subject: 'Sistem Operasi'),
                    ),
                  );
                },
                child: const Text('Masuk Kelas'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Mata Pelajaran 6
          Card(
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Jaringan Komputer'),
              subtitle: const Text('Kelas untuk belajar Jaringan Komputer'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(subject: 'Jaringan Komputer'),
                    ),
                  );
                },
                child: const Text('Masuk Kelas'),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  final String subject;

  const AttendanceScreen({Key? key, required this.subject}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  final _classController = TextEditingController();

  bool isAttendanceDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi - ${widget.subject}'),
        centerTitle: true,
        backgroundColor: const Color(0xFF88CC88), // Hijau muda
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!isAttendanceDone) ...[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _classController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  final nim = _nimController.text;
                  final studentClass = _classController.text;

                  if (name.isEmpty || nim.isEmpty || studentClass.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Semua bidang harus diisi!')),
                    );
                  } else {
                    final currentTime =
                        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                    setState(() {
                      attendanceHistory.add(
                          '$currentTime - ${widget.subject} - $name ($nim) - $studentClass - Hadir');
                      isAttendanceDone = true;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceConfirmationScreen(
                          subject: widget.subject,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF88CC88),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Kirim',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ] else ...[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Absensi berhasil untuk ${widget.subject}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('Kembali ke Beranda'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AttendanceConfirmationScreen extends StatelessWidget {
  final String subject;

  const AttendanceConfirmationScreen({Key? key, required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Absensi'),
        centerTitle: true,
        backgroundColor: const Color(0xFF88CC88), // Hijau muda
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green.shade700,
              size: 100,
            ),
            const SizedBox(height: 16),
            Text(
              'Absensi berhasil untuk mata pelajaran:',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subject,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }
}
