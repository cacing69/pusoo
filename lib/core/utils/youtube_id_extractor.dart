class YoutubeIdExtractor {
  final String? videoId;
  final String? url;

  YoutubeIdExtractor({this.videoId, this.url});

  /// Factory constructor to extract YouTube video ID from URL
  factory YoutubeIdExtractor.fromUrl(String url) {
    final videoId = extract(url);
    return YoutubeIdExtractor(videoId: videoId, url: url);
  }

  static String? extract(String url) {
    String? videoId;
    RegExp regExp;

    // Regex for YouTube watch URLs (e.g., https://www.youtube.com/watch?v=dQw4w9WgXcQ)
    regExp = RegExp(
      r"^(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/|v\/|)([\w-]{11})(?:\S+)?$",
    );
    Match? match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      videoId = match.group(1);
    }

    return videoId;
  }

  /// Checks if video ID was successfully extracted
  bool get hasVideoId => videoId != null && videoId!.isNotEmpty;
}
