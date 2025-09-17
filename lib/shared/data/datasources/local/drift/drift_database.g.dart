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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
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
  static const VerificationMeta _ulidMeta = const VerificationMeta('ulid');
  @override
  late final GeneratedColumn<String> ulid = GeneratedColumn<String>(
    'ulid',
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
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _templateMeta = const VerificationMeta(
    'template',
  );
  @override
  late final GeneratedColumn<String> template = GeneratedColumn<String>(
    'template',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    ulid,
    type,
    contentType,
    filePath,
    epgLink,
    url,
    template,
    isActive,
    lastUpdated,
    createdAt,
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
    if (data.containsKey('ulid')) {
      context.handle(
        _ulidMeta,
        ulid.isAcceptableOrUnknown(data['ulid']!, _ulidMeta),
      );
    } else if (isInserting) {
      context.missing(_ulidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
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
    }
    if (data.containsKey('template')) {
      context.handle(
        _templateMeta,
        template.isAcceptableOrUnknown(data['template']!, _templateMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
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
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      ulid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ulid'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      ),
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      epgLink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}epg_link'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      template: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
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
  final int id;
  final String name;
  final String ulid;
  final String? type;
  final String? contentType;
  final String? filePath;
  final String? epgLink;
  final String? url;
  final String? template;
  final bool isActive;
  final DateTime? lastUpdated;
  final DateTime createdAt;
  const PlaylistDriftData({
    required this.id,
    required this.name,
    required this.ulid,
    this.type,
    this.contentType,
    this.filePath,
    this.epgLink,
    this.url,
    this.template,
    required this.isActive,
    this.lastUpdated,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ulid'] = Variable<String>(ulid);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || contentType != null) {
      map['content_type'] = Variable<String>(contentType);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || epgLink != null) {
      map['epg_link'] = Variable<String>(epgLink);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || template != null) {
      map['template'] = Variable<String>(template);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlaylistDriftCompanion toCompanion(bool nullToAbsent) {
    return PlaylistDriftCompanion(
      id: Value(id),
      name: Value(name),
      ulid: Value(ulid),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      contentType: contentType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentType),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      epgLink: epgLink == null && nullToAbsent
          ? const Value.absent()
          : Value(epgLink),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      template: template == null && nullToAbsent
          ? const Value.absent()
          : Value(template),
      isActive: Value(isActive),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      createdAt: Value(createdAt),
    );
  }

  factory PlaylistDriftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistDriftData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ulid: serializer.fromJson<String>(json['ulid']),
      type: serializer.fromJson<String?>(json['type']),
      contentType: serializer.fromJson<String?>(json['contentType']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      epgLink: serializer.fromJson<String?>(json['epgLink']),
      url: serializer.fromJson<String?>(json['url']),
      template: serializer.fromJson<String?>(json['template']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ulid': serializer.toJson<String>(ulid),
      'type': serializer.toJson<String?>(type),
      'contentType': serializer.toJson<String?>(contentType),
      'filePath': serializer.toJson<String?>(filePath),
      'epgLink': serializer.toJson<String?>(epgLink),
      'url': serializer.toJson<String?>(url),
      'template': serializer.toJson<String?>(template),
      'isActive': serializer.toJson<bool>(isActive),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlaylistDriftData copyWith({
    int? id,
    String? name,
    String? ulid,
    Value<String?> type = const Value.absent(),
    Value<String?> contentType = const Value.absent(),
    Value<String?> filePath = const Value.absent(),
    Value<String?> epgLink = const Value.absent(),
    Value<String?> url = const Value.absent(),
    Value<String?> template = const Value.absent(),
    bool? isActive,
    Value<DateTime?> lastUpdated = const Value.absent(),
    DateTime? createdAt,
  }) => PlaylistDriftData(
    id: id ?? this.id,
    name: name ?? this.name,
    ulid: ulid ?? this.ulid,
    type: type.present ? type.value : this.type,
    contentType: contentType.present ? contentType.value : this.contentType,
    filePath: filePath.present ? filePath.value : this.filePath,
    epgLink: epgLink.present ? epgLink.value : this.epgLink,
    url: url.present ? url.value : this.url,
    template: template.present ? template.value : this.template,
    isActive: isActive ?? this.isActive,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
    createdAt: createdAt ?? this.createdAt,
  );
  PlaylistDriftData copyWithCompanion(PlaylistDriftCompanion data) {
    return PlaylistDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ulid: data.ulid.present ? data.ulid.value : this.ulid,
      type: data.type.present ? data.type.value : this.type,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      epgLink: data.epgLink.present ? data.epgLink.value : this.epgLink,
      url: data.url.present ? data.url.value : this.url,
      template: data.template.present ? data.template.value : this.template,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ulid: $ulid, ')
          ..write('type: $type, ')
          ..write('contentType: $contentType, ')
          ..write('filePath: $filePath, ')
          ..write('epgLink: $epgLink, ')
          ..write('url: $url, ')
          ..write('template: $template, ')
          ..write('isActive: $isActive, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    ulid,
    type,
    contentType,
    filePath,
    epgLink,
    url,
    template,
    isActive,
    lastUpdated,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.ulid == this.ulid &&
          other.type == this.type &&
          other.contentType == this.contentType &&
          other.filePath == this.filePath &&
          other.epgLink == this.epgLink &&
          other.url == this.url &&
          other.template == this.template &&
          other.isActive == this.isActive &&
          other.lastUpdated == this.lastUpdated &&
          other.createdAt == this.createdAt);
}

class PlaylistDriftCompanion extends UpdateCompanion<PlaylistDriftData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> ulid;
  final Value<String?> type;
  final Value<String?> contentType;
  final Value<String?> filePath;
  final Value<String?> epgLink;
  final Value<String?> url;
  final Value<String?> template;
  final Value<bool> isActive;
  final Value<DateTime?> lastUpdated;
  final Value<DateTime> createdAt;
  const PlaylistDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ulid = const Value.absent(),
    this.type = const Value.absent(),
    this.contentType = const Value.absent(),
    this.filePath = const Value.absent(),
    this.epgLink = const Value.absent(),
    this.url = const Value.absent(),
    this.template = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlaylistDriftCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String ulid,
    this.type = const Value.absent(),
    this.contentType = const Value.absent(),
    this.filePath = const Value.absent(),
    this.epgLink = const Value.absent(),
    this.url = const Value.absent(),
    this.template = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       ulid = Value(ulid);
  static Insertable<PlaylistDriftData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? ulid,
    Expression<String>? type,
    Expression<String>? contentType,
    Expression<String>? filePath,
    Expression<String>? epgLink,
    Expression<String>? url,
    Expression<String>? template,
    Expression<bool>? isActive,
    Expression<DateTime>? lastUpdated,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ulid != null) 'ulid': ulid,
      if (type != null) 'type': type,
      if (contentType != null) 'content_type': contentType,
      if (filePath != null) 'file_path': filePath,
      if (epgLink != null) 'epg_link': epgLink,
      if (url != null) 'url': url,
      if (template != null) 'template': template,
      if (isActive != null) 'is_active': isActive,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlaylistDriftCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? ulid,
    Value<String?>? type,
    Value<String?>? contentType,
    Value<String?>? filePath,
    Value<String?>? epgLink,
    Value<String?>? url,
    Value<String?>? template,
    Value<bool>? isActive,
    Value<DateTime?>? lastUpdated,
    Value<DateTime>? createdAt,
  }) {
    return PlaylistDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ulid: ulid ?? this.ulid,
      type: type ?? this.type,
      contentType: contentType ?? this.contentType,
      filePath: filePath ?? this.filePath,
      epgLink: epgLink ?? this.epgLink,
      url: url ?? this.url,
      template: template ?? this.template,
      isActive: isActive ?? this.isActive,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ulid.present) {
      map['ulid'] = Variable<String>(ulid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (epgLink.present) {
      map['epg_link'] = Variable<String>(epgLink.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (template.present) {
      map['template'] = Variable<String>(template.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ulid: $ulid, ')
          ..write('type: $type, ')
          ..write('contentType: $contentType, ')
          ..write('filePath: $filePath, ')
          ..write('epgLink: $epgLink, ')
          ..write('url: $url, ')
          ..write('template: $template, ')
          ..write('isActive: $isActive, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlaylistUrlHistoryDriftTable extends PlaylistUrlHistoryDrift
    with TableInfo<$PlaylistUrlHistoryDriftTable, PlaylistUrlHistoryDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistUrlHistoryDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
  @override
  List<GeneratedColumn> get $columns => [id, url, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_url_history_drift';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistUrlHistoryDriftData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistUrlHistoryDriftData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistUrlHistoryDriftData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlaylistUrlHistoryDriftTable createAlias(String alias) {
    return $PlaylistUrlHistoryDriftTable(attachedDatabase, alias);
  }
}

class PlaylistUrlHistoryDriftData extends DataClass
    implements Insertable<PlaylistUrlHistoryDriftData> {
  final int id;
  final String? url;
  final DateTime createdAt;
  const PlaylistUrlHistoryDriftData({
    required this.id,
    this.url,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlaylistUrlHistoryDriftCompanion toCompanion(bool nullToAbsent) {
    return PlaylistUrlHistoryDriftCompanion(
      id: Value(id),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      createdAt: Value(createdAt),
    );
  }

  factory PlaylistUrlHistoryDriftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistUrlHistoryDriftData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String?>(json['url']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String?>(url),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlaylistUrlHistoryDriftData copyWith({
    int? id,
    Value<String?> url = const Value.absent(),
    DateTime? createdAt,
  }) => PlaylistUrlHistoryDriftData(
    id: id ?? this.id,
    url: url.present ? url.value : this.url,
    createdAt: createdAt ?? this.createdAt,
  );
  PlaylistUrlHistoryDriftData copyWithCompanion(
    PlaylistUrlHistoryDriftCompanion data,
  ) {
    return PlaylistUrlHistoryDriftData(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistUrlHistoryDriftData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistUrlHistoryDriftData &&
          other.id == this.id &&
          other.url == this.url &&
          other.createdAt == this.createdAt);
}

class PlaylistUrlHistoryDriftCompanion
    extends UpdateCompanion<PlaylistUrlHistoryDriftData> {
  final Value<int> id;
  final Value<String?> url;
  final Value<DateTime> createdAt;
  const PlaylistUrlHistoryDriftCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlaylistUrlHistoryDriftCompanion.insert({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<PlaylistUrlHistoryDriftData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlaylistUrlHistoryDriftCompanion copyWith({
    Value<int>? id,
    Value<String?>? url,
    Value<DateTime>? createdAt,
  }) {
    return PlaylistUrlHistoryDriftCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistUrlHistoryDriftCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TrackDriftTable extends TrackDrift
    with TableInfo<$TrackDriftTable, TrackDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlist_drift (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linksMeta = const VerificationMeta('links');
  @override
  late final GeneratedColumn<String> links = GeneratedColumn<String>(
    'links',
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
  static const VerificationMeta _imdbIdMeta = const VerificationMeta('imdbId');
  @override
  late final GeneratedColumn<String> imdbId = GeneratedColumn<String>(
    'imdb_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _tvgLogoMeta = const VerificationMeta(
    'tvgLogo',
  );
  @override
  late final GeneratedColumn<String> tvgLogo = GeneratedColumn<String>(
    'tvg_logo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isNsfwMeta = const VerificationMeta('isNsfw');
  @override
  late final GeneratedColumn<bool> isNsfw = GeneratedColumn<bool>(
    'is_nsfw',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_nsfw" IN (0, 1))',
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
  static const VerificationMeta _attributesMeta = const VerificationMeta(
    'attributes',
  );
  @override
  late final GeneratedColumn<String> attributes = GeneratedColumn<String>(
    'attributes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kodiPropsMeta = const VerificationMeta(
    'kodiProps',
  );
  @override
  late final GeneratedColumn<String> kodiProps = GeneratedColumn<String>(
    'kodi_props',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extVlcOptsMeta = const VerificationMeta(
    'extVlcOpts',
  );
  @override
  late final GeneratedColumn<String> extVlcOpts = GeneratedColumn<String>(
    'ext_vlc_opts',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _httpHeadersMeta = const VerificationMeta(
    'httpHeaders',
  );
  @override
  late final GeneratedColumn<String> httpHeaders = GeneratedColumn<String>(
    'http_headers',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    title,
    contentType,
    links,
    groupTitle,
    imdbId,
    tvgId,
    tvgName,
    tvgLogo,
    desc,
    duration,
    isNsfw,
    isMovie,
    isLiveTv,
    isTvSerie,
    attributes,
    kodiProps,
    extVlcOpts,
    httpHeaders,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'track_drift';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrackDriftData> instance, {
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('links')) {
      context.handle(
        _linksMeta,
        links.isAcceptableOrUnknown(data['links']!, _linksMeta),
      );
    }
    if (data.containsKey('group_title')) {
      context.handle(
        _groupTitleMeta,
        groupTitle.isAcceptableOrUnknown(data['group_title']!, _groupTitleMeta),
      );
    }
    if (data.containsKey('imdb_id')) {
      context.handle(
        _imdbIdMeta,
        imdbId.isAcceptableOrUnknown(data['imdb_id']!, _imdbIdMeta),
      );
    }
    if (data.containsKey('tvg_id')) {
      context.handle(
        _tvgIdMeta,
        tvgId.isAcceptableOrUnknown(data['tvg_id']!, _tvgIdMeta),
      );
    }
    if (data.containsKey('tvg_name')) {
      context.handle(
        _tvgNameMeta,
        tvgName.isAcceptableOrUnknown(data['tvg_name']!, _tvgNameMeta),
      );
    }
    if (data.containsKey('tvg_logo')) {
      context.handle(
        _tvgLogoMeta,
        tvgLogo.isAcceptableOrUnknown(data['tvg_logo']!, _tvgLogoMeta),
      );
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('is_nsfw')) {
      context.handle(
        _isNsfwMeta,
        isNsfw.isAcceptableOrUnknown(data['is_nsfw']!, _isNsfwMeta),
      );
    }
    if (data.containsKey('is_movie')) {
      context.handle(
        _isMovieMeta,
        isMovie.isAcceptableOrUnknown(data['is_movie']!, _isMovieMeta),
      );
    }
    if (data.containsKey('is_live_tv')) {
      context.handle(
        _isLiveTvMeta,
        isLiveTv.isAcceptableOrUnknown(data['is_live_tv']!, _isLiveTvMeta),
      );
    }
    if (data.containsKey('is_tv_serie')) {
      context.handle(
        _isTvSerieMeta,
        isTvSerie.isAcceptableOrUnknown(data['is_tv_serie']!, _isTvSerieMeta),
      );
    }
    if (data.containsKey('attributes')) {
      context.handle(
        _attributesMeta,
        attributes.isAcceptableOrUnknown(data['attributes']!, _attributesMeta),
      );
    }
    if (data.containsKey('kodi_props')) {
      context.handle(
        _kodiPropsMeta,
        kodiProps.isAcceptableOrUnknown(data['kodi_props']!, _kodiPropsMeta),
      );
    }
    if (data.containsKey('ext_vlc_opts')) {
      context.handle(
        _extVlcOptsMeta,
        extVlcOpts.isAcceptableOrUnknown(
          data['ext_vlc_opts']!,
          _extVlcOptsMeta,
        ),
      );
    }
    if (data.containsKey('http_headers')) {
      context.handle(
        _httpHeadersMeta,
        httpHeaders.isAcceptableOrUnknown(
          data['http_headers']!,
          _httpHeadersMeta,
        ),
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
  TrackDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackDriftData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      ),
      links: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}links'],
      ),
      groupTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_title'],
      ),
      imdbId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imdb_id'],
      ),
      tvgId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tvg_id'],
      ),
      tvgName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tvg_name'],
      ),
      tvgLogo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tvg_logo'],
      ),
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      isNsfw: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_nsfw'],
      )!,
      isMovie: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_movie'],
      )!,
      isLiveTv: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_live_tv'],
      )!,
      isTvSerie: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_tv_serie'],
      )!,
      attributes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attributes'],
      ),
      kodiProps: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kodi_props'],
      ),
      extVlcOpts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ext_vlc_opts'],
      ),
      httpHeaders: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}http_headers'],
      ),
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      ),
    );
  }

  @override
  $TrackDriftTable createAlias(String alias) {
    return $TrackDriftTable(attachedDatabase, alias);
  }
}

class TrackDriftData extends DataClass implements Insertable<TrackDriftData> {
  final int id;
  final int playlistId;
  final String title;
  final String? contentType;
  final String? links;
  final String? groupTitle;
  final String? imdbId;
  final String? tvgId;
  final String? tvgName;
  final String? tvgLogo;
  final String? desc;
  final int? duration;
  final bool isNsfw;
  final bool isMovie;
  final bool isLiveTv;
  final bool isTvSerie;
  final String? attributes;
  final String? kodiProps;
  final String? extVlcOpts;
  final String? httpHeaders;
  final DateTime? lastUpdated;
  const TrackDriftData({
    required this.id,
    required this.playlistId,
    required this.title,
    this.contentType,
    this.links,
    this.groupTitle,
    this.imdbId,
    this.tvgId,
    this.tvgName,
    this.tvgLogo,
    this.desc,
    this.duration,
    required this.isNsfw,
    required this.isMovie,
    required this.isLiveTv,
    required this.isTvSerie,
    this.attributes,
    this.kodiProps,
    this.extVlcOpts,
    this.httpHeaders,
    this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || contentType != null) {
      map['content_type'] = Variable<String>(contentType);
    }
    if (!nullToAbsent || links != null) {
      map['links'] = Variable<String>(links);
    }
    if (!nullToAbsent || groupTitle != null) {
      map['group_title'] = Variable<String>(groupTitle);
    }
    if (!nullToAbsent || imdbId != null) {
      map['imdb_id'] = Variable<String>(imdbId);
    }
    if (!nullToAbsent || tvgId != null) {
      map['tvg_id'] = Variable<String>(tvgId);
    }
    if (!nullToAbsent || tvgName != null) {
      map['tvg_name'] = Variable<String>(tvgName);
    }
    if (!nullToAbsent || tvgLogo != null) {
      map['tvg_logo'] = Variable<String>(tvgLogo);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    map['is_nsfw'] = Variable<bool>(isNsfw);
    map['is_movie'] = Variable<bool>(isMovie);
    map['is_live_tv'] = Variable<bool>(isLiveTv);
    map['is_tv_serie'] = Variable<bool>(isTvSerie);
    if (!nullToAbsent || attributes != null) {
      map['attributes'] = Variable<String>(attributes);
    }
    if (!nullToAbsent || kodiProps != null) {
      map['kodi_props'] = Variable<String>(kodiProps);
    }
    if (!nullToAbsent || extVlcOpts != null) {
      map['ext_vlc_opts'] = Variable<String>(extVlcOpts);
    }
    if (!nullToAbsent || httpHeaders != null) {
      map['http_headers'] = Variable<String>(httpHeaders);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    return map;
  }

  TrackDriftCompanion toCompanion(bool nullToAbsent) {
    return TrackDriftCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      title: Value(title),
      contentType: contentType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentType),
      links: links == null && nullToAbsent
          ? const Value.absent()
          : Value(links),
      groupTitle: groupTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(groupTitle),
      imdbId: imdbId == null && nullToAbsent
          ? const Value.absent()
          : Value(imdbId),
      tvgId: tvgId == null && nullToAbsent
          ? const Value.absent()
          : Value(tvgId),
      tvgName: tvgName == null && nullToAbsent
          ? const Value.absent()
          : Value(tvgName),
      tvgLogo: tvgLogo == null && nullToAbsent
          ? const Value.absent()
          : Value(tvgLogo),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      isNsfw: Value(isNsfw),
      isMovie: Value(isMovie),
      isLiveTv: Value(isLiveTv),
      isTvSerie: Value(isTvSerie),
      attributes: attributes == null && nullToAbsent
          ? const Value.absent()
          : Value(attributes),
      kodiProps: kodiProps == null && nullToAbsent
          ? const Value.absent()
          : Value(kodiProps),
      extVlcOpts: extVlcOpts == null && nullToAbsent
          ? const Value.absent()
          : Value(extVlcOpts),
      httpHeaders: httpHeaders == null && nullToAbsent
          ? const Value.absent()
          : Value(httpHeaders),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory TrackDriftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackDriftData(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      title: serializer.fromJson<String>(json['title']),
      contentType: serializer.fromJson<String?>(json['contentType']),
      links: serializer.fromJson<String?>(json['links']),
      groupTitle: serializer.fromJson<String?>(json['groupTitle']),
      imdbId: serializer.fromJson<String?>(json['imdbId']),
      tvgId: serializer.fromJson<String?>(json['tvgId']),
      tvgName: serializer.fromJson<String?>(json['tvgName']),
      tvgLogo: serializer.fromJson<String?>(json['tvgLogo']),
      desc: serializer.fromJson<String?>(json['desc']),
      duration: serializer.fromJson<int?>(json['duration']),
      isNsfw: serializer.fromJson<bool>(json['isNsfw']),
      isMovie: serializer.fromJson<bool>(json['isMovie']),
      isLiveTv: serializer.fromJson<bool>(json['isLiveTv']),
      isTvSerie: serializer.fromJson<bool>(json['isTvSerie']),
      attributes: serializer.fromJson<String?>(json['attributes']),
      kodiProps: serializer.fromJson<String?>(json['kodiProps']),
      extVlcOpts: serializer.fromJson<String?>(json['extVlcOpts']),
      httpHeaders: serializer.fromJson<String?>(json['httpHeaders']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'title': serializer.toJson<String>(title),
      'contentType': serializer.toJson<String?>(contentType),
      'links': serializer.toJson<String?>(links),
      'groupTitle': serializer.toJson<String?>(groupTitle),
      'imdbId': serializer.toJson<String?>(imdbId),
      'tvgId': serializer.toJson<String?>(tvgId),
      'tvgName': serializer.toJson<String?>(tvgName),
      'tvgLogo': serializer.toJson<String?>(tvgLogo),
      'desc': serializer.toJson<String?>(desc),
      'duration': serializer.toJson<int?>(duration),
      'isNsfw': serializer.toJson<bool>(isNsfw),
      'isMovie': serializer.toJson<bool>(isMovie),
      'isLiveTv': serializer.toJson<bool>(isLiveTv),
      'isTvSerie': serializer.toJson<bool>(isTvSerie),
      'attributes': serializer.toJson<String?>(attributes),
      'kodiProps': serializer.toJson<String?>(kodiProps),
      'extVlcOpts': serializer.toJson<String?>(extVlcOpts),
      'httpHeaders': serializer.toJson<String?>(httpHeaders),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
    };
  }

  TrackDriftData copyWith({
    int? id,
    int? playlistId,
    String? title,
    Value<String?> contentType = const Value.absent(),
    Value<String?> links = const Value.absent(),
    Value<String?> groupTitle = const Value.absent(),
    Value<String?> imdbId = const Value.absent(),
    Value<String?> tvgId = const Value.absent(),
    Value<String?> tvgName = const Value.absent(),
    Value<String?> tvgLogo = const Value.absent(),
    Value<String?> desc = const Value.absent(),
    Value<int?> duration = const Value.absent(),
    bool? isNsfw,
    bool? isMovie,
    bool? isLiveTv,
    bool? isTvSerie,
    Value<String?> attributes = const Value.absent(),
    Value<String?> kodiProps = const Value.absent(),
    Value<String?> extVlcOpts = const Value.absent(),
    Value<String?> httpHeaders = const Value.absent(),
    Value<DateTime?> lastUpdated = const Value.absent(),
  }) => TrackDriftData(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    title: title ?? this.title,
    contentType: contentType.present ? contentType.value : this.contentType,
    links: links.present ? links.value : this.links,
    groupTitle: groupTitle.present ? groupTitle.value : this.groupTitle,
    imdbId: imdbId.present ? imdbId.value : this.imdbId,
    tvgId: tvgId.present ? tvgId.value : this.tvgId,
    tvgName: tvgName.present ? tvgName.value : this.tvgName,
    tvgLogo: tvgLogo.present ? tvgLogo.value : this.tvgLogo,
    desc: desc.present ? desc.value : this.desc,
    duration: duration.present ? duration.value : this.duration,
    isNsfw: isNsfw ?? this.isNsfw,
    isMovie: isMovie ?? this.isMovie,
    isLiveTv: isLiveTv ?? this.isLiveTv,
    isTvSerie: isTvSerie ?? this.isTvSerie,
    attributes: attributes.present ? attributes.value : this.attributes,
    kodiProps: kodiProps.present ? kodiProps.value : this.kodiProps,
    extVlcOpts: extVlcOpts.present ? extVlcOpts.value : this.extVlcOpts,
    httpHeaders: httpHeaders.present ? httpHeaders.value : this.httpHeaders,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
  );
  TrackDriftData copyWithCompanion(TrackDriftCompanion data) {
    return TrackDriftData(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      title: data.title.present ? data.title.value : this.title,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      links: data.links.present ? data.links.value : this.links,
      groupTitle: data.groupTitle.present
          ? data.groupTitle.value
          : this.groupTitle,
      imdbId: data.imdbId.present ? data.imdbId.value : this.imdbId,
      tvgId: data.tvgId.present ? data.tvgId.value : this.tvgId,
      tvgName: data.tvgName.present ? data.tvgName.value : this.tvgName,
      tvgLogo: data.tvgLogo.present ? data.tvgLogo.value : this.tvgLogo,
      desc: data.desc.present ? data.desc.value : this.desc,
      duration: data.duration.present ? data.duration.value : this.duration,
      isNsfw: data.isNsfw.present ? data.isNsfw.value : this.isNsfw,
      isMovie: data.isMovie.present ? data.isMovie.value : this.isMovie,
      isLiveTv: data.isLiveTv.present ? data.isLiveTv.value : this.isLiveTv,
      isTvSerie: data.isTvSerie.present ? data.isTvSerie.value : this.isTvSerie,
      attributes: data.attributes.present
          ? data.attributes.value
          : this.attributes,
      kodiProps: data.kodiProps.present ? data.kodiProps.value : this.kodiProps,
      extVlcOpts: data.extVlcOpts.present
          ? data.extVlcOpts.value
          : this.extVlcOpts,
      httpHeaders: data.httpHeaders.present
          ? data.httpHeaders.value
          : this.httpHeaders,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackDriftData(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title, ')
          ..write('contentType: $contentType, ')
          ..write('links: $links, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('imdbId: $imdbId, ')
          ..write('tvgId: $tvgId, ')
          ..write('tvgName: $tvgName, ')
          ..write('tvgLogo: $tvgLogo, ')
          ..write('desc: $desc, ')
          ..write('duration: $duration, ')
          ..write('isNsfw: $isNsfw, ')
          ..write('isMovie: $isMovie, ')
          ..write('isLiveTv: $isLiveTv, ')
          ..write('isTvSerie: $isTvSerie, ')
          ..write('attributes: $attributes, ')
          ..write('kodiProps: $kodiProps, ')
          ..write('extVlcOpts: $extVlcOpts, ')
          ..write('httpHeaders: $httpHeaders, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    playlistId,
    title,
    contentType,
    links,
    groupTitle,
    imdbId,
    tvgId,
    tvgName,
    tvgLogo,
    desc,
    duration,
    isNsfw,
    isMovie,
    isLiveTv,
    isTvSerie,
    attributes,
    kodiProps,
    extVlcOpts,
    httpHeaders,
    lastUpdated,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackDriftData &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.title == this.title &&
          other.contentType == this.contentType &&
          other.links == this.links &&
          other.groupTitle == this.groupTitle &&
          other.imdbId == this.imdbId &&
          other.tvgId == this.tvgId &&
          other.tvgName == this.tvgName &&
          other.tvgLogo == this.tvgLogo &&
          other.desc == this.desc &&
          other.duration == this.duration &&
          other.isNsfw == this.isNsfw &&
          other.isMovie == this.isMovie &&
          other.isLiveTv == this.isLiveTv &&
          other.isTvSerie == this.isTvSerie &&
          other.attributes == this.attributes &&
          other.kodiProps == this.kodiProps &&
          other.extVlcOpts == this.extVlcOpts &&
          other.httpHeaders == this.httpHeaders &&
          other.lastUpdated == this.lastUpdated);
}

class TrackDriftCompanion extends UpdateCompanion<TrackDriftData> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<String> title;
  final Value<String?> contentType;
  final Value<String?> links;
  final Value<String?> groupTitle;
  final Value<String?> imdbId;
  final Value<String?> tvgId;
  final Value<String?> tvgName;
  final Value<String?> tvgLogo;
  final Value<String?> desc;
  final Value<int?> duration;
  final Value<bool> isNsfw;
  final Value<bool> isMovie;
  final Value<bool> isLiveTv;
  final Value<bool> isTvSerie;
  final Value<String?> attributes;
  final Value<String?> kodiProps;
  final Value<String?> extVlcOpts;
  final Value<String?> httpHeaders;
  final Value<DateTime?> lastUpdated;
  const TrackDriftCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.title = const Value.absent(),
    this.contentType = const Value.absent(),
    this.links = const Value.absent(),
    this.groupTitle = const Value.absent(),
    this.imdbId = const Value.absent(),
    this.tvgId = const Value.absent(),
    this.tvgName = const Value.absent(),
    this.tvgLogo = const Value.absent(),
    this.desc = const Value.absent(),
    this.duration = const Value.absent(),
    this.isNsfw = const Value.absent(),
    this.isMovie = const Value.absent(),
    this.isLiveTv = const Value.absent(),
    this.isTvSerie = const Value.absent(),
    this.attributes = const Value.absent(),
    this.kodiProps = const Value.absent(),
    this.extVlcOpts = const Value.absent(),
    this.httpHeaders = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  TrackDriftCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required String title,
    this.contentType = const Value.absent(),
    this.links = const Value.absent(),
    this.groupTitle = const Value.absent(),
    this.imdbId = const Value.absent(),
    this.tvgId = const Value.absent(),
    this.tvgName = const Value.absent(),
    this.tvgLogo = const Value.absent(),
    this.desc = const Value.absent(),
    this.duration = const Value.absent(),
    this.isNsfw = const Value.absent(),
    this.isMovie = const Value.absent(),
    this.isLiveTv = const Value.absent(),
    this.isTvSerie = const Value.absent(),
    this.attributes = const Value.absent(),
    this.kodiProps = const Value.absent(),
    this.extVlcOpts = const Value.absent(),
    this.httpHeaders = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  }) : playlistId = Value(playlistId),
       title = Value(title);
  static Insertable<TrackDriftData> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<String>? title,
    Expression<String>? contentType,
    Expression<String>? links,
    Expression<String>? groupTitle,
    Expression<String>? imdbId,
    Expression<String>? tvgId,
    Expression<String>? tvgName,
    Expression<String>? tvgLogo,
    Expression<String>? desc,
    Expression<int>? duration,
    Expression<bool>? isNsfw,
    Expression<bool>? isMovie,
    Expression<bool>? isLiveTv,
    Expression<bool>? isTvSerie,
    Expression<String>? attributes,
    Expression<String>? kodiProps,
    Expression<String>? extVlcOpts,
    Expression<String>? httpHeaders,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (title != null) 'title': title,
      if (contentType != null) 'content_type': contentType,
      if (links != null) 'links': links,
      if (groupTitle != null) 'group_title': groupTitle,
      if (imdbId != null) 'imdb_id': imdbId,
      if (tvgId != null) 'tvg_id': tvgId,
      if (tvgName != null) 'tvg_name': tvgName,
      if (tvgLogo != null) 'tvg_logo': tvgLogo,
      if (desc != null) 'desc': desc,
      if (duration != null) 'duration': duration,
      if (isNsfw != null) 'is_nsfw': isNsfw,
      if (isMovie != null) 'is_movie': isMovie,
      if (isLiveTv != null) 'is_live_tv': isLiveTv,
      if (isTvSerie != null) 'is_tv_serie': isTvSerie,
      if (attributes != null) 'attributes': attributes,
      if (kodiProps != null) 'kodi_props': kodiProps,
      if (extVlcOpts != null) 'ext_vlc_opts': extVlcOpts,
      if (httpHeaders != null) 'http_headers': httpHeaders,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  TrackDriftCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<String>? title,
    Value<String?>? contentType,
    Value<String?>? links,
    Value<String?>? groupTitle,
    Value<String?>? imdbId,
    Value<String?>? tvgId,
    Value<String?>? tvgName,
    Value<String?>? tvgLogo,
    Value<String?>? desc,
    Value<int?>? duration,
    Value<bool>? isNsfw,
    Value<bool>? isMovie,
    Value<bool>? isLiveTv,
    Value<bool>? isTvSerie,
    Value<String?>? attributes,
    Value<String?>? kodiProps,
    Value<String?>? extVlcOpts,
    Value<String?>? httpHeaders,
    Value<DateTime?>? lastUpdated,
  }) {
    return TrackDriftCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      title: title ?? this.title,
      contentType: contentType ?? this.contentType,
      links: links ?? this.links,
      groupTitle: groupTitle ?? this.groupTitle,
      imdbId: imdbId ?? this.imdbId,
      tvgId: tvgId ?? this.tvgId,
      tvgName: tvgName ?? this.tvgName,
      tvgLogo: tvgLogo ?? this.tvgLogo,
      desc: desc ?? this.desc,
      duration: duration ?? this.duration,
      isNsfw: isNsfw ?? this.isNsfw,
      isMovie: isMovie ?? this.isMovie,
      isLiveTv: isLiveTv ?? this.isLiveTv,
      isTvSerie: isTvSerie ?? this.isTvSerie,
      attributes: attributes ?? this.attributes,
      kodiProps: kodiProps ?? this.kodiProps,
      extVlcOpts: extVlcOpts ?? this.extVlcOpts,
      httpHeaders: httpHeaders ?? this.httpHeaders,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (links.present) {
      map['links'] = Variable<String>(links.value);
    }
    if (groupTitle.present) {
      map['group_title'] = Variable<String>(groupTitle.value);
    }
    if (imdbId.present) {
      map['imdb_id'] = Variable<String>(imdbId.value);
    }
    if (tvgId.present) {
      map['tvg_id'] = Variable<String>(tvgId.value);
    }
    if (tvgName.present) {
      map['tvg_name'] = Variable<String>(tvgName.value);
    }
    if (tvgLogo.present) {
      map['tvg_logo'] = Variable<String>(tvgLogo.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (isNsfw.present) {
      map['is_nsfw'] = Variable<bool>(isNsfw.value);
    }
    if (isMovie.present) {
      map['is_movie'] = Variable<bool>(isMovie.value);
    }
    if (isLiveTv.present) {
      map['is_live_tv'] = Variable<bool>(isLiveTv.value);
    }
    if (isTvSerie.present) {
      map['is_tv_serie'] = Variable<bool>(isTvSerie.value);
    }
    if (attributes.present) {
      map['attributes'] = Variable<String>(attributes.value);
    }
    if (kodiProps.present) {
      map['kodi_props'] = Variable<String>(kodiProps.value);
    }
    if (extVlcOpts.present) {
      map['ext_vlc_opts'] = Variable<String>(extVlcOpts.value);
    }
    if (httpHeaders.present) {
      map['http_headers'] = Variable<String>(httpHeaders.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackDriftCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title, ')
          ..write('contentType: $contentType, ')
          ..write('links: $links, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('imdbId: $imdbId, ')
          ..write('tvgId: $tvgId, ')
          ..write('tvgName: $tvgName, ')
          ..write('tvgLogo: $tvgLogo, ')
          ..write('desc: $desc, ')
          ..write('duration: $duration, ')
          ..write('isNsfw: $isNsfw, ')
          ..write('isMovie: $isMovie, ')
          ..write('isLiveTv: $isLiveTv, ')
          ..write('isTvSerie: $isTvSerie, ')
          ..write('attributes: $attributes, ')
          ..write('kodiProps: $kodiProps, ')
          ..write('extVlcOpts: $extVlcOpts, ')
          ..write('httpHeaders: $httpHeaders, ')
          ..write('lastUpdated: $lastUpdated')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
        DriftSqlType.int,
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
  final int id;
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
    map['id'] = Variable<int>(id);
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
      id: serializer.fromJson<int>(json['id']),
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
      'id': serializer.toJson<int>(id),
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
    int? id,
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
  final Value<int> id;
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
  }) : playlistId = Value(playlistId),
       name = Value(name),
       streamUrl = Value(streamUrl);
  static Insertable<ChannelDriftData> custom({
    Expression<int>? id,
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
    });
  }

  ChannelDriftCompanion copyWith({
    Value<int>? id,
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
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
          ..write('extvlcopt: $extvlcopt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlaylistDriftTable playlistDrift = $PlaylistDriftTable(this);
  late final $PlaylistUrlHistoryDriftTable playlistUrlHistoryDrift =
      $PlaylistUrlHistoryDriftTable(this);
  late final $TrackDriftTable trackDrift = $TrackDriftTable(this);
  late final $ChannelDriftTable channelDrift = $ChannelDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    playlistDrift,
    playlistUrlHistoryDrift,
    trackDrift,
    channelDrift,
  ];
}

typedef $$PlaylistDriftTableCreateCompanionBuilder =
    PlaylistDriftCompanion Function({
      Value<int> id,
      required String name,
      required String ulid,
      Value<String?> type,
      Value<String?> contentType,
      Value<String?> filePath,
      Value<String?> epgLink,
      Value<String?> url,
      Value<String?> template,
      Value<bool> isActive,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
    });
typedef $$PlaylistDriftTableUpdateCompanionBuilder =
    PlaylistDriftCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> ulid,
      Value<String?> type,
      Value<String?> contentType,
      Value<String?> filePath,
      Value<String?> epgLink,
      Value<String?> url,
      Value<String?> template,
      Value<bool> isActive,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
    });

final class $$PlaylistDriftTableReferences
    extends
        BaseReferences<_$AppDatabase, $PlaylistDriftTable, PlaylistDriftData> {
  $$PlaylistDriftTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TrackDriftTable, List<TrackDriftData>>
  _trackDriftRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.trackDrift,
    aliasName: $_aliasNameGenerator(
      db.playlistDrift.id,
      db.trackDrift.playlistId,
    ),
  );

  $$TrackDriftTableProcessedTableManager get trackDriftRefs {
    final manager = $$TrackDriftTableTableManager(
      $_db,
      $_db.trackDrift,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_trackDriftRefsTable($_db));
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ulid => $composableBuilder(
    column: $table.ulid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
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

  ColumnFilters<String> get template => $composableBuilder(
    column: $table.template,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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

  Expression<bool> trackDriftRefs(
    Expression<bool> Function($$TrackDriftTableFilterComposer f) f,
  ) {
    final $$TrackDriftTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackDrift,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackDriftTableFilterComposer(
            $db: $db,
            $table: $db.trackDrift,
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ulid => $composableBuilder(
    column: $table.ulid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
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

  ColumnOrderings<String> get template => $composableBuilder(
    column: $table.template,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get ulid =>
      $composableBuilder(column: $table.ulid, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get epgLink =>
      $composableBuilder(column: $table.epgLink, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get template =>
      $composableBuilder(column: $table.template, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> trackDriftRefs<T extends Object>(
    Expression<T> Function($$TrackDriftTableAnnotationComposer a) f,
  ) {
    final $$TrackDriftTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trackDrift,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrackDriftTableAnnotationComposer(
            $db: $db,
            $table: $db.trackDrift,
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
          PrefetchHooks Function({bool trackDriftRefs})
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> ulid = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> epgLink = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> template = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlaylistDriftCompanion(
                id: id,
                name: name,
                ulid: ulid,
                type: type,
                contentType: contentType,
                filePath: filePath,
                epgLink: epgLink,
                url: url,
                template: template,
                isActive: isActive,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String ulid,
                Value<String?> type = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> epgLink = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> template = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlaylistDriftCompanion.insert(
                id: id,
                name: name,
                ulid: ulid,
                type: type,
                contentType: contentType,
                filePath: filePath,
                epgLink: epgLink,
                url: url,
                template: template,
                isActive: isActive,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistDriftTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trackDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (trackDriftRefs) db.trackDrift],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (trackDriftRefs)
                    await $_getPrefetchedData<
                      PlaylistDriftData,
                      $PlaylistDriftTable,
                      TrackDriftData
                    >(
                      currentTable: table,
                      referencedTable: $$PlaylistDriftTableReferences
                          ._trackDriftRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PlaylistDriftTableReferences(
                            db,
                            table,
                            p0,
                          ).trackDriftRefs,
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
      PrefetchHooks Function({bool trackDriftRefs})
    >;
typedef $$PlaylistUrlHistoryDriftTableCreateCompanionBuilder =
    PlaylistUrlHistoryDriftCompanion Function({
      Value<int> id,
      Value<String?> url,
      Value<DateTime> createdAt,
    });
typedef $$PlaylistUrlHistoryDriftTableUpdateCompanionBuilder =
    PlaylistUrlHistoryDriftCompanion Function({
      Value<int> id,
      Value<String?> url,
      Value<DateTime> createdAt,
    });

class $$PlaylistUrlHistoryDriftTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistUrlHistoryDriftTable> {
  $$PlaylistUrlHistoryDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlaylistUrlHistoryDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistUrlHistoryDriftTable> {
  $$PlaylistUrlHistoryDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistUrlHistoryDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistUrlHistoryDriftTable> {
  $$PlaylistUrlHistoryDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlaylistUrlHistoryDriftTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistUrlHistoryDriftTable,
          PlaylistUrlHistoryDriftData,
          $$PlaylistUrlHistoryDriftTableFilterComposer,
          $$PlaylistUrlHistoryDriftTableOrderingComposer,
          $$PlaylistUrlHistoryDriftTableAnnotationComposer,
          $$PlaylistUrlHistoryDriftTableCreateCompanionBuilder,
          $$PlaylistUrlHistoryDriftTableUpdateCompanionBuilder,
          (
            PlaylistUrlHistoryDriftData,
            BaseReferences<
              _$AppDatabase,
              $PlaylistUrlHistoryDriftTable,
              PlaylistUrlHistoryDriftData
            >,
          ),
          PlaylistUrlHistoryDriftData,
          PrefetchHooks Function()
        > {
  $$PlaylistUrlHistoryDriftTableTableManager(
    _$AppDatabase db,
    $PlaylistUrlHistoryDriftTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistUrlHistoryDriftTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PlaylistUrlHistoryDriftTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PlaylistUrlHistoryDriftTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlaylistUrlHistoryDriftCompanion(
                id: id,
                url: url,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlaylistUrlHistoryDriftCompanion.insert(
                id: id,
                url: url,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlaylistUrlHistoryDriftTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistUrlHistoryDriftTable,
      PlaylistUrlHistoryDriftData,
      $$PlaylistUrlHistoryDriftTableFilterComposer,
      $$PlaylistUrlHistoryDriftTableOrderingComposer,
      $$PlaylistUrlHistoryDriftTableAnnotationComposer,
      $$PlaylistUrlHistoryDriftTableCreateCompanionBuilder,
      $$PlaylistUrlHistoryDriftTableUpdateCompanionBuilder,
      (
        PlaylistUrlHistoryDriftData,
        BaseReferences<
          _$AppDatabase,
          $PlaylistUrlHistoryDriftTable,
          PlaylistUrlHistoryDriftData
        >,
      ),
      PlaylistUrlHistoryDriftData,
      PrefetchHooks Function()
    >;
typedef $$TrackDriftTableCreateCompanionBuilder =
    TrackDriftCompanion Function({
      Value<int> id,
      required int playlistId,
      required String title,
      Value<String?> contentType,
      Value<String?> links,
      Value<String?> groupTitle,
      Value<String?> imdbId,
      Value<String?> tvgId,
      Value<String?> tvgName,
      Value<String?> tvgLogo,
      Value<String?> desc,
      Value<int?> duration,
      Value<bool> isNsfw,
      Value<bool> isMovie,
      Value<bool> isLiveTv,
      Value<bool> isTvSerie,
      Value<String?> attributes,
      Value<String?> kodiProps,
      Value<String?> extVlcOpts,
      Value<String?> httpHeaders,
      Value<DateTime?> lastUpdated,
    });
typedef $$TrackDriftTableUpdateCompanionBuilder =
    TrackDriftCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<String> title,
      Value<String?> contentType,
      Value<String?> links,
      Value<String?> groupTitle,
      Value<String?> imdbId,
      Value<String?> tvgId,
      Value<String?> tvgName,
      Value<String?> tvgLogo,
      Value<String?> desc,
      Value<int?> duration,
      Value<bool> isNsfw,
      Value<bool> isMovie,
      Value<bool> isLiveTv,
      Value<bool> isTvSerie,
      Value<String?> attributes,
      Value<String?> kodiProps,
      Value<String?> extVlcOpts,
      Value<String?> httpHeaders,
      Value<DateTime?> lastUpdated,
    });

final class $$TrackDriftTableReferences
    extends BaseReferences<_$AppDatabase, $TrackDriftTable, TrackDriftData> {
  $$TrackDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistDriftTable _playlistIdTable(_$AppDatabase db) =>
      db.playlistDrift.createAlias(
        $_aliasNameGenerator(db.trackDrift.playlistId, db.playlistDrift.id),
      );

  $$PlaylistDriftTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

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

class $$TrackDriftTableFilterComposer
    extends Composer<_$AppDatabase, $TrackDriftTable> {
  $$TrackDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get links => $composableBuilder(
    column: $table.links,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupTitle => $composableBuilder(
    column: $table.groupTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imdbId => $composableBuilder(
    column: $table.imdbId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tvgId => $composableBuilder(
    column: $table.tvgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tvgName => $composableBuilder(
    column: $table.tvgName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tvgLogo => $composableBuilder(
    column: $table.tvgLogo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNsfw => $composableBuilder(
    column: $table.isNsfw,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMovie => $composableBuilder(
    column: $table.isMovie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLiveTv => $composableBuilder(
    column: $table.isLiveTv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTvSerie => $composableBuilder(
    column: $table.isTvSerie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kodiProps => $composableBuilder(
    column: $table.kodiProps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extVlcOpts => $composableBuilder(
    column: $table.extVlcOpts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get httpHeaders => $composableBuilder(
    column: $table.httpHeaders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
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

class $$TrackDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $TrackDriftTable> {
  $$TrackDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get links => $composableBuilder(
    column: $table.links,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupTitle => $composableBuilder(
    column: $table.groupTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imdbId => $composableBuilder(
    column: $table.imdbId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tvgId => $composableBuilder(
    column: $table.tvgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tvgName => $composableBuilder(
    column: $table.tvgName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tvgLogo => $composableBuilder(
    column: $table.tvgLogo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNsfw => $composableBuilder(
    column: $table.isNsfw,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMovie => $composableBuilder(
    column: $table.isMovie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLiveTv => $composableBuilder(
    column: $table.isLiveTv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTvSerie => $composableBuilder(
    column: $table.isTvSerie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kodiProps => $composableBuilder(
    column: $table.kodiProps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extVlcOpts => $composableBuilder(
    column: $table.extVlcOpts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get httpHeaders => $composableBuilder(
    column: $table.httpHeaders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
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

class $$TrackDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrackDriftTable> {
  $$TrackDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get links =>
      $composableBuilder(column: $table.links, builder: (column) => column);

  GeneratedColumn<String> get groupTitle => $composableBuilder(
    column: $table.groupTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imdbId =>
      $composableBuilder(column: $table.imdbId, builder: (column) => column);

  GeneratedColumn<String> get tvgId =>
      $composableBuilder(column: $table.tvgId, builder: (column) => column);

  GeneratedColumn<String> get tvgName =>
      $composableBuilder(column: $table.tvgName, builder: (column) => column);

  GeneratedColumn<String> get tvgLogo =>
      $composableBuilder(column: $table.tvgLogo, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<bool> get isNsfw =>
      $composableBuilder(column: $table.isNsfw, builder: (column) => column);

  GeneratedColumn<bool> get isMovie =>
      $composableBuilder(column: $table.isMovie, builder: (column) => column);

  GeneratedColumn<bool> get isLiveTv =>
      $composableBuilder(column: $table.isLiveTv, builder: (column) => column);

  GeneratedColumn<bool> get isTvSerie =>
      $composableBuilder(column: $table.isTvSerie, builder: (column) => column);

  GeneratedColumn<String> get attributes => $composableBuilder(
    column: $table.attributes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kodiProps =>
      $composableBuilder(column: $table.kodiProps, builder: (column) => column);

  GeneratedColumn<String> get extVlcOpts => $composableBuilder(
    column: $table.extVlcOpts,
    builder: (column) => column,
  );

  GeneratedColumn<String> get httpHeaders => $composableBuilder(
    column: $table.httpHeaders,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

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

class $$TrackDriftTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrackDriftTable,
          TrackDriftData,
          $$TrackDriftTableFilterComposer,
          $$TrackDriftTableOrderingComposer,
          $$TrackDriftTableAnnotationComposer,
          $$TrackDriftTableCreateCompanionBuilder,
          $$TrackDriftTableUpdateCompanionBuilder,
          (TrackDriftData, $$TrackDriftTableReferences),
          TrackDriftData,
          PrefetchHooks Function({bool playlistId})
        > {
  $$TrackDriftTableTableManager(_$AppDatabase db, $TrackDriftTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrackDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrackDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> links = const Value.absent(),
                Value<String?> groupTitle = const Value.absent(),
                Value<String?> imdbId = const Value.absent(),
                Value<String?> tvgId = const Value.absent(),
                Value<String?> tvgName = const Value.absent(),
                Value<String?> tvgLogo = const Value.absent(),
                Value<String?> desc = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<bool> isNsfw = const Value.absent(),
                Value<bool> isMovie = const Value.absent(),
                Value<bool> isLiveTv = const Value.absent(),
                Value<bool> isTvSerie = const Value.absent(),
                Value<String?> attributes = const Value.absent(),
                Value<String?> kodiProps = const Value.absent(),
                Value<String?> extVlcOpts = const Value.absent(),
                Value<String?> httpHeaders = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
              }) => TrackDriftCompanion(
                id: id,
                playlistId: playlistId,
                title: title,
                contentType: contentType,
                links: links,
                groupTitle: groupTitle,
                imdbId: imdbId,
                tvgId: tvgId,
                tvgName: tvgName,
                tvgLogo: tvgLogo,
                desc: desc,
                duration: duration,
                isNsfw: isNsfw,
                isMovie: isMovie,
                isLiveTv: isLiveTv,
                isTvSerie: isTvSerie,
                attributes: attributes,
                kodiProps: kodiProps,
                extVlcOpts: extVlcOpts,
                httpHeaders: httpHeaders,
                lastUpdated: lastUpdated,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required String title,
                Value<String?> contentType = const Value.absent(),
                Value<String?> links = const Value.absent(),
                Value<String?> groupTitle = const Value.absent(),
                Value<String?> imdbId = const Value.absent(),
                Value<String?> tvgId = const Value.absent(),
                Value<String?> tvgName = const Value.absent(),
                Value<String?> tvgLogo = const Value.absent(),
                Value<String?> desc = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<bool> isNsfw = const Value.absent(),
                Value<bool> isMovie = const Value.absent(),
                Value<bool> isLiveTv = const Value.absent(),
                Value<bool> isTvSerie = const Value.absent(),
                Value<String?> attributes = const Value.absent(),
                Value<String?> kodiProps = const Value.absent(),
                Value<String?> extVlcOpts = const Value.absent(),
                Value<String?> httpHeaders = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
              }) => TrackDriftCompanion.insert(
                id: id,
                playlistId: playlistId,
                title: title,
                contentType: contentType,
                links: links,
                groupTitle: groupTitle,
                imdbId: imdbId,
                tvgId: tvgId,
                tvgName: tvgName,
                tvgLogo: tvgLogo,
                desc: desc,
                duration: duration,
                isNsfw: isNsfw,
                isMovie: isMovie,
                isLiveTv: isLiveTv,
                isTvSerie: isTvSerie,
                attributes: attributes,
                kodiProps: kodiProps,
                extVlcOpts: extVlcOpts,
                httpHeaders: httpHeaders,
                lastUpdated: lastUpdated,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TrackDriftTableReferences(db, table, e),
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
                                referencedTable: $$TrackDriftTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$TrackDriftTableReferences
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

typedef $$TrackDriftTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrackDriftTable,
      TrackDriftData,
      $$TrackDriftTableFilterComposer,
      $$TrackDriftTableOrderingComposer,
      $$TrackDriftTableAnnotationComposer,
      $$TrackDriftTableCreateCompanionBuilder,
      $$TrackDriftTableUpdateCompanionBuilder,
      (TrackDriftData, $$TrackDriftTableReferences),
      TrackDriftData,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$ChannelDriftTableCreateCompanionBuilder =
    ChannelDriftCompanion Function({
      Value<int> id,
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
    });
typedef $$ChannelDriftTableUpdateCompanionBuilder =
    ChannelDriftCompanion Function({
      Value<int> id,
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
    });

class $$ChannelDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ChannelDriftTable> {
  $$ChannelDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
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
  ColumnOrderings<int> get id => $composableBuilder(
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
  GeneratedColumn<int> get id =>
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
          (
            ChannelDriftData,
            BaseReferences<_$AppDatabase, $ChannelDriftTable, ChannelDriftData>,
          ),
          ChannelDriftData,
          PrefetchHooks Function()
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
                Value<int> id = const Value.absent(),
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
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
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
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        ChannelDriftData,
        BaseReferences<_$AppDatabase, $ChannelDriftTable, ChannelDriftData>,
      ),
      ChannelDriftData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlaylistDriftTableTableManager get playlistDrift =>
      $$PlaylistDriftTableTableManager(_db, _db.playlistDrift);
  $$PlaylistUrlHistoryDriftTableTableManager get playlistUrlHistoryDrift =>
      $$PlaylistUrlHistoryDriftTableTableManager(
        _db,
        _db.playlistUrlHistoryDrift,
      );
  $$TrackDriftTableTableManager get trackDrift =>
      $$TrackDriftTableTableManager(_db, _db.trackDrift);
  $$ChannelDriftTableTableManager get channelDrift =>
      $$ChannelDriftTableTableManager(_db, _db.channelDrift);
}
