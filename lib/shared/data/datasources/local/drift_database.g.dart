// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PlaylistTable extends Playlist
    with TableInfo<$PlaylistTable, PlaylistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _isSelectedMeta = const VerificationMeta(
    'isSelected',
  );
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
    'is_selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_selected" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    url,
    lastUpdated,
    createdAt,
    isSelected,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistData> instance, {
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
    if (data.containsKey('is_selected')) {
      context.handle(
        _isSelectedMeta,
        isSelected.isAcceptableOrUnknown(data['is_selected']!, _isSelectedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
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
      isSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_selected'],
      )!,
    );
  }

  @override
  $PlaylistTable createAlias(String alias) {
    return $PlaylistTable(attachedDatabase, alias);
  }
}

class PlaylistData extends DataClass implements Insertable<PlaylistData> {
  final String id;
  final String name;
  final String url;
  final DateTime? lastUpdated;
  final DateTime createdAt;
  final bool isSelected;
  const PlaylistData({
    required this.id,
    required this.name,
    required this.url,
    this.lastUpdated,
    required this.createdAt,
    required this.isSelected,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_selected'] = Variable<bool>(isSelected);
    return map;
  }

  PlaylistCompanion toCompanion(bool nullToAbsent) {
    return PlaylistCompanion(
      id: Value(id),
      name: Value(name),
      url: Value(url),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      createdAt: Value(createdAt),
      isSelected: Value(isSelected),
    );
  }

  factory PlaylistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isSelected': serializer.toJson<bool>(isSelected),
    };
  }

  PlaylistData copyWith({
    String? id,
    String? name,
    String? url,
    Value<DateTime?> lastUpdated = const Value.absent(),
    DateTime? createdAt,
    bool? isSelected,
  }) => PlaylistData(
    id: id ?? this.id,
    name: name ?? this.name,
    url: url ?? this.url,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
    createdAt: createdAt ?? this.createdAt,
    isSelected: isSelected ?? this.isSelected,
  );
  PlaylistData copyWithCompanion(PlaylistCompanion data) {
    return PlaylistData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      url: data.url.present ? data.url.value : this.url,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isSelected: data.isSelected.present
          ? data.isSelected.value
          : this.isSelected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSelected: $isSelected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, url, lastUpdated, createdAt, isSelected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistData &&
          other.id == this.id &&
          other.name == this.name &&
          other.url == this.url &&
          other.lastUpdated == this.lastUpdated &&
          other.createdAt == this.createdAt &&
          other.isSelected == this.isSelected);
}

class PlaylistCompanion extends UpdateCompanion<PlaylistData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> url;
  final Value<DateTime?> lastUpdated;
  final Value<DateTime> createdAt;
  final Value<bool> isSelected;
  final Value<int> rowid;
  const PlaylistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String url,
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       url = Value(url);
  static Insertable<PlaylistData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? url,
    Expression<DateTime>? lastUpdated,
    Expression<DateTime>? createdAt,
    Expression<bool>? isSelected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (createdAt != null) 'created_at': createdAt,
      if (isSelected != null) 'is_selected': isSelected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? url,
    Value<DateTime?>? lastUpdated,
    Value<DateTime>? createdAt,
    Value<bool>? isSelected,
    Value<int>? rowid,
  }) {
    return PlaylistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      createdAt: createdAt ?? this.createdAt,
      isSelected: isSelected ?? this.isSelected,
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
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSelected: $isSelected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChannelTable extends Channel with TableInfo<$ChannelTable, ChannelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelTable(this.attachedDatabase, [this._alias]);
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
    $customConstraints: 'REFERENCES playlist(id) NOT NULL',
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
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    category,
    isFavorite,
    isWatched,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channel';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChannelData> instance, {
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
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChannelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChannelData(
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
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      isWatched: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_watched'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      ),
    );
  }

  @override
  $ChannelTable createAlias(String alias) {
    return $ChannelTable(attachedDatabase, alias);
  }
}

