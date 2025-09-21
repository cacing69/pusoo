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


import 'package:pusoo/features/source/data/const/github/buddy_chew_xumo_playlist_generator_source.dart';
import 'package:pusoo/features/source/data/const/github/free_tv_iptv_source.dart';
import 'package:pusoo/features/source/data/const/github/gambiarras_legal_iptv_source.dart';
import 'package:pusoo/features/source/data/const/github/ghokun_tv_source.dart';
import 'package:pusoo/features/source/data/const/github/hanoi_iptv_m3u_source.dart';
import 'package:pusoo/features/source/data/const/github/iptv_org_source.dart';
import 'package:pusoo/features/source/data/const/github/kimentanm_aptv_source.dart';
import 'package:pusoo/features/source/data/const/github/lituatui_m3upt_source.dart';
import 'package:pusoo/features/source/data/const/github/mikhel_epg_para_m3u_source.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';

final List<Source> githubSources = [
  iptvOrgIptvSource,
  freeTvIptvSource,
  mikhelEpgParaM3uSource,
  gambiarrasLegalIptvSource,
  buddyChewChewXumoPlaylistGeneratorSource,
  lituatuiM3uptSource,
  haNoiIPTVHaNoiIPTVM3uSource,
  ghokunTvSource,
  kimentanmAptvSource,
];
