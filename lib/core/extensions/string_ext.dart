import 'dart:convert';
import 'dart:typed_data';

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
}
