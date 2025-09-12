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
}
