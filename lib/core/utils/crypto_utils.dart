/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

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
