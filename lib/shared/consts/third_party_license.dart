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

class ThirdPartyLicense {
  final String name;
  final String license;
  final String url;

  ThirdPartyLicense({
    required this.name,
    required this.license,
    required this.url,
  });
}

List<ThirdPartyLicense> thirdPartyLicenses = [
  // Core Flutter
  ThirdPartyLicense(
    name: "Flutter",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/flutter",
  ),
  ThirdPartyLicense(
    name: "Flutter Localizations",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/flutter",
  ),

  // UI Framework
  ThirdPartyLicense(
    name: "Forui",
    license: "MIT License",
    url: "https://github.com/forus-labs/forui",
  ),

  // Navigation & State Management
  ThirdPartyLicense(
    name: "Go Router",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/packages/tree/main/packages/go_router",
  ),
  ThirdPartyLicense(
    name: "Hooks Riverpod",
    license: "MIT License",
    url: "https://github.com/rrousselGit/riverpod",
  ),
  ThirdPartyLicense(
    name: "Flutter Hooks",
    license: "MIT License",
    url: "https://github.com/rrousselGit/flutter_hooks",
  ),
  ThirdPartyLicense(
    name: "Riverpod Annotation",
    license: "MIT License",
    url: "https://github.com/rrousselGit/riverpod",
  ),
  ThirdPartyLicense(
    name: "Flutter Riverpod",
    license: "MIT License",
    url: "https://github.com/rrousselGit/riverpod",
  ),

  // HTTP & API
  ThirdPartyLicense(
    name: "Retrofit",
    license: "Apache-2.0",
    url: "https://github.com/trevorwang/retrofit.dart",
  ),
  ThirdPartyLicense(
    name: "HTTP",
    license: "BSD-3-Clause",
    url: "https://github.com/dart-lang/http",
  ),
  ThirdPartyLicense(
    name: "Dio",
    license: "MIT License",
    url: "https://github.com/cfug/dio",
  ),

  // Database
  ThirdPartyLicense(
    name: "Drift",
    license: "MIT License",
    url: "https://github.com/simolus3/drift",
  ),
  ThirdPartyLicense(
    name: "Drift Flutter",
    license: "MIT License",
    url: "https://github.com/simolus3/drift",
  ),

  // Storage & Preferences
  ThirdPartyLicense(
    name: "Path Provider",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/packages/tree/main/packages/path_provider",
  ),
  ThirdPartyLicense(
    name: "Shared Preferences",
    license: "BSD-3-Clause",
    url:
        "https://github.com/flutter/packages/tree/main/packages/shared_preferences",
  ),
  ThirdPartyLicense(
    name: "Hive CE",
    license: "Apache-2.0",
    url: "https://github.com/hivedb/hive",
  ),
  ThirdPartyLicense(
    name: "Hive CE Flutter",
    license: "Apache-2.0",
    url: "https://github.com/hivedb/hive",
  ),

  // Utilities
  ThirdPartyLicense(
    name: "ULID",
    license: "MIT License",
    url: "https://github.com/agilord/ulid",
  ),
  ThirdPartyLicense(
    name: "Gap",
    license: "MIT License",
    url: "https://github.com/orestesgao/gap",
  ),
  ThirdPartyLicense(
    name: "Cached Network Image",
    license: "MIT License",
    url: "https://github.com/BaseflowIT/flutter-cached-network-image",
  ),
  ThirdPartyLicense(
    name: "Country Flags",
    license: "MIT License",
    url: "https://github.com/ekleel/country_flags",
  ),
  ThirdPartyLicense(
    name: "URL Launcher",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/packages/tree/main/packages/url_launcher",
  ),
  ThirdPartyLicense(
    name: "Intl",
    license: "BSD-3-Clause",
    url: "https://github.com/dart-lang/intl",
  ),
  ThirdPartyLicense(
    name: "Skeletonizer",
    license: "MIT License",
    url: "https://github.com/orestesgao/skeletonizer",
  ),
  ThirdPartyLicense(
    name: "Envied",
    license: "MIT License",
    url: "https://github.com/orestesgao/envied",
  ),
  ThirdPartyLicense(
    name: "Jiffy",
    license: "MIT License",
    url: "https://github.com/jama5262/jiffy",
  ),
  ThirdPartyLicense(
    name: "Infinite Scroll Pagination",
    license: "MIT License",
    url: "https://github.com/EdsonBueno/infinite_scroll_pagination",
  ),
  ThirdPartyLicense(
    name: "Flutter Toast",
    license: "MIT License",
    url: "https://github.com/ponnamkarthik/FlutterToast",
  ),
  ThirdPartyLicense(
    name: "Logger",
    license: "MIT License",
    url: "https://github.com/leisim/logger",
  ),
  ThirdPartyLicense(
    name: "Dartz",
    license: "MIT License",
    url: "https://github.com/spebbe/dartz",
  ),
  ThirdPartyLicense(
    name: "Flutter Debouncer",
    license: "MIT License",
    url: "https://github.com/orestesgao/flutter_debouncer",
  ),
  ThirdPartyLicense(
    name: "Crypto",
    license: "BSD-3-Clause",
    url: "https://github.com/dart-lang/crypto",
  ),
  ThirdPartyLicense(
    name: "Flutter SVG",
    license: "MIT License",
    url: "https://github.com/dnfield/flutter_svg",
  ),
  ThirdPartyLicense(
    name: "Package Info Plus",
    license: "BSD-3-Clause",
    url:
        "https://github.com/fluttercommunity/plus_plugins/tree/main/packages/package_info_plus",
  ),
  ThirdPartyLicense(
    name: "Wakelock Plus",
    license: "BSD-3-Clause",
    url:
        "https://github.com/fluttercommunity/wakelock_plus/tree/main/wakelock_plus",
  ),

  // Video & Media
  ThirdPartyLicense(
    name: "YouTube Player iFrame",
    license: "MIT License",
    url: "https://github.com/ayushagarwal2000/youtube_player_iframe",
  ),
  ThirdPartyLicense(
    name: "Better Player Plus",
    license: "MIT License",
    url: "https://github.com/jhomlala/betterplayer",
  ),

  // Code Generation & Serialization
  ThirdPartyLicense(
    name: "Freezed",
    license: "MIT License",
    url: "https://github.com/rrousselGit/freezed",
  ),
  ThirdPartyLicense(
    name: "Freezed Annotation",
    license: "MIT License",
    url: "https://github.com/rrousselGit/freezed",
  ),
  ThirdPartyLicense(
    name: "JSON Annotation",
    license: "BSD-3-Clause",
    url: "https://github.com/google/json_serializable.dart",
  ),
  ThirdPartyLicense(
    name: "JSON Serializable",
    license: "BSD-3-Clause",
    url: "https://github.com/google/json_serializable.dart",
  ),

  // App Configuration
  ThirdPartyLicense(
    name: "Flutter Launcher Icons",
    license: "MIT License",
    url: "https://github.com/fluttercommunity/flutter_launcher_icons",
  ),

  // Development Tools
  ThirdPartyLicense(
    name: "Flutter Lints",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/packages/tree/main/packages/flutter_lints",
  ),
  ThirdPartyLicense(
    name: "Pretty Dio Logger",
    license: "MIT License",
    url: "https://github.com/Milad-Akarie/pretty_dio_logger",
  ),
  ThirdPartyLicense(
    name: "Build Runner",
    license: "BSD-3-Clause",
    url: "https://github.com/dart-lang/build",
  ),
  ThirdPartyLicense(
    name: "Custom Lint",
    license: "MIT License",
    url: "https://github.com/invertase/custom_lint",
  ),
  ThirdPartyLicense(
    name: "Google Fonts",
    license: "BSD-3-Clause",
    url: "https://github.com/flutter/packages/tree/main/packages/google_fonts",
  ),
];
