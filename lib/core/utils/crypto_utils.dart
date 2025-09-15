import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Fungsi untuk membuat signature data tanpa secret key.
/// Berguna untuk memverifikasi integritas data.
///
/// Argumen:
/// - `data`: List of string yang akan di-hash.
/// - `separator`: Karakter pemisah antar string (default: '-').
String generateBasicSignature(List<String> data, {String separator = '-'}) {
  // 1. Gabungkan semua string menjadi satu.
  final combinedString = data.join(separator);

  // 2. Ubah string menjadi bytes.
  final bytes = utf8.encode(combinedString);

  // 3. Hitung hash SHA-256 dari bytes.
  final digest = sha256.convert(bytes);

  // 4. Kembalikan hash dalam bentuk string heksadesimal.
  return digest.toString();
}
