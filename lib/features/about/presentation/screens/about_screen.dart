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
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
import 'package:forui/widgets/scaffold.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pusoo/core/consts/third_party_license.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _version = '';
  String _buildNumber = '';

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version; // contoh: "1.2.3"
      _buildNumber = info.buildNumber; // contoh: "45"
    });
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text("About"),
        prefixes: [
          FHeaderAction.back(
            onPress: () {
              context.pop(false);
            },
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Gap(5),
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset("assets/icon.svg", fit: BoxFit.contain),
              ),
            ),
          ),

          Center(
            child: Column(
              children: [
                Text(
                  "Pusoo",
                  style: context.theme.typography.xl.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Open Source IPTV Player",
                  style: context.theme.typography.base.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Version: $_version ($_buildNumber)",
                  style: context.theme.typography.sm.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          FTabs(
            children: [
              FTabEntry(
                label: const Text('About'),
                child: Column(
                  children: [
                    FTile(
                      title: Text("Frequently asked questions"),
                      subtitle: Text(
                        "Got issues with the app? Check the answers to common questions first.",
                        maxLines: 5,
                      ),
                      suffix: Icon(FIcons.chevronRight),
                    ),
                    Gap(10),
                    FTile(
                      title: Text("Contribute"),
                      subtitle: Text(
                        "No matter if it's small fixes or heavy coding - translations, design, cleanup, or new features - all contributions are appreciated. The more you add, the better it gets!",
                        maxLines: 5,
                      ),

                      suffix: Icon(FIcons.chevronRight),
                    ),
                    Gap(10),
                    FTile(
                      title: Text("Donate"),
                      subtitle: Text(
                        "Pusoo is a community-driven project, developed by me and contributors in our free time. Every bit of support makes it easier for us to keep improving Pusoo — and enjoy a coffee while coding.",
                        maxLines: 5,
                      ),

                      suffix: Icon(FIcons.chevronRight),
                    ),
                    Gap(10),
                    FTile(
                      title: Text("Website"),
                      subtitle: Text(
                        "Visit the Pusoo Homepage for more info and news",
                        maxLines: 5,
                      ),

                      suffix: Icon(FIcons.chevronRight),
                    ),
                    Gap(10),
                    FTile(
                      title: Text("Pusoo's Privacy Policy"),
                      subtitle: Text(
                        "Your privacy matters to us. Pusoo doesn't collect any data without your permission. If you decide to send a crash report, our Privacy Policy explains what info is shared and how it's stored.",
                        maxLines: 5,
                      ),

                      suffix: Icon(FIcons.chevronRight),
                    ),
                  ],
                ),
              ),
              FTabEntry(
                label: const Text('License'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FTile(
                      title: Text("Pusoo's License"),
                      subtitle: Text(
                        "Pusoo is copyleft libre software: You can use, study, share, and improve it at will, Specifically you can redistribute and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.",
                        maxLines: 10,
                      ),

                      suffix: Icon(FIcons.chevronRight),
                    ),
                    Gap(10),
                    FButton(
                      style: FButtonStyle.outline(),
                      onPress: () {
                        context.push("/license");
                      },
                      child: Text("GNU General Public License v3.0"),
                    ),
                    Gap(10),

                    Text("Third-party Licenses"),
                    FItemGroup(
                      divider: FItemDivider.indented,
                      children: [
                        ...thirdPartyLicenses.map(
                          (e) => FItem(
                            prefix: Icon(FIcons.copyright),
                            title: Text(e.name),
                            details: Text(e.license),
                            subtitle: Text(e.url, maxLines: 2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
