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


// lib/features/tv/presentation/providers/paging_tv_tracks_provider.dart

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_notifier.dart';
import 'package:pusoo/features/tv/presentation/providers/tv_tracks_filter_notifier.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_tracks_paging_notifier.g.dart';

@riverpod
class TvTracksPagingNotifier extends _$TvTracksPagingNotifier {
  @override
  PagingController<int, Track> build() {
    // 1. Buat instance PagingController
    final controller = PagingController<int, Track>(
      getNextPageKey: (state) {
        debugPrint(
          '[PagingTvTracksController] getNextPageKey called. Current state: ${state.toString()}',
        );

        // Jika belum ada halaman yang diambil, atau jika sudah tidak ada halaman berikutnya
        // PagingState() default memiliki pages: null, hasNextPage: true
        if (state.pages == null || state.pages!.isEmpty) {
          debugPrint(
            '[PagingTvTracksController] getNextPageKey: No pages yet, returning 0 (first page key).',
          );
          return 0; // Ini adalah kunci untuk halaman pertama
        }

        // Jika hasNextPage sudah false, berarti kita sudah tahu tidak ada halaman lagi
        if (!state.hasNextPage) {
          debugPrint(
            '[PagingTvTracksController] getNextPageKey: hasNextPage is false, returning null.',
          );
          return null;
        }

        final lastFetchedPage = state.pages!.last;

        // KONDISI PENTING: Jika jumlah item di halaman terakhir kurang dari limit (20),
        // berarti ini adalah halaman terakhir, jadi tidak ada kunci halaman berikutnya.
        if (lastFetchedPage.length < 20) {
          debugPrint(
            '[PagingTvTracksController] getNextPageKey: Last page had ${lastFetchedPage.length} items (<20), returning null.',
          );
          return null;
        }

        // Jika tidak, gunakan ID dari item terakhir di halaman terakhir sebagai kunci halaman berikutnya.
        final nextPageKey = lastFetchedPage.last.id;
        debugPrint(
          '[PagingTvTracksController] getNextPageController] getNextPageKey: Returning next page key: $nextPageKey',
        );
        return nextPageKey;
      },
      fetchPage: (pageKey) async {
        final filterState = ref.read(tvTracksFilterProvider);

        try {
          await ref
              .read(tvTracksProvider.notifier)
              .perform(
                // GetTracksParams(
                //   limit:
                //       20, // Pastikan limit ini konsisten dengan logika di atas
                //   cursor: pageKey,
                //   title: searchState,
                //   isLiveTv: true,
                // ),
                filterState.copyWith(cursor: pageKey),
              );

          return ref.read(tvTracksProvider).value ?? [];
        } catch (e) {
          rethrow;
        }
      },
    );

    // 2. Tambahkan listener untuk mengambil data saat diminta
    // controller.addListener(listener);

    // 3. Pastikan controller di-dispose saat provider tidak lagi digunakan
    ref.onDispose(() {
      controller.dispose();
    });

    // 4. Kembalikan controller sebagai state awal
    return controller;
  }

  /// Fungsi privat untuk mengambil data halaman.
  // _fetchPage

  /// Metode publik untuk me-refresh data dari luar.
  /// UI akan memanggil ini, contohnya pada `onRefresh` di `RefreshIndicator`.
  void refresh() {
    state.refresh();
  }
}
