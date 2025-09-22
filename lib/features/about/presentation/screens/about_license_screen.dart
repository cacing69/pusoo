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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutLicenseScreen extends StatefulWidget {
  const AboutLicenseScreen({super.key});

  @override
  State<AboutLicenseScreen> createState() => _AboutLicenseScreenState();
}

class _AboutLicenseScreenState extends State<AboutLicenseScreen> {
  Future<String> _loadLicense() async {
    return await rootBundle.loadString('assets/licenses/gpl_v3.txt');
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: const Text("GPLv3 License"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
        suffixes: [
          FHeaderAction(
            icon: const Icon(FIcons.copy),
            onPress: () async {
              final license = await _loadLicense();
              await Clipboard.setData(ClipboardData(text: license));
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('License copied to clipboard')),
              );
            },
          ),
        ],
      ),
      child: FutureBuilder<String>(
        future: _loadLicense(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final lines = snapshot.data?.split('\n') ?? [];
            return Container(
              color: context.theme.colors.background,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: lines.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SelectableText(
                          lines[index],
                          style: GoogleFonts.jetBrainsMono(
                            color: context.theme.colors.foreground,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
