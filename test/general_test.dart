// Copyright (c) 2025, Ibnul Mutaki (@cacing69)
// Licensed under the MIT License
// Pusoo - Open Source IPTV Player
// GitHub: https://github.com/cacing69/pusoo

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/features/source/data/const/iptv_org/iptv_org_list_countries.dart';

void main() async {
  group('GeneralTest', () {
    test('test:1:listCountryShouldHave188Length', () async {
      final result = iptvOrgListCountries;

      expect(result.length, equals(188));
    });
  });
}
