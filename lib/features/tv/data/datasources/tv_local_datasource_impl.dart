import 'package:pusoo/features/tv/data/datasources/tv_local_datasource.dart';
import 'package:pusoo/features/tv/domain/models/get_tv_tracks_params.dart';
import 'package:pusoo/shared/data/datasources/local/drift_database.dart';
import 'package:pusoo/shared/data/models/track.dart';
import 'package:drift/drift.dart' as drift;

class TvLocalDatasourceImpl implements TvLocalDatasource {
  @override
  Future<int> countAll({List<int>? playlistIds}) async {
    // cek jika belum ada playlist maka set default
    final countExpression = driftDb.trackDrift.id.count();

    // 1. Buat query builder yang bisa dimodifikasi
    final query = driftDb.selectOnly(driftDb.trackDrift)
      ..addColumns([countExpression]);

    // 2. Tambahkan kondisi WHERE secara dinamis
    // Cek jika playlistIds tidak null dan tidak kosong
    if (playlistIds != null && playlistIds.isNotEmpty) {
      // Terapkan filter WHERE ... IN (...) pada kolom playlistId
      // Asumsi nama kolom di tabel Anda adalah 'playlistId'
      query.where(driftDb.trackDrift.playlistId.isIn(playlistIds));
    }

    // 3. Eksekusi query yang sudah dibangun
    final count = await query
        .map((row) => row.read(countExpression))
        .getSingle();

    return count ?? 0;
  }

  @override
  Future<List<String>> getTvCategories({
    List<int>? playlistIds,
    String? category,
  }) {
    // TODO: implement getTvCategories
    throw UnimplementedError();
  }

  @override
  Future<List<Track>> getTvTracks(GetTvTracksParams? params) async {
    // 1. Gunakan List untuk menampung semua kondisi WHERE secara dinamis
    // final List<drift.Expression<bool>> whereClauses = [
    //   // Kondisi statis dari kode Anda sebelumnya untuk memastikan ini adalah Live TV
    //   // driftDb.trackDrift.links.like('%movie%').not(),
    //   // driftDb.trackDrift.links.like('%series%').not(),
    //   driftDb.trackDrift.isLiveTv.equals(true),
    //   driftDb.trackDrift.links.equals('[]').not(),
    // ];

    // // 2. Tambahkan filter dinamis berdasarkan parameter yang diberikan
    // if (params?.playlistIds != null && params!.playlistIds!.isNotEmpty) {
    //   whereClauses.add(driftDb.trackDrift.playlistId.isIn(params.playlistIds!));
    // }

    // if (params?.category != null) {
    //   // Asumsi nama kolom di tabel adalah 'category'
    //   whereClauses.add(driftDb.trackDrift.groupTitle.equals(params!.category!));
    // }

    // if (params?.title != null) {
    //   whereClauses.add(driftDb.trackDrift.title.like('%${params?.title}%'));
    // }

    // if (params?.cursor != null && params!.cursor! > 0) {
    //   // Kita tidak memanggil query.where() di sini.
    //   // Cukup tambahkan expression-nya ke dalam list.
    //   whereClauses.add(driftDb.trackDrift.id.isBiggerThanValue(params.cursor!));
    // }

    // 3. Bangun query select utama
    final query = driftDb.select(driftDb.trackDrift);

    // 4. Gabungkan semua klausa WHERE jika list tidak kosong
    // if (whereClauses.isNotEmpty) {
    //   // Gunakan `reduce` untuk menggabungkan semua Expression dengan operator & (AND)
    //   final finalClause = whereClauses.reduce((a, b) => a & b);
    //   query.where((_) => finalClause);
    // }

    // 5. (BARU) Terapkan Paginasi menggunakan Limit dan Offset (Cursor)
    if (params?.limit != null) {
      // Method `limit` di Drift menerima jumlah item dan `offset` opsional.
      query.limit(params!.limit!);
    }

    // if (params?.offset != null) {
    //   query.offset(params!.offset!);
    // }

    // Opsional: Tambahkan sorting agar hasilnya konsisten
    query.orderBy([(t) => drift.OrderingTerm(expression: t.id)]);

    // 5. Eksekusi query dan lakukan mapping hasil
    final trackDriftDataRows = await query.get();

    final List<Track> convertToTrack = trackDriftDataRows.map((trackDrift) {
      return Track.fromTrackDrift(trackDrift);
    }).toList();

    return convertToTrack;
  }
}
