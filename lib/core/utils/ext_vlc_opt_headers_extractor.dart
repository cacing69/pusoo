// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

abstract class ExtVlcOptHeadersExtractor {
  static Map<String, String> extract(List<Map<String, String>> extVlcOpts) {
    final headers = <String, String>{};
    
    for (final extVlcOpt in extVlcOpts) {
      for (final entry in extVlcOpt.entries) {
        final key = entry.key;
        final value = entry.value;
        
        if (key.startsWith('http-')) {
          final headerName = key.substring(5); // Remove 'http-' prefix
          headers[headerName.toLowerCase()] = value; // Convert to lowercase
        } else if (key == 'network-caching') {
          // Convert network-caching to cache-control header
          headers['cache-control'] = 'max-age=$value';
        } else if (key == '-http-reconnect') {
          // Convert --http-reconnect to connection headers
          if (value == 'true') {
            headers['connection'] = 'keep-alive';
            headers['keep-alive'] = 'timeout=5, max=1000';
          }
        }
      }
    }
    
    return headers;
  }
}
