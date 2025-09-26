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

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:pusoo/shared/utils/m3u_parser.dart';

void main() async {
  group('GeneralTest', () {
    test('tmpTest:SampleBoy23:1', () async {
      final file = File('fixtures/sample_boy23.m3u');
      final contentFile = await file.readAsString();

      final String content = contentFile;

      List<Track> result = M3UParser.parse(content);

      final filterDeadpoolAndWolverine2024 = result
          .where(
            (element) => element.title.contains("Deadpool & Wolverine (2024) "),
          )
          .toList();

      expect(filterDeadpoolAndWolverine2024.length, equals(3));

      expect(
        filterDeadpoolAndWolverine2024[1].title,
        equals("Deadpool & Wolverine (2024) เดดพูล & วูล์ฟเวอรีน"),
      );

      expect(filterDeadpoolAndWolverine2024[0].kodiProps.length, equals(1));
      expect(filterDeadpoolAndWolverine2024[1].kodiProps.length, equals(1));
      expect(filterDeadpoolAndWolverine2024[2].kodiProps.length, equals(1));

      expect(filterDeadpoolAndWolverine2024[0].extVlcOpts.length, equals(0));
      expect(filterDeadpoolAndWolverine2024[1].extVlcOpts.length, equals(0));
      expect(filterDeadpoolAndWolverine2024[2].extVlcOpts.length, equals(0));

      expect(filterDeadpoolAndWolverine2024[0].httpHeaders.length, equals(0));
      expect(filterDeadpoolAndWolverine2024[1].httpHeaders.length, equals(0));
      expect(filterDeadpoolAndWolverine2024[2].httpHeaders.length, equals(0));
    });
  });
}
