// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PlaylistDriftTable extends PlaylistDrift
    with TableInfo<$PlaylistDriftTable, PlaylistDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Ulid().toString(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _epgLinkMeta = const VerificationMeta(
    'epgLink',
  );
  @override
  late final GeneratedColumn<String> epgLink = GeneratedColumn<String>(
    'epg_link',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    epgLink,
    url,
    lastUpdated,
    createdAt,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_drift';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistDriftData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('epg_link')) {
      context.handle(
        _epgLinkMeta,
        epgLink.isAcceptableOrUnknown(data['epg_link']!, _epgLinkMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistDriftData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      epgLink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}epg_link'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $PlaylistDriftTable createAlias(String alias) {
    return $PlaylistDriftTable(attachedDatabase, alias);
  }
}

class PlaylistDriftData extends DataClass
    implements Insertable<PlaylistDriftData> {
  final String id;
  final String name;
  final String? type;
  final String? epgLink;
  final String url;
  final DateTime? lastUpdated;
  final DateTime createdAt;
  final bool isActive;
  const PlaylistDriftData({
    required this.id,
    required this.name,
    this.type,
    this.epgLink,
    required this.url,
    this.lastUpdated,
    required this.createdAt,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || epgLink != null) {
      map['epg_link'] = Variable<String>(epgLink);
    }
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  PlaylistDriftCompanion toCompanion(bool nullToAbsent) {
    return PlaylistDriftCompanion(
      id: Value(id),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      epgLink: epgLink == null && nullToAbsent
          ? const Value.absent()
          : Value(epgLink),
      url: Value(url),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      createdAt: Value(createdAt),
      isActive: Value(isActive),
    );
  }

  factory PlaylistDriftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      epgLink: serializer.fromJson<String?>(json['epgLink']),
      url: serializer.fromJson<String>(json['url']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(type),
      'epgLink': serializer.toJson<String?>(epgLink),
      'url': serializer.toJson<String>(url),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  PlaylistDriftData copyWith({
    String? id,
    String? name,
    Value<String?> type = const Value.absent(),
    Value<String?> epgLink = const Value.absent(),
    String? url,
    Value<DateTime?> lastUpdated = const Value.absent(),
    DateTime? createdAt,
    bool? isActive,
  }) => PlaylistDriftData(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type.present ? type.value : this.type,
    epgLink: epgLink.present ? epgLink.value : this.epgLink,
    url: url ?? this.url,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
    createdAt: createdAt ?? this.createdAt,
    isActive: isActive ?? this.isActive,
  );
  PlaylistDriftData copyWithCompanion(PlaylistDriftCompanion data) {
    return PlaylistDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      epgLink: data.epgLink.present ? data.epgLink.value : this.epgLink,
      url: data.url.present ? data.url.value : this.url,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('epgLink: $epgLink, ')
          ..write('url: $url, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    epgLink,
    url,
    lastUpdated,
    createdAt,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.epgLink == this.epgLink &&
          other.url == this.url &&
          other.lastUpdated == this.lastUpdated &&
          other.createdAt == this.createdAt &&
          other.isActive == this.isActive);
}

class PlaylistDriftCompanion extends UpdateCompanion<PlaylistDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> type;
  final Value<String?> epgLink;
  final Value<String> url;
  final Value<DateTime?> lastUpdated;
  final Value<DateTime> createdAt;
  final Value<bool> isActive;
  final Value<int> rowid;
  const PlaylistDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.epgLink = const Value.absent(),
    this.url = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistDriftCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.type = const Value.absent(),
    this.epgLink = const Value.absent(),
    required String url,
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       url = Value(url);
  static Insertable<PlaylistDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? epgLink,
    Expression<String>? url,
    Expression<DateTime>? lastUpdated,
    Expression<DateTime>? createdAt,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (epgLink != null) 'epg_link': epgLink,
      if (url != null) 'url': url,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (createdAt != null) 'created_at': createdAt,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistDriftCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? type,
    Value<String?>? epgLink,
    Value<String>? url,
    Value<DateTime?>? lastUpdated,
    Value<DateTime>? createdAt,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return PlaylistDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      epgLink: epgLink ?? this.epgLink,
      url: url ?? this.url,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (epgLink.present) {
      map['epg_link'] = Variable<String>(epgLink.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('epgLink: $epgLink, ')
          ..write('url: $url, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChannelDriftTable extends ChannelDrift
    with TableInfo<$ChannelDriftTable, ChannelDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Ulid().toString(),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlist_drift (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tvgIdMeta = const VerificationMeta('tvgId');
  @override
  late final GeneratedColumn<String> tvgId = GeneratedColumn<String>(
    'tvg_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tmdbIdMeta = const VerificationMeta('tmdbId');
  @override
  late final GeneratedColumn<String> tmdbId = GeneratedColumn<String>(
    'tmdb_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tvgNameMeta = const VerificationMeta(
    'tvgName',
  );
  @override
  late final GeneratedColumn<String> tvgName = GeneratedColumn<String>(
    'tvg_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
    'logo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupTitleMeta = const VerificationMeta(
    'groupTitle',
  );
  @override
  late final GeneratedColumn<String> groupTitle = GeneratedColumn<String>(
    'group_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _streamUrlMeta = const VerificationMeta(
    'streamUrl',
  );
  @override
  late final GeneratedColumn<String> streamUrl = GeneratedColumn<String>(
    'stream_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLiveTvMeta = const VerificationMeta(
    'isLiveTv',
  );
  @override
  late final GeneratedColumn<bool> isLiveTv = GeneratedColumn<bool>(
    'is_live_tv',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_live_tv" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isMovieMeta = const VerificationMeta(
    'isMovie',
  );
  @override
  late final GeneratedColumn<bool> isMovie = GeneratedColumn<bool>(
    'is_movie',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_movie" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isTvSerieMeta = const VerificationMeta(
    'isTvSerie',
  );
  @override
  late final GeneratedColumn<bool> isTvSerie = GeneratedColumn<bool>(
    'is_tv_serie',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_tv_serie" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isWatchedMeta = const VerificationMeta(
    'isWatched',
  );
  @override
  late final GeneratedColumn<bool> isWatched = GeneratedColumn<bool>(
    'is_watched',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_watched" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kodipropMeta = const VerificationMeta(
    'kodiprop',
  );
  @override
  late final GeneratedColumn<String> kodiprop = GeneratedColumn<String>(
    'kodiprop',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extvlcoptMeta = const VerificationMeta(
    'extvlcopt',
  );
  @override
  late final GeneratedColumn<String> extvlcopt = GeneratedColumn<String>(
    'extvlcopt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    name,
    tvgId,
    tmdbId,
    tvgName,
    logo,
    groupTitle,
    streamUrl,
    isFavorite,
    isLiveTv,
    isMovie,
    isTvSerie,
    isWatched,
    lastUpdated,
    kodiprop,
    extvlcopt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channel_drift';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChannelDriftData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tvg_id')) {
      context.handle(
        _tvgIdMeta,
        tvgId.isAcceptableOrUnknown(data['tvg_id']!, _tvgIdMeta),
      );
    }
    if (data.containsKey('tmdb_id')) {
      context.handle(
        _tmdbIdMeta,
        tmdbId.isAcceptableOrUnknown(data['tmdb_id']!, _tmdbIdMeta),
      );
    }
    if (data.containsKey('tvg_name')) {
      context.handle(
        _tvgNameMeta,
        tvgName.isAcceptableOrUnknown(data['tvg_name']!, _tvgNameMeta),
      );
    }
    if (data.containsKey('logo')) {
      context.handle(
        _logoMeta,
        logo.isAcceptableOrUnknown(data['logo']!, _logoMeta),
      );
    }
    if (data.containsKey('group_title')) {
      context.handle(
        _groupTitleMeta,
        groupTitle.isAcceptableOrUnknown(data['group_title']!, _groupTitleMeta),
      );
    }
    if (data.containsKey('stream_url')) {
      context.handle(
        _streamUrlMeta,
        streamUrl.isAcceptableOrUnknown(data['stream_url']!, _streamUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_streamUrlMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('is_live_tv')) {
      context.handle(
        _isLiveTvMeta,
        isLiveTv.isAcceptableOrUnknown(data['is_live_tv']!, _isLiveTvMeta),
      );
    }
    if (data.containsKey('is_movie')) {
      context.handle(
        _isMovieMeta,
        isMovie.isAcceptableOrUnknown(data['is_movie']!, _isMovieMeta),
      );
    }
    if (data.containsKey('is_tv_serie')) {
      context.handle(
        _isTvSerieMeta,
        isTvSerie.isAcceptableOrUnknown(data['is_tv_serie']!, _isTvSerieMeta),
      );
    }
    if (data.containsKey('is_watched')) {
      context.handle(
        _isWatchedMeta,
        isWatched.isAcceptableOrUnknown(data['is_watched']!, _isWatchedMeta),
      );
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    if (data.containsKey('kodiprop')) {
      context.handle(
        _kodipropMeta,
        kodiprop.isAcceptableOrUnknown(data['kodiprop']!, _kodipropMeta),
      );
    }
    if (data.containsKey('extvlcopt')) {
      context.handle(
        _extvlcoptMeta,
        extvlcopt.isAcceptableOrUnknown(data['extvlcopt']!, _extvlcoptMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChannelDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChannelDriftData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}playlist_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      tvgId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tvg_id'],
      ),
      tmdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tmdb_id'],
      ),
      tvgName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tvg_name'],
      ),
      logo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo'],
      ),
      groupTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_title'],
      ),
      streamUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stream_url'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      isLiveTv: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_live_tv'],
      )!,
      isMovie: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_movie'],
      )!,
      isTvSerie: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_tv_serie'],
      )!,
      isWatched: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_watched'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      ),
      kodiprop: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kodiprop'],
      ),
      extvlcopt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extvlcopt'],
      ),
    );
  }

  @override
  $ChannelDriftTable createAlias(String alias) {
    return $ChannelDriftTable(attachedDatabase, alias);
  }
}

