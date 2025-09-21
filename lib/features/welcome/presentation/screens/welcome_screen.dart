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

import 'package:flutter/widgets.dart';
import 'package:forui/widgets/button.dart';
import 'package:forui/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:pusoo/router.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome"),
          Text(
            "Eiusmod veniam cillum dolore proident quis commodo magna. Officia exercitation dolor ut nostrud est ut laboris qui. Anim ullamco quis labore in sunt adipisicing proident consequat in nostrud quis Lorem. Cillum incididunt ullamco non officia. Cupidatat ut excepteur veniam cillum eiusmod incididunt et reprehenderit aute labore anim voluptate ad duis. Nostrud enim proident veniam aute culpa Lorem elit minim enim laborum dolore ullamco.",
            textAlign: TextAlign.center,
          ),
          FButton(
            onPress: () {
              context.goNamed(RouteName.home.name);
            },
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}
