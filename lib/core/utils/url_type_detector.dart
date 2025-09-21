enum UrlType { betterPlayer, youtube }

class UrlTypeDetector {
  String url;
  UrlType type;

  UrlTypeDetector(this.url, this.type);

  factory UrlTypeDetector.parse(String url) {
    return UrlTypeDetector(url, UrlType.betterPlayer);
  }
}
