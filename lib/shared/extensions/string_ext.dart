/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
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

extension StringExt on String {
  String capitalizeWords() {
    // ubah semua huruf jadi kecil dulu
    String lower = toLowerCase();

    // ganti huruf pertama setelah spasi atau tanda baca menjadi kapital
    return lower.replaceAllMapped(
      RegExp(r'(^|[\s\(\[\{\,\.\!\?;:])([a-zA-Z])'),
      (Match match) {
        return match.group(1)! + match.group(2)!.toUpperCase();
      },
    );
  }

  // String toBase64() {
  //   return base64Encode(utf8.encode(this));
  // }

  String hexToBase64() {
    // Convert hex string to a list of integers (bytes)
    final bytes = <int>[];
    for (int i = 0; i < length; i += 2) {
      bytes.add(int.parse(substring(i, i + 2), radix: 16));
    }

    // Base64 encode the bytes and make it URL-safe
    return base64Url.encode(bytes);
  }

  bool isValidUrl() {
    final uri = Uri.tryParse(this);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  String getHostUrl() {
    final s = trim();
    if (s.isEmpty) throw Exception("String is empty");

    Uri uri;
    try {
      uri = Uri.parse(s);
      // Jika tidak ada scheme, tambahkan http sebagai default lalu parse ulang
      if (!uri.hasScheme) {
        uri = Uri.parse('https://$s');
      }
    } catch (e) {
      throw Exception("String is not a valid URL: $e");
    }

    if (uri.host.isEmpty) {
      throw Exception("URL has no host");
    }

    return uri.host;
  }
}
