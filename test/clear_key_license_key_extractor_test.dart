import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/core/utils/clear_key_license_key_extractor.dart';
import 'package:pusoo/core/utils/stream_headers_extractor.dart';

void main() async {
  group('ClearKeyLicenseKeyExtractorTest', () {
    test('test:1', () async {
      final String licenseKey = r'''
{"keys":[{"kty":"oct","k":"v34bl1VcSst0VfcRsqn/Fg","kid":"G2GKKRzs5EyYRd3fxP2bEA"}],"type":"temporary"}
''';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

      expect(true, equals(result.containsKey("kty")));
      expect(true, equals(result.containsKey("k")));
      expect(true, equals(result.containsKey("kid")));

      expect("oct", equals(result["kty"]));
      expect("v34bl1VcSst0VfcRsqn/Fg", equals(result["k"]));
      expect("G2GKKRzs5EyYRd3fxP2bEA", equals(result["kid"]));
    });
  });

  group('ClearKeyLicenseKeyExtractorTest', () {
    test('test:2', () async {
      final String licenseKey = r'''
{"0020212a47511b226f7cc9d030aa171b":"323c16315e1cb8d7c821facc3c1778a4"}
''';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

      expect(true, equals(result.containsKey("kty")));
      expect(true, equals(result.containsKey("k")));
      expect(true, equals(result.containsKey("kid")));
    });
  });

  group('ClearKeyLicenseKeyExtractorTest', () {
    test('test:3', () async {
      final String licenseKey = r'''
{"keys":[{"kty":"oct","k":"v34bl1VcSst0VfcRsqn/Fg","kid":"G2GKKRzs5EyYRd3fxP2bEA"}],"type":"temporary"}
''';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

      expect(true, equals(result.containsKey("kty")));
      expect(true, equals(result.containsKey("k")));
      expect(true, equals(result.containsKey("kid")));

      expect("oct", equals(result["kty"]));
      expect("v34bl1VcSst0VfcRsqn/Fg", equals(result["k"]));
      expect("G2GKKRzs5EyYRd3fxP2bEA", equals(result["kid"]));
    });

    test('test:4', () async {
      final String licenseKey = r'''
f429292dc744f284355308561577ac10:b12e1f894129c517dc8845baaeebec8a
''';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

      expect(true, equals(result.containsKey("kty")));
      expect(true, equals(result.containsKey("k")));
      expect(true, equals(result.containsKey("kid")));
    });

    test('test:5', () async {
      final String licenseKey = 'https://ck-dash-mpd.aqfadtv.xyz/dash-ck/linear/509';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey);

      expect(true, equals(result.containsKey("kty")));
      expect(true, equals(result.containsKey("k")));
      expect(true, equals(result.containsKey("kid")));
    });

    test('test:6', () async {
      final String licenseKey = 'https://game.denver1769.fun/Jtv/Jtv.php?id=166&keys';

      final result = await ClearKeyLicenseKeyExtractor.extract(licenseKey, headers: {
        'user-agent': 'Denver1769',
      });

      expect(true, equals(result.containsKey("kty")));
      expect(true, equals(result.containsKey("k")));
      expect(true, equals(result.containsKey("kid")));
    });

    
  });
}
