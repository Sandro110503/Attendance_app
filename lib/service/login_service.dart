
class LoginService {
  // Dummy data untuk login
  static const String _dummyEmail = 'admin';
  static const String _dummyPassword = 'admin';

  // Fungsi login
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulasi proses login

    // Cek apakah email dan password sesuai
    if (email == _dummyEmail && password == _dummyPassword) {
      return true; // Login berhasil
    } else {
      return false; // Login gagal
    }
  }
}