class ChannelData extends DataClass implements Insertable<ChannelData> {
  final String id;
  final String playlistId;
  final String name;
  final String? tvgId;
  final String? tmdbId;
  final String? tvgName;
  final String? logo;
  final String? groupTitle;
  final String streamUrl;
  final String? category;
  final bool isFavorite;
  final bool isWatched;
  final DateTime? lastUpdated;
  const ChannelData({
    required this.id,
    required this.playlistId,
    required this.name,
    this.tvgId,
    this.tmdbId,
    this.tvgName,
    this.logo,
    this.groupTitle,
    required this.streamUrl,
    this.category,
    required this.isFavorite,
    required this.isWatched,
    this.lastUpdated,
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
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_watched'] = Variable<bool>(isWatched);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    return map;
  }

  ChannelCompanion toCompanion(bool nullToAbsent) {
    return ChannelCompanion(
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
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      isFavorite: Value(isFavorite),
      isWatched: Value(isWatched),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory ChannelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChannelData(
      id: serializer.fromJson<String>(json['id']),
      playlistId: serializer.fromJson<String>(json['playlistId']),
      name: serializer.fromJson<String>(json['name']),
      tvgId: serializer.fromJson<String?>(json['tvgId']),
      tmdbId: serializer.fromJson<String?>(json['tmdbId']),
      tvgName: serializer.fromJson<String?>(json['tvgName']),
      logo: serializer.fromJson<String?>(json['logo']),
      groupTitle: serializer.fromJson<String?>(json['groupTitle']),
      streamUrl: serializer.fromJson<String>(json['streamUrl']),
      category: serializer.fromJson<String?>(json['category']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isWatched: serializer.fromJson<bool>(json['isWatched']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
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
      'category': serializer.toJson<String?>(category),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isWatched': serializer.toJson<bool>(isWatched),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
    };
  }

  ChannelData copyWith({
    String? id,
    String? playlistId,
    String? name,
    Value<String?> tvgId = const Value.absent(),
    Value<String?> tmdbId = const Value.absent(),
    Value<String?> tvgName = const Value.absent(),
    Value<String?> logo = const Value.absent(),
    Value<String?> groupTitle = const Value.absent(),
    String? streamUrl,
    Value<String?> category = const Value.absent(),
    bool? isFavorite,
    bool? isWatched,
    Value<DateTime?> lastUpdated = const Value.absent(),
  }) => ChannelData(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    name: name ?? this.name,
    tvgId: tvgId.present ? tvgId.value : this.tvgId,
    tmdbId: tmdbId.present ? tmdbId.value : this.tmdbId,
    tvgName: tvgName.present ? tvgName.value : this.tvgName,
    logo: logo.present ? logo.value : this.logo,
    groupTitle: groupTitle.present ? groupTitle.value : this.groupTitle,
    streamUrl: streamUrl ?? this.streamUrl,
    category: category.present ? category.value : this.category,
    isFavorite: isFavorite ?? this.isFavorite,
    isWatched: isWatched ?? this.isWatched,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
  );
  ChannelData copyWithCompanion(ChannelCompanion data) {
    return ChannelData(
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
      category: data.category.present ? data.category.value : this.category,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      isWatched: data.isWatched.present ? data.isWatched.value : this.isWatched,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChannelData(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('name: $name, ')
          ..write('tvgId: $tvgId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('tvgName: $tvgName, ')
          ..write('logo: $logo, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('category: $category, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isWatched: $isWatched, ')
          ..write('lastUpdated: $lastUpdated')
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
    category,
    isFavorite,
    isWatched,
    lastUpdated,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelData &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.name == this.name &&
          other.tvgId == this.tvgId &&
          other.tmdbId == this.tmdbId &&
          other.tvgName == this.tvgName &&
          other.logo == this.logo &&
          other.groupTitle == this.groupTitle &&
          other.streamUrl == this.streamUrl &&
          other.category == this.category &&
          other.isFavorite == this.isFavorite &&
          other.isWatched == this.isWatched &&
          other.lastUpdated == this.lastUpdated);
}

class ChannelCompanion extends UpdateCompanion<ChannelData> {
  final Value<String> id;
  final Value<String> playlistId;
  final Value<String> name;
  final Value<String?> tvgId;
  final Value<String?> tmdbId;
  final Value<String?> tvgName;
  final Value<String?> logo;
  final Value<String?> groupTitle;
  final Value<String> streamUrl;
  final Value<String?> category;
  final Value<bool> isFavorite;
  final Value<bool> isWatched;
  final Value<DateTime?> lastUpdated;
  final Value<int> rowid;
  const ChannelCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.name = const Value.absent(),
    this.tvgId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.tvgName = const Value.absent(),
    this.logo = const Value.absent(),
    this.groupTitle = const Value.absent(),
    this.streamUrl = const Value.absent(),
    this.category = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChannelCompanion.insert({
    this.id = const Value.absent(),
    required String playlistId,
    required String name,
    this.tvgId = const Value.absent(),
    this.tmdbId = const Value.absent(),
    this.tvgName = const Value.absent(),
    this.logo = const Value.absent(),
    this.groupTitle = const Value.absent(),
    required String streamUrl,
    this.category = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isWatched = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : playlistId = Value(playlistId),
       name = Value(name),
       streamUrl = Value(streamUrl);
  static Insertable<ChannelData> custom({
    Expression<String>? id,
    Expression<String>? playlistId,
    Expression<String>? name,
    Expression<String>? tvgId,
    Expression<String>? tmdbId,
    Expression<String>? tvgName,
    Expression<String>? logo,
    Expression<String>? groupTitle,
    Expression<String>? streamUrl,
    Expression<String>? category,
    Expression<bool>? isFavorite,
    Expression<bool>? isWatched,
    Expression<DateTime>? lastUpdated,
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
      if (category != null) 'category': category,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isWatched != null) 'is_watched': isWatched,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChannelCompanion copyWith({
    Value<String>? id,
    Value<String>? playlistId,
    Value<String>? name,
    Value<String?>? tvgId,
    Value<String?>? tmdbId,
    Value<String?>? tvgName,
    Value<String?>? logo,
    Value<String?>? groupTitle,
    Value<String>? streamUrl,
    Value<String?>? category,
    Value<bool>? isFavorite,
    Value<bool>? isWatched,
    Value<DateTime?>? lastUpdated,
    Value<int>? rowid,
  }) {
    return ChannelCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      name: name ?? this.name,
      tvgId: tvgId ?? this.tvgId,
      tmdbId: tmdbId ?? this.tmdbId,
      tvgName: tvgName ?? this.tvgName,
      logo: logo ?? this.logo,
      groupTitle: groupTitle ?? this.groupTitle,
      streamUrl: streamUrl ?? this.streamUrl,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatched: isWatched ?? this.isWatched,
      lastUpdated: lastUpdated ?? this.lastUpdated,
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isWatched.present) {
      map['is_watched'] = Variable<bool>(isWatched.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('name: $name, ')
          ..write('tvgId: $tvgId, ')
          ..write('tmdbId: $tmdbId, ')
          ..write('tvgName: $tvgName, ')
          ..write('logo: $logo, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('streamUrl: $streamUrl, ')
          ..write('category: $category, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isWatched: $isWatched, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlaylistTable playlist = $PlaylistTable(this);
  late final $ChannelTable channel = $ChannelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [playlist, channel];
}

typedef $$PlaylistTableCreateCompanionBuilder =
    PlaylistCompanion Function({
      Value<String> id,
      required String name,
      required String url,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
      Value<bool> isSelected,
      Value<int> rowid,
    });
typedef $$PlaylistTableUpdateCompanionBuilder =
    PlaylistCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> url,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
      Value<bool> isSelected,
      Value<int> rowid,
    });

class $$PlaylistTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistTable> {
  $$PlaylistTableFilterComposer({
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

  ColumnFilters<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlaylistTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistTable> {
  $$PlaylistTableOrderingComposer({
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

  ColumnOrderings<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistTable> {
  $$PlaylistTableAnnotationComposer({
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

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => column,
  );
}

class $$PlaylistTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistTable,
          PlaylistData,
          $$PlaylistTableFilterComposer,
          $$PlaylistTableOrderingComposer,
          $$PlaylistTableAnnotationComposer,
          $$PlaylistTableCreateCompanionBuilder,
          $$PlaylistTableUpdateCompanionBuilder,
          (
            PlaylistData,
            BaseReferences<_$AppDatabase, $PlaylistTable, PlaylistData>,
          ),
          PlaylistData,
          PrefetchHooks Function()
        > {
  $$PlaylistTableTableManager(_$AppDatabase db, $PlaylistTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistCompanion(
                id: id,
                name: name,
                url: url,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
                isSelected: isSelected,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                required String url,
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistCompanion.insert(
                id: id,
                name: name,
                url: url,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
                isSelected: isSelected,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlaylistTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistTable,
      PlaylistData,
      $$PlaylistTableFilterComposer,
      $$PlaylistTableOrderingComposer,
      $$PlaylistTableAnnotationComposer,
      $$PlaylistTableCreateCompanionBuilder,
      $$PlaylistTableUpdateCompanionBuilder,
      (
        PlaylistData,
        BaseReferences<_$AppDatabase, $PlaylistTable, PlaylistData>,
      ),
      PlaylistData,
      PrefetchHooks Function()
    >;
typedef $$ChannelTableCreateCompanionBuilder =
    ChannelCompanion Function({
      Value<String> id,
      required String playlistId,
      required String name,
      Value<String?> tvgId,
      Value<String?> tmdbId,
      Value<String?> tvgName,
      Value<String?> logo,
      Value<String?> groupTitle,
      required String streamUrl,
      Value<String?> category,
      Value<bool> isFavorite,
      Value<bool> isWatched,
      Value<DateTime?> lastUpdated,
      Value<int> rowid,
    });
typedef $$ChannelTableUpdateCompanionBuilder =
    ChannelCompanion Function({
      Value<String> id,
      Value<String> playlistId,
      Value<String> name,
      Value<String?> tvgId,
      Value<String?> tmdbId,
      Value<String?> tvgName,
      Value<String?> logo,
      Value<String?> groupTitle,
      Value<String> streamUrl,
      Value<String?> category,
      Value<bool> isFavorite,
      Value<bool> isWatched,
      Value<DateTime?> lastUpdated,
      Value<int> rowid,
    });

class $$ChannelTableFilterComposer
    extends Composer<_$AppDatabase, $ChannelTable> {
  $$ChannelTableFilterComposer({
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

  ColumnFilters<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
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

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
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
}

class $$ChannelTableOrderingComposer
    extends Composer<_$AppDatabase, $ChannelTable> {
  $$ChannelTableOrderingComposer({
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

  ColumnOrderings<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
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

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
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
}

class $$ChannelTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChannelTable> {
  $$ChannelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => column,
  );

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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isWatched =>
      $composableBuilder(column: $table.isWatched, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );
}

class $$ChannelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChannelTable,
          ChannelData,
          $$ChannelTableFilterComposer,
          $$ChannelTableOrderingComposer,
          $$ChannelTableAnnotationComposer,
          $$ChannelTableCreateCompanionBuilder,
          $$ChannelTableUpdateCompanionBuilder,
          (
            ChannelData,
            BaseReferences<_$AppDatabase, $ChannelTable, ChannelData>,
          ),
          ChannelData,
          PrefetchHooks Function()
        > {
  $$ChannelTableTableManager(_$AppDatabase db, $ChannelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChannelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChannelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChannelTableAnnotationComposer($db: db, $table: table),
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
                Value<String?> category = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isWatched = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChannelCompanion(
                id: id,
                playlistId: playlistId,
                name: name,
                tvgId: tvgId,
                tmdbId: tmdbId,
                tvgName: tvgName,
                logo: logo,
                groupTitle: groupTitle,
                streamUrl: streamUrl,
                category: category,
                isFavorite: isFavorite,
                isWatched: isWatched,
                lastUpdated: lastUpdated,
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
                Value<String?> category = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isWatched = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChannelCompanion.insert(
                id: id,
                playlistId: playlistId,
                name: name,
                tvgId: tvgId,
                tmdbId: tmdbId,
                tvgName: tvgName,
                logo: logo,
                groupTitle: groupTitle,
                streamUrl: streamUrl,
                category: category,
                isFavorite: isFavorite,
                isWatched: isWatched,
                lastUpdated: lastUpdated,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChannelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChannelTable,
      ChannelData,
      $$ChannelTableFilterComposer,
      $$ChannelTableOrderingComposer,
      $$ChannelTableAnnotationComposer,
      $$ChannelTableCreateCompanionBuilder,
      $$ChannelTableUpdateCompanionBuilder,
      (ChannelData, BaseReferences<_$AppDatabase, $ChannelTable, ChannelData>),
      ChannelData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlaylistTableTableManager get playlist =>
      $$PlaylistTableTableManager(_db, _db.playlist);
  $$ChannelTableTableManager get channel =>
      $$ChannelTableTableManager(_db, _db.channel);
}
