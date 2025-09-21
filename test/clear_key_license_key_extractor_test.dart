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

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/clear_key_license_key_extractor.dart';

void main() async {
  group('ClearKeyLicenseKeyExtractorTest', () {
    test('test:1', () async {
      // KASUS SEPERTI INI HARUSNYA LANSUNG RETURN, TAPI DALAM BENTUK MAP
      final String licenseKey = r'''
{"keys":[{"kty":"oct","k":"nnBhYfAvuZy2ktKWVHBJTg","kid":"/GbvDuNbW6Y53A4TxfipEA"}],"type":"temporary"}
''';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

      expect(result.containsKey("keys"), equals(true));
      expect(result["keys"].length, equals(1));
      expect(result["keys"][0]["kty"], equals("oct"));
      expect(result["keys"][0]["k"], equals("nnBhYfAvuZy2ktKWVHBJTg"));
      expect(result["keys"][0]["kid"], equals("/GbvDuNbW6Y53A4TxfipEA"));
    });
  });

  test('test:2', () async {
    final String licenseKey = r'''
{"0020212a47511b226f7cc9d030aa171b":"323c16315e1cb8d7c821facc3c1778a4"}
''';

    final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

    expect(result.containsKey("type"), equals(true));
    expect(result.containsKey("keys"), equals(true));
    expect(result["type"], equals("temporary"));
    expect(result["keys"].length, equals(1));
    expect(result["keys"][0]["kty"], equals("oct"));
    expect(result["keys"][0].containsKey("kid"), equals(true));
    expect(result["keys"][0].containsKey("k"), equals(true));
  });

  test('test:3', () async {
    // KASUS SEPERTI INI HARUSNYA LANSUNG RETURN, TAPI DALAM BENTUK MAP
    final String licenseKey = r'''
{ "keys":[ { "kty":"oct", "k":"OPv7OlbkD/ksnfisvLqe9g", "kid":"/x/r1wGNDdcRYB55Xg1iEA" } ], "type":"temporary" }
''';

    final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

    expect(result.containsKey("keys"), equals(true));
    expect(result.containsKey("type"), equals(true));
    expect(result["keys"].length, equals(1));
    expect(result["type"], equals("temporary"));
  });

  test('test:4', () async {
    final String licenseKey = r'''
f429292dc744f284355308561577ac10:b12e1f894129c517dc8845baaeebec8a
''';

    final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

    expect(result.containsKey("type"), equals(true));
    expect(result.containsKey("keys"), equals(true));
    expect(result["type"], equals("temporary"));
    expect(result["keys"].length, equals(1));
    expect(result["keys"][0]["kty"], equals("oct"));
    expect(result["keys"][0].containsKey("kid"), equals(true));
    expect(result["keys"][0].containsKey("k"), equals(true));
  });

  test('test:5', () async {
    final String licenseKey =
        'https://ck-dash-mpd.aqfadtv.xyz/dash-ck/linear/509';

    final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

    expect(result.containsKey("keys"), equals(true));
    expect(result["keys"].length, greaterThan(0));
  });

  test('test:6', () async {
    final String licenseKey =
        'https://game.denver1769.fun/Jtv/Jtv.php?id=166&keys';

    final result = await ClearKeyLicenseKeyExtractor.extract(
      licenseKey,
      headers: {'user-agent': 'Denver1769'},
    );

    // aku menemukan 1 pola dimana, jika response memiliki key "Developer" dan value.toLower = denver1769, maka
    // kita bisa mengambil clearKey dari key : base64, itu adalah clearKey yang kita butuhkan dan memiliki pattern output yang sama
    // seperti di test:4

    // URL test might fail due to network issues, so we just check that it returns a Map
    expect(result.containsKey("type"), equals(true));
    expect(result.containsKey("keys"), equals(true));
    expect(result["type"], equals("temporary"));
    expect(result["keys"].length, equals(1));
    expect(result["keys"][0]["kty"], equals("oct"));
    expect(result["keys"][0].containsKey("kid"), equals(true));
    expect(result["keys"][0].containsKey("k"), equals(true));
  });
}