class ChannelDriftData extends DataClass
    implements Insertable<ChannelDriftData> {
  final String id;
  final String playlistId;
  final String name;
  final String? tvgId;
  final String? tmdbId;
  final String? tvgName;
  final String? logo;
  final String? groupTitle;
  final String streamUrl;
  final bool isFavorite;
  final bool isLiveTv;
  final bool isMovie;
  final bool isTvSerie;
  final bool isWatched;
  final DateTime? lastUpdated;
  final String? kodiprop;
  final String? extvlcopt;
  const ChannelDriftData({
    required this.id,
    required this.playlistId,
    required this.name,
    this.tvgId,
    this.tmdbId,
    this.tvgName,
    this.logo,
    this.groupTitle,
    required this.streamUrl,
    required this.isFavorite,
    required this.isLiveTv,
    required this.isMovie,
    required this.isTvSerie,
    required this.isWatched,
    this.lastUpdated,
    this.kodiprop,
    this.extvlcopt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['playlist_id'] = Variable<String>(playlistId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || tvgId != null) {
      map['tvg_id'] = Variable<String>(tvgId);
    }
    if (!nullToAbsent || tmdbId != null) {
      map['tmdb_id'] = Variable<String>(tmdbId);
    }
    if (!nullToAbsent || tvgName != null) {
      map['tvg_name'] = Variable<String>(tvgName);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    if (!nullToAbsent || groupTitle != null) {
      map['group_title'] = Variable<String>(groupTitle);
    }
    map['stream_url'] = Variable<String>(streamUrl);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_live_tv'] = Variable<bool>(isLiveTv);
    map['is_movie'] = Variable<bool>(isMovie);
    map['is_tv_serie'] = Variable<bool>(isTvSerie);
    map['is_watched'] = Variable<bool>(isWatched);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    if (!nullToAbsent || kodiprop != null) {
      map['kodiprop'] = Variable<String>(kodiprop);
    }
    if (!nullToAbsent || extvlcopt != null) {
      map['extvlcopt'] = Variable<String>(extvlcopt);
    }
    return map;
  }

  ChannelDriftCompanion toCompanion(bool nullToAbsent) {
    return ChannelDriftCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      name: Value(name),
      tvgId: tvgId == null && nullToAbsent
          ? const Value.absent()
          : Value(tvgId),
      tmdbId: tmdbId == null && nullToAbsent
          ? const Value.absent()
          : Value(tmdbId),
      tvgName: tvgName == null && nullToAbsent
          ? const Value.absent()
          : Value(tvgName),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      groupTitle: groupTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(groupTitle),
      streamUrl: Value(streamUrl),
      isFavorite: Value(isFavorite),
      isLiveTv: Value(isLiveTv),
      isMovie: Value(isMovie),
      isTvSerie: Value(isTvSerie),
      isWatched: Value(isWatched),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      kodiprop: kodiprop == null && nullToAbsent
          ? const Value.absent()
          : Value(kodiprop),
      extvlcopt: extvlcopt == null && nullToAbsent
          ? const Value.absent()
          : Value(extvlcopt),
    );
  }

  factory ChannelDriftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChannelDriftData(
      id: serializer.fromJson<String>(json['id']),
      playlistId: serializer.fromJson<String>(json['playlistId']),
      name: serializer.fromJson<String>(json['name']),
      tvgId: serializer.fromJson<String?>(json['tvgId']),
      tmdbId: serializer.fromJson<String?>(json['tmdbId']),
      tvgName: serializer.fromJson<String?>(json['tvgName']),
      logo: serializer.fromJson<String?>(json['logo']),
      groupTitle: serializer.fromJson<String?>(json['groupTitle']),
      streamUrl: serializer.fromJson<String>(json['streamUrl']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isLiveTv: serializer.fromJson<bool>(json['isLiveTv']),
      isMovie: serializer.fromJson<bool>(json['isMovie']),
      isTvSerie: serializer.fromJson<bool>(json['isTvSerie']),
      isWatched: serializer.fromJson<bool>(json['isWatched']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      kodiprop: serializer.fromJson<String?>(json['kodiprop']),
      extvlcopt: serializer.fromJson<String?>(json['extvlcopt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'playlistId': serializer.toJson<String>(playlistId),
      'name': serializer.toJson<String>(name),
      'tvgId': serializer.toJson<String?>(tvgId),
      'tmdbId': serializer.toJson<String?>(tmdbId),
      'tvgName': serializer.toJson<String?>(tvgName),
      'logo': serializer.toJson<String?>(logo),
      'groupTitle': serializer.toJson<String?>(groupTitle),
      'streamUrl': serializer.toJson<String>(streamUrl),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isLiveTv': serializer.toJson<bool>(isLiveTv),
      'isMovie': serializer.toJson<bool>(isMovie),
      'isTvSerie': serializer.toJson<bool>(isTvSerie),
      'isWatched': serializer.toJson<bool>(isWatched),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'kodiprop': serializer.toJson<String?>(kodiprop),
      'extvlcopt': serializer.toJson<String?>(extvlcopt),
    };
  }

  ChannelDriftData copyWith({
    String? id,
    String? playlistId,
    String? name,
    Value<String?> tvgId = const Value.absent(),
    Value<String?> tmdbId = const Value.absent(),
    Value<String?> tvgName = const Value.absent(),
    Value<String?> logo = const Value.absent(),
    Value<String?> groupTitle = const Value.absent(),
    String? streamUrl,
    bool? isFavorite,
    bool? isLiveTv,
    bool? isMovie,
    bool? isTvSerie,
    bool? isWatched,
    Value<DateTime?> lastUpdated = const Value.absent(),
    Value<String?> kodiprop = const Value.absent(),
    Value<String?> extvlcopt = const Value.absent(),
  }) => ChannelDriftData(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    name: name ?? this.name,
    tvgId: tvgId.present ? tvgId.value : this.tvgId,
    tmdbId: tmdbId.present ? tmdbId.value : this.tmdbId,
    tvgName: tvgName.present ? tvgName.value : this.tvgName,
    logo: logo.present ? logo.value : this.logo,
    groupTitle: groupTitle.present ? groupTitle.value : this.groupTitle,
    streamUrl: streamUrl ?? this.streamUrl,
    isFavorite: isFavorite ?? this.isFavorite,
    isLiveTv: isLiveTv ?? this.isLiveTv,
    isMovie: isMovie ?? this.isMovie,
    isTvSerie: isTvSerie ?? this.isTvSerie,
    isWatched: isWatched ?? this.isWatched,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
    kodiprop: kodiprop.present ? kodiprop.value : this.kodiprop,
    extvlcopt: extvlcopt.present ? extvlcopt.value : this.extvlcopt,
  );
  ChannelDriftData copyWithCompanion(ChannelDriftCompanion data) {
    return ChannelDriftData(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      name: data.name.present ? data.name.value : this.name,
      tvgId: data.tvgId.present ? data.tvgId.value : this.tvgId,
      tmdbId: data.tmdbId.present ? data.tmdbId.value : this.tmdbId,
      tvgName: data.tvgName.present ? data.tvgName.value : this.tvgName,
      logo: data.logo.present ? data.logo.value : this.logo,
      groupTitle: data.groupTitle.present
          ? data.groupTitle.value
          : this.groupTitle,
      streamUrl: data.streamUrl.present ? data.streamUrl.value : this.streamUrl,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      isLiveTv: data.isLiveTv.present ? data.isLiveTv.value : this.isLiveTv,
      isMovie: data.isMovie.present ? data.isMovie.value : this.isMovie,
      isTvSerie: data.isTvSerie.present ? data.isTvSerie.value : this.isTvSerie,
      isWatched: data.isWatched.present ? data.isWatched.value : this.isWatched,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      kodiprop: data.kodiprop.present ? data.kodiprop.value : this.kodiprop,
      extvlcopt: data.extvlcopt.present ? data.extvlcopt.value : this.extvlcopt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChannelDriftData(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('name: $name, ')
          ..write('tvgId: $tvgId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('tvgName: $tvgName, ')
          ..write('logo: $logo, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isLiveTv: $isLiveTv, ')
          ..write('isMovie: $isMovie, ')
          ..write('isTvSerie: $isTvSerie, ')
          ..write('isWatched: $isWatched, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('kodiprop: $kodiprop, ')
          ..write('extvlcopt: $extvlcopt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    name,
    tvgId,
    tmdbId,
    tvgName,
    logo,
    groupTitle,
    streamUrl,
    isFavorite,
    isLiveTv,
    isMovie,
    isTvSerie,
    isWatched,
    lastUpdated,
    kodiprop,
    extvlcopt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelDriftData &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.name == this.name &&
          other.tvgId == this.tvgId &&
          other.tmdbId == this.tmdbId &&
          other.tvgName == this.tvgName &&
          other.logo == this.logo &&
          other.groupTitle == this.groupTitle &&
          other.streamUrl == this.streamUrl &&
          other.isFavorite == this.isFavorite &&
          other.isLiveTv == this.isLiveTv &&
          other.isMovie == this.isMovie &&
          other.isTvSerie == this.isTvSerie &&
          other.isWatched == this.isWatched &&
          other.lastUpdated == this.lastUpdated &&
          other.kodiprop == this.kodiprop &&
          other.extvlcopt == this.extvlcopt);
}

class ChannelDriftCompanion extends UpdateCompanion<ChannelDriftData> {
  final Value<String> id;
  final Value<String> playlistId;
  final Value<String> name;
  final Value<String?> tvgId;
  final Value<String?> tmdbId;
  final Value<String?> tvgName;
  final Value<String?> logo;
  final Value<String?> groupTitle;
  final Value<String> streamUrl;
  final Value<bool> isFavorite;
  final Value<bool> isLiveTv;
  final Value<bool> isMovie;
  final Value<bool> isTvSerie;
  final Value<bool> isWatched;
  final Value<DateTime?> lastUpdated;
  final Value<String?> kodiprop;
  final Value<String?> extvlcopt;
  final Value<int> rowid;
  const ChannelDriftCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.name = const Value.absent(),
    this.tvgId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.tvgName = const Value.absent(),
    this.logo = const Value.absent(),
    this.groupTitle = const Value.absent(),
    this.streamUrl = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isLiveTv = const Value.absent(),
    this.isMovie = const Value.absent(),
    this.isTvSerie = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.kodiprop = const Value.absent(),
    this.extvlcopt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChannelDriftCompanion.insert({
    this.id = const Value.absent(),
    required String playlistId,
    required String name,
    this.tvgId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.tvgName = const Value.absent(),
    this.logo = const Value.absent(),
    this.groupTitle = const Value.absent(),
    required String streamUrl,
    this.isFavorite = const Value.absent(),
    this.isLiveTv = const Value.absent(),
    this.isMovie = const Value.absent(),
    this.isTvSerie = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.kodiprop = const Value.absent(),
    this.extvlcopt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : playlistId = Value(playlistId),
       name = Value(name),
       streamUrl = Value(streamUrl);
  static Insertable<ChannelDriftData> custom({
    Expression<String>? id,
    Expression<String>? playlistId,
    Expression<String>? name,
    Expression<String>? tvgId,
    Expression<String>? tmdbId,
    Expression<String>? tvgName,
    Expression<String>? logo,
    Expression<String>? groupTitle,
    Expression<String>? streamUrl,
    Expression<bool>? isFavorite,
    Expression<bool>? isLiveTv,
    Expression<bool>? isMovie,
    Expression<bool>? isTvSerie,
    Expression<bool>? isWatched,
    Expression<DateTime>? lastUpdated,
    Expression<String>? kodiprop,
    Expression<String>? extvlcopt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (name != null) 'name': name,
      if (tvgId != null) 'tvg_id': tvgId,
      if (tmdbId != null) 'tmdb_id': tmdbId,
      if (tvgName != null) 'tvg_name': tvgName,
      if (logo != null) 'logo': logo,
      if (groupTitle != null) 'group_title': groupTitle,
      if (streamUrl != null) 'stream_url': streamUrl,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isLiveTv != null) 'is_live_tv': isLiveTv,
      if (isMovie != null) 'is_movie': isMovie,
      if (isTvSerie != null) 'is_tv_serie': isTvSerie,
      if (isWatched != null) 'is_watched': isWatched,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (kodiprop != null) 'kodiprop': kodiprop,
      if (extvlcopt != null) 'extvlcopt': extvlcopt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChannelDriftCompanion copyWith({
    Value<String>? id,
    Value<String>? playlistId,
    Value<String>? name,
    Value<String?>? tvgId,
    Value<String?>? tmdbId,
    Value<String?>? tvgName,
    Value<String?>? logo,
    Value<String?>? groupTitle,
    Value<String>? streamUrl,
    Value<bool>? isFavorite,
    Value<bool>? isLiveTv,
    Value<bool>? isMovie,
    Value<bool>? isTvSerie,
    Value<bool>? isWatched,
    Value<DateTime?>? lastUpdated,
    Value<String?>? kodiprop,
    Value<String?>? extvlcopt,
    Value<int>? rowid,
  }) {
    return ChannelDriftCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      name: name ?? this.name,
      tvgId: tvgId ?? this.tvgId,
      tmdbId: tmdbId ?? this.tmdbId,
      tvgName: tvgName ?? this.tvgName,
      logo: logo ?? this.logo,
      groupTitle: groupTitle ?? this.groupTitle,
      streamUrl: streamUrl ?? this.streamUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      isLiveTv: isLiveTv ?? this.isLiveTv,
      isMovie: isMovie ?? this.isMovie,
      isTvSerie: isTvSerie ?? this.isTvSerie,
      isWatched: isWatched ?? this.isWatched,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      kodiprop: kodiprop ?? this.kodiprop,
      extvlcopt: extvlcopt ?? this.extvlcopt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<String>(playlistId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tvgId.present) {
      map['tvg_id'] = Variable<String>(tvgId.value);
    }
    if (tmdbId.present) {
      map['tmdb_id'] = Variable<String>(tmdbId.value);
    }
    if (tvgName.present) {
      map['tvg_name'] = Variable<String>(tvgName.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (groupTitle.present) {
      map['group_title'] = Variable<String>(groupTitle.value);
    }
    if (streamUrl.present) {
      map['stream_url'] = Variable<String>(streamUrl.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isLiveTv.present) {
      map['is_live_tv'] = Variable<bool>(isLiveTv.value);
    }
    if (isMovie.present) {
      map['is_movie'] = Variable<bool>(isMovie.value);
    }
    if (isTvSerie.present) {
      map['is_tv_serie'] = Variable<bool>(isTvSerie.value);
    }
    if (isWatched.present) {
      map['is_watched'] = Variable<bool>(isWatched.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (kodiprop.present) {
      map['kodiprop'] = Variable<String>(kodiprop.value);
    }
    if (extvlcopt.present) {
      map['extvlcopt'] = Variable<String>(extvlcopt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelDriftCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('name: $name, ')
          ..write('tvgId: $tvgId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('tvgName: $tvgName, ')
          ..write('logo: $logo, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isLiveTv: $isLiveTv, ')
          ..write('isMovie: $isMovie, ')
          ..write('isTvSerie: $isTvSerie, ')
          ..write('isWatched: $isWatched, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('kodiprop: $kodiprop, ')
          ..write('extvlcopt: $extvlcopt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlaylistDriftTable playlistDrift = $PlaylistDriftTable(this);
  late final $ChannelDriftTable channelDrift = $ChannelDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    playlistDrift,
    channelDrift,
  ];
}

typedef $$PlaylistDriftTableCreateCompanionBuilder =
    PlaylistDriftCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> type,
      Value<String?> epgLink,
      required String url,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$PlaylistDriftTableUpdateCompanionBuilder =
    PlaylistDriftCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> type,
      Value<String?> epgLink,
      Value<String> url,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
      Value<bool> isActive,
      Value<int> rowid,
    });

final class $$PlaylistDriftTableReferences
    extends
        BaseReferences<_$AppDatabase, $PlaylistDriftTable, PlaylistDriftData> {
  $$PlaylistDriftTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ChannelDriftTable, List<ChannelDriftData>>
  _channelDriftRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.channelDrift,
    aliasName: $_aliasNameGenerator(
      db.playlistDrift.id,
      db.channelDrift.playlistId,
    ),
  );

  $$ChannelDriftTableProcessedTableManager get channelDriftRefs {
    final manager = $$ChannelDriftTableTableManager(
      $_db,
      $_db.channelDrift,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_channelDriftRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlaylistDriftTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistDriftTable> {
  $$PlaylistDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get epgLink => $composableBuilder(
    column: $table.epgLink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> channelDriftRefs(
    Expression<bool> Function($$ChannelDriftTableFilterComposer f) f,
  ) {
    final $$ChannelDriftTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channelDrift,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelDriftTableFilterComposer(
            $db: $db,
            $table: $db.channelDrift,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistDriftTable> {
  $$PlaylistDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get epgLink => $composableBuilder(
    column: $table.epgLink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistDriftTable> {
  $$PlaylistDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get epgLink =>
      $composableBuilder(column: $table.epgLink, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> channelDriftRefs<T extends Object>(
    Expression<T> Function($$ChannelDriftTableAnnotationComposer a) f,
  ) {
    final $$ChannelDriftTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.channelDrift,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChannelDriftTableAnnotationComposer(
            $db: $db,
            $table: $db.channelDrift,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistDriftTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistDriftTable,
          PlaylistDriftData,
          $$PlaylistDriftTableFilterComposer,
          $$PlaylistDriftTableOrderingComposer,
          $$PlaylistDriftTableAnnotationComposer,
          $$PlaylistDriftTableCreateCompanionBuilder,
          $$PlaylistDriftTableUpdateCompanionBuilder,
          (PlaylistDriftData, $$PlaylistDriftTableReferences),
          PlaylistDriftData,
          PrefetchHooks Function({bool channelDriftRefs})
        > {
  $$PlaylistDriftTableTableManager(_$AppDatabase db, $PlaylistDriftTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> epgLink = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistDriftCompanion(
                id: id,
                name: name,
                type: type,
                epgLink: epgLink,
                url: url,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> type = const Value.absent(),
                Value<String?> epgLink = const Value.absent(),
                required String url,
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistDriftCompanion.insert(
                id: id,
                name: name,
                type: type,
                epgLink: epgLink,
                url: url,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistDriftTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({channelDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (channelDriftRefs) db.channelDrift],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (channelDriftRefs)
                    await $_getPrefetchedData<
                      PlaylistDriftData,
                      $PlaylistDriftTable,
                      ChannelDriftData
                    >(
                      currentTable: table,
                      referencedTable: $$PlaylistDriftTableReferences
                          ._channelDriftRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PlaylistDriftTableReferences(
                            db,
                            table,
                            p0,
                          ).channelDriftRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.playlistId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PlaylistDriftTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistDriftTable,
      PlaylistDriftData,
      $$PlaylistDriftTableFilterComposer,
      $$PlaylistDriftTableOrderingComposer,
      $$PlaylistDriftTableAnnotationComposer,
      $$PlaylistDriftTableCreateCompanionBuilder,
      $$PlaylistDriftTableUpdateCompanionBuilder,
      (PlaylistDriftData, $$PlaylistDriftTableReferences),
      PlaylistDriftData,
      PrefetchHooks Function({bool channelDriftRefs})
    >;
typedef $$ChannelDriftTableCreateCompanionBuilder =
    ChannelDriftCompanion Function({
      Value<String> id,
      required String playlistId,
      required String name,
      Value<String?> tvgId,
      Value<String?> tmdbId,
      Value<String?> tvgName,
      Value<String?> logo,
      Value<String?> groupTitle,
      required String streamUrl,
      Value<bool> isFavorite,
      Value<bool> isLiveTv,
      Value<bool> isMovie,
      Value<bool> isTvSerie,
      Value<bool> isWatched,
      Value<DateTime?> lastUpdated,
      Value<String?> kodiprop,
      Value<String?> extvlcopt,
      Value<int> rowid,
    });
typedef $$ChannelDriftTableUpdateCompanionBuilder =
    ChannelDriftCompanion Function({
      Value<String> id,
      Value<String> playlistId,
      Value<String> name,
      Value<String?> tvgId,
      Value<String?> tmdbId,
      Value<String?> tvgName,
      Value<String?> logo,
      Value<String?> groupTitle,
      Value<String> streamUrl,
      Value<bool> isFavorite,
      Value<bool> isLiveTv,
      Value<bool> isMovie,
      Value<bool> isTvSerie,
      Value<bool> isWatched,
      Value<DateTime?> lastUpdated,
      Value<String?> kodiprop,
      Value<String?> extvlcopt,
      Value<int> rowid,
    });

final class $$ChannelDriftTableReferences
    extends
        BaseReferences<_$AppDatabase, $ChannelDriftTable, ChannelDriftData> {
  $$ChannelDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistDriftTable _playlistIdTable(_$AppDatabase db) =>
      db.playlistDrift.createAlias(
        $_aliasNameGenerator(db.channelDrift.playlistId, db.playlistDrift.id),
      );

  $$PlaylistDriftTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<String>('playlist_id')!;

    final manager = $$PlaylistDriftTableTableManager(
      $_db,
      $_db.playlistDrift,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChannelDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ChannelDriftTable> {
  $$ChannelDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tvgId => $composableBuilder(
    column: $table.tvgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tvgName => $composableBuilder(
    column: $table.tvgName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupTitle => $composableBuilder(
    column: $table.groupTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get streamUrl => $composableBuilder(
    column: $table.streamUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLiveTv => $composableBuilder(
    column: $table.isLiveTv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMovie => $composableBuilder(
    column: $table.isMovie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTvSerie => $composableBuilder(
    column: $table.isTvSerie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWatched => $composableBuilder(
    column: $table.isWatched,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kodiprop => $composableBuilder(
    column: $table.kodiprop,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extvlcopt => $composableBuilder(
    column: $table.extvlcopt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistDriftTableFilterComposer get playlistId {
    final $$PlaylistDriftTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistDrift,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistDriftTableFilterComposer(
            $db: $db,
            $table: $db.playlistDrift,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $ChannelDriftTable> {
  $$ChannelDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tvgId => $composableBuilder(
    column: $table.tvgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tmdbId => $composableBuilder(
    column: $table.tmdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tvgName => $composableBuilder(
    column: $table.tvgName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupTitle => $composableBuilder(
    column: $table.groupTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streamUrl => $composableBuilder(
    column: $table.streamUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLiveTv => $composableBuilder(
    column: $table.isLiveTv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMovie => $composableBuilder(
    column: $table.isMovie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTvSerie => $composableBuilder(
    column: $table.isTvSerie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWatched => $composableBuilder(
    column: $table.isWatched,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kodiprop => $composableBuilder(
    column: $table.kodiprop,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extvlcopt => $composableBuilder(
    column: $table.extvlcopt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistDriftTableOrderingComposer get playlistId {
    final $$PlaylistDriftTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistDrift,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistDriftTableOrderingComposer(
            $db: $db,
            $table: $db.playlistDrift,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChannelDriftTable> {
  $$ChannelDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get tvgId =>
      $composableBuilder(column: $table.tvgId, builder: (column) => column);

  GeneratedColumn<String> get tmdbId =>
      $composableBuilder(column: $table.tmdbId, builder: (column) => column);

  GeneratedColumn<String> get tvgName =>
      $composableBuilder(column: $table.tvgName, builder: (column) => column);

  GeneratedColumn<String> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<String> get groupTitle => $composableBuilder(
    column: $table.groupTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get streamUrl =>
      $composableBuilder(column: $table.streamUrl, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLiveTv =>
      $composableBuilder(column: $table.isLiveTv, builder: (column) => column);

  GeneratedColumn<bool> get isMovie =>
      $composableBuilder(column: $table.isMovie, builder: (column) => column);

  GeneratedColumn<bool> get isTvSerie =>
      $composableBuilder(column: $table.isTvSerie, builder: (column) => column);

  GeneratedColumn<bool> get isWatched =>
      $composableBuilder(column: $table.isWatched, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kodiprop =>
      $composableBuilder(column: $table.kodiprop, builder: (column) => column);

  GeneratedColumn<String> get extvlcopt =>
      $composableBuilder(column: $table.extvlcopt, builder: (column) => column);

  $$PlaylistDriftTableAnnotationComposer get playlistId {
    final $$PlaylistDriftTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistDrift,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistDriftTableAnnotationComposer(
            $db: $db,
            $table: $db.playlistDrift,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChannelDriftTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChannelDriftTable,
          ChannelDriftData,
          $$ChannelDriftTableFilterComposer,
          $$ChannelDriftTableOrderingComposer,
          $$ChannelDriftTableAnnotationComposer,
          $$ChannelDriftTableCreateCompanionBuilder,
          $$ChannelDriftTableUpdateCompanionBuilder,
          (ChannelDriftData, $$ChannelDriftTableReferences),
          ChannelDriftData,
          PrefetchHooks Function({bool playlistId})
        > {
  $$ChannelDriftTableTableManager(_$AppDatabase db, $ChannelDriftTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChannelDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChannelDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChannelDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> playlistId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> tvgId = const Value.absent(),
                Value<String?> tmdbId = const Value.absent(),
                Value<String?> tvgName = const Value.absent(),
                Value<String?> logo = const Value.absent(),
                Value<String?> groupTitle = const Value.absent(),
                Value<String> streamUrl = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isLiveTv = const Value.absent(),
                Value<bool> isMovie = const Value.absent(),
                Value<bool> isTvSerie = const Value.absent(),
                Value<bool> isWatched = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<String?> kodiprop = const Value.absent(),
                Value<String?> extvlcopt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChannelDriftCompanion(
                id: id,
                playlistId: playlistId,
                name: name,
                tvgId: tvgId,
                tmdbId: tmdbId,
                tvgName: tvgName,
                logo: logo,
                groupTitle: groupTitle,
                streamUrl: streamUrl,
                isFavorite: isFavorite,
                isLiveTv: isLiveTv,
                isMovie: isMovie,
                isTvSerie: isTvSerie,
                isWatched: isWatched,
                lastUpdated: lastUpdated,
                kodiprop: kodiprop,
                extvlcopt: extvlcopt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String playlistId,
                required String name,
                Value<String?> tvgId = const Value.absent(),
                Value<String?> tmdbId = const Value.absent(),
                Value<String?> tvgName = const Value.absent(),
                Value<String?> logo = const Value.absent(),
                Value<String?> groupTitle = const Value.absent(),
                required String streamUrl,
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isLiveTv = const Value.absent(),
                Value<bool> isMovie = const Value.absent(),
                Value<bool> isTvSerie = const Value.absent(),
                Value<bool> isWatched = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<String?> kodiprop = const Value.absent(),
                Value<String?> extvlcopt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChannelDriftCompanion.insert(
                id: id,
                playlistId: playlistId,
                name: name,
                tvgId: tvgId,
                tmdbId: tmdbId,
                tvgName: tvgName,
                logo: logo,
                groupTitle: groupTitle,
                streamUrl: streamUrl,
                isFavorite: isFavorite,
                isLiveTv: isLiveTv,
                isMovie: isMovie,
                isTvSerie: isTvSerie,
                isWatched: isWatched,
                lastUpdated: lastUpdated,
                kodiprop: kodiprop,
                extvlcopt: extvlcopt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChannelDriftTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$ChannelDriftTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$ChannelDriftTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChannelDriftTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChannelDriftTable,
      ChannelDriftData,
      $$ChannelDriftTableFilterComposer,
      $$ChannelDriftTableOrderingComposer,
      $$ChannelDriftTableAnnotationComposer,
      $$ChannelDriftTableCreateCompanionBuilder,
      $$ChannelDriftTableUpdateCompanionBuilder,
      (ChannelDriftData, $$ChannelDriftTableReferences),
      ChannelDriftData,
      PrefetchHooks Function({bool playlistId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlaylistDriftTableTableManager get playlistDrift =>
      $$PlaylistDriftTableTableManager(_db, _db.playlistDrift);
  $$ChannelDriftTableTableManager get channelDrift =>
      $$ChannelDriftTableTableManager(_db, _db.channelDrift);
}
