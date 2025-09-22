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


import 'package:logger/logger.dart';
import 'package:pusoo/features/track/domain/models/track_filter_query.dart';
import 'package:pusoo/shared/data/datasources/local/drift/drift_database.dart';
import 'package:pusoo/features/track/data/datasources/local/track_datasource.dart';
import 'package:pusoo/features/track/domain/models/track.dart';
import 'package:drift/drift.dart' as drift;
import 'package:pusoo/features/track/data/models/track_drift_data_ext.dart';

class TrackDriftDatasourceImpl implements TrackDatasource {
  late final Logger _log;

  TrackDriftDatasourceImpl(this._log);

  @override
  Future<int> count(TrackFilterQuery? params) async {
    // cek jika belum ada playlist maka set default
    final countExpression = driftDb.trackDrift.id.count();

    // 1. Buat query builder yang bisa dimodifikasi
    final query = driftDb.selectOnly(driftDb.trackDrift)
      ..addColumns([countExpression]);

    // 2. Tambahkan kondisi WHERE secara dinamis
    // Cek jika playlistIds tidak null dan tidak kosong
    if (params?.playlistIds != null) {
      // Terapkan filter WHERE ... IN (...) pada kolom playlistId
      // Asumsi nama kolom di tabel Anda adalah 'playlistId'
      if (params!.playlistIds!.isNotEmpty) {
        query.where(driftDb.trackDrift.sourceId.isIn(params.playlistIds!));
      }
    }

    // 3. Eksekusi query yang sudah dibangun
    final count = await query
        .map((row) => row.read(countExpression))
        .getSingle();

    return count ?? 0;
  }

  @override
  Future<List<Track>> get(TrackFilterQuery? params) async {
    // 1. Gunakan List untuk menampung semua kondisi WHERE secara dinamis
    final List<drift.Expression<bool>> whereClauses = [
      // Kondisi statis dari kode Anda sebelumnya untuk memastikan ini adalah Live TV
      // driftDb.trackDrift.links.like('%movie%').not(),
      // driftDb.trackDrift.links.like('%series%').not(),
      driftDb.trackDrift.links.equals('[]').not(),
    ];

    if (params?.isLiveTv != null) {
      whereClauses.add(driftDb.trackDrift.isLiveTv.equals(true));
    }

    if (params?.isMovie != null) {
      whereClauses.add(driftDb.trackDrift.isMovie.equals(true));
    }

    if (params?.isTvSerie != null) {
      whereClauses.add(driftDb.trackDrift.isTvSerie.equals(true));
    }

    // 2. Tambahkan filter dinamis berdasarkan parameter yang diberikan
    if (params?.playlistIds != null && params!.playlistIds!.isNotEmpty) {
      whereClauses.add(driftDb.trackDrift.sourceId.isIn(params.playlistIds!));
    }

    if (params?.groupTitle != null) {
      // Asumsi nama kolom di tabel adalah 'groupTitle'
      whereClauses.add(
        driftDb.trackDrift.groupTitle.equals(params!.groupTitle!),
      );
    }

    if (params?.title != null) {
      if (params!.title!.isNotEmpty) {
        whereClauses.add(driftDb.trackDrift.title.like('%${params.title}%'));
      }
    }

    if (params?.cursor != null && params!.cursor! > 0) {
      // Kita tidak memanggil query.where() di sini.
      // Cukup tambahkan expression-nya ke dalam list.
      whereClauses.add(driftDb.trackDrift.id.isBiggerThanValue(params.cursor!));
    }

    // // 3. Bangun query select utama
    final query = driftDb.select(driftDb.trackDrift).join([
      drift.innerJoin(
        driftDb.sourceDrift,
        driftDb.sourceDrift.id.equalsExp(driftDb.trackDrift.sourceId),
      ),
    ]);

    // 4. Gabungkan semua klausa WHERE jika list tidak kosong
    // if (whereClauses.isNotEmpty) {
    //   // tanpa JOIN
    //   // final finalClause = whereClauses.reduce((a, b) => a & b);
    //   // query.where((_) => finalClause);

    // }

    if (whereClauses.isNotEmpty) {
      // Gunakan `reduce` untuk menggabungkan semua Expression dengan operator & (AND)
      final finalClause = whereClauses.reduce((a, b) => a & b);

      // Langsung berikan Expression<bool> yang sudah jadi ke metode `where`
      query.where(finalClause);
    }

    _log.i('--- DEBUG ---');
    _log.i('Params: $params');
    _log.i('Where Clauses count: ${whereClauses.length}');
    _log.i('Where Clauses: $whereClauses');

    // 5. (BARU) Terapkan Paginasi menggunakan Limit dan Offset (Cursor)
    if (params?.limit != null) {
      // Method `limit` di Drift menerima jumlah item dan `offset` opsional.
      query.limit(params!.limit!);
    }

    // if (params?.offset != null) {
    //   query.offset(params!.offset!);
    // }

    // Opsional: Tambahkan sorting agar hasilnya konsisten
    query.orderBy([
      drift.OrderingTerm(
        expression: driftDb.trackDrift.id,
        mode: drift.OrderingMode.asc,
      ),
    ]);

    // 5. Eksekusi query dan lakukan mapping hasil
    final trackDriftDataRows = await query.get();

    final List<Track> mapToTrack = trackDriftDataRows.map((
      drift.TypedResult result,
    ) {
      return result.toEntity();
    }).toList();

    return mapToTrack;
  }

  @override
  Future<List<String>> getGroupTitle(TrackFilterQuery? params) {
    final query = driftDb.selectOnly(driftDb.trackDrift)
      ..addColumns([driftDb.trackDrift.groupTitle])
      ..groupBy([driftDb.trackDrift.groupTitle]);

    // Selalu filter groupTitle yang null untuk memenuhi tipe return Future<List<String>>
    query.where(driftDb.trackDrift.groupTitle.isNotNull());

    // 1. Filter berdasarkan keyword jika ada
    // final keyword = params?.isMovie;
    if (params?.isMovie != null) {
      query.where(driftDb.trackDrift.isMovie.equals(params!.isMovie!));
    }

    if (params?.isLiveTv != null) {
      query.where(driftDb.trackDrift.isLiveTv.equals(params!.isLiveTv!));
    }

    if (params?.isTvSerie != null) {
      query.where(driftDb.trackDrift.isTvSerie.equals(params!.isTvSerie!));
    }

    final playlistIds = params?.playlistIds;
    if (playlistIds != null && playlistIds.isNotEmpty) {
      // Menambahkan kondisi: WHERE group_title LIKE '%keyword%'
      query.where(driftDb.trackDrift.sourceId.isIn(playlistIds));
    }

    return query.map((row) => row.read(driftDb.trackDrift.groupTitle)!).get();
  }
}
