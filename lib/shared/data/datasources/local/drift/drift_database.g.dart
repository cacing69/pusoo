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


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $SourceDriftTable extends SourceDrift
    with TableInfo<$SourceDriftTable, SourceDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceDriftTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _isPersonalMeta = const VerificationMeta(
    'isPersonal',
  );
  @override
  late final GeneratedColumn<bool> isPersonal = GeneratedColumn<bool>(
    'is_personal',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_personal" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _isPublicMeta = const VerificationMeta(
    'isPublic',
  );
  @override
  late final GeneratedColumn<bool> isPublic = GeneratedColumn<bool>(
    'is_public',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_public" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _homepageMeta = const VerificationMeta(
    'homepage',
  );
  @override
  late final GeneratedColumn<String> homepage = GeneratedColumn<String>(
    'homepage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<String> owner = GeneratedColumn<String>(
    'owner',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repositoryMeta = const VerificationMeta(
    'repository',
  );
  @override
  late final GeneratedColumn<String> repository = GeneratedColumn<String>(
    'repository',
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
    isPersonal,
    isPublic,
    homepage,
    owner,
    description,
    repository,
    lastUpdated,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_drift';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceDriftData> instance, {
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
    if (data.containsKey('is_personal')) {
      context.handle(
        _isPersonalMeta,
        isPersonal.isAcceptableOrUnknown(data['is_personal']!, _isPersonalMeta),
      );
    }
    if (data.containsKey('is_public')) {
      context.handle(
        _isPublicMeta,
        isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta),
      );
    }
    if (data.containsKey('homepage')) {
      context.handle(
        _homepageMeta,
        homepage.isAcceptableOrUnknown(data['homepage']!, _homepageMeta),
      );
    }
    if (data.containsKey('owner')) {
      context.handle(
        _ownerMeta,
        owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('repository')) {
      context.handle(
        _repositoryMeta,
        repository.isAcceptableOrUnknown(data['repository']!, _repositoryMeta),
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
  SourceDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceDriftData(
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
      isPersonal: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_personal'],
      )!,
      isPublic: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_public'],
      )!,
      homepage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}homepage'],
      ),
      owner: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      repository: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repository'],
      ),
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
  $SourceDriftTable createAlias(String alias) {
    return $SourceDriftTable(attachedDatabase, alias);
  }
}

class SourceDriftData extends DataClass implements Insertable<SourceDriftData> {
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
  final bool isPersonal;
  final bool isPublic;
  final String? homepage;
  final String? owner;
  final String? description;
  final String? repository;
  final DateTime? lastUpdated;
  final DateTime createdAt;
  const SourceDriftData({
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
    required this.isPersonal,
    required this.isPublic,
    this.homepage,
    this.owner,
    this.description,
    this.repository,
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
    map['is_personal'] = Variable<bool>(isPersonal);
    map['is_public'] = Variable<bool>(isPublic);
    if (!nullToAbsent || homepage != null) {
      map['homepage'] = Variable<String>(homepage);
    }
    if (!nullToAbsent || owner != null) {
      map['owner'] = Variable<String>(owner);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || repository != null) {
      map['repository'] = Variable<String>(repository);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SourceDriftCompanion toCompanion(bool nullToAbsent) {
    return SourceDriftCompanion(
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
      isPersonal: Value(isPersonal),
      isPublic: Value(isPublic),
      homepage: homepage == null && nullToAbsent
          ? const Value.absent()
          : Value(homepage),
      owner: owner == null && nullToAbsent
          ? const Value.absent()
          : Value(owner),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      repository: repository == null && nullToAbsent
          ? const Value.absent()
          : Value(repository),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      createdAt: Value(createdAt),
    );
  }

  factory SourceDriftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceDriftData(
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
      isPersonal: serializer.fromJson<bool>(json['isPersonal']),
      isPublic: serializer.fromJson<bool>(json['isPublic']),
      homepage: serializer.fromJson<String?>(json['homepage']),
      owner: serializer.fromJson<String?>(json['owner']),
      description: serializer.fromJson<String?>(json['description']),
      repository: serializer.fromJson<String?>(json['repository']),
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
      'isPersonal': serializer.toJson<bool>(isPersonal),
      'isPublic': serializer.toJson<bool>(isPublic),
      'homepage': serializer.toJson<String?>(homepage),
      'owner': serializer.toJson<String?>(owner),
      'description': serializer.toJson<String?>(description),
      'repository': serializer.toJson<String?>(repository),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SourceDriftData copyWith({
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
    bool? isPersonal,
    bool? isPublic,
    Value<String?> homepage = const Value.absent(),
    Value<String?> owner = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> repository = const Value.absent(),
    Value<DateTime?> lastUpdated = const Value.absent(),
    DateTime? createdAt,
  }) => SourceDriftData(
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
    isPersonal: isPersonal ?? this.isPersonal,
    isPublic: isPublic ?? this.isPublic,
    homepage: homepage.present ? homepage.value : this.homepage,
    owner: owner.present ? owner.value : this.owner,
    description: description.present ? description.value : this.description,
    repository: repository.present ? repository.value : this.repository,
    lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
    createdAt: createdAt ?? this.createdAt,
  );
  SourceDriftData copyWithCompanion(SourceDriftCompanion data) {
    return SourceDriftData(
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
      isPersonal: data.isPersonal.present
          ? data.isPersonal.value
          : this.isPersonal,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      homepage: data.homepage.present ? data.homepage.value : this.homepage,
      owner: data.owner.present ? data.owner.value : this.owner,
      description: data.description.present
          ? data.description.value
          : this.description,
      repository: data.repository.present
          ? data.repository.value
          : this.repository,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceDriftData(')
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
          ..write('isPersonal: $isPersonal, ')
          ..write('isPublic: $isPublic, ')
          ..write('homepage: $homepage, ')
          ..write('owner: $owner, ')
          ..write('description: $description, ')
          ..write('repository: $repository, ')
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
    isPersonal,
    isPublic,
    homepage,
    owner,
    description,
    repository,
    lastUpdated,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceDriftData &&
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
          other.isPersonal == this.isPersonal &&
          other.isPublic == this.isPublic &&
          other.homepage == this.homepage &&
          other.owner == this.owner &&
          other.description == this.description &&
          other.repository == this.repository &&
          other.lastUpdated == this.lastUpdated &&
          other.createdAt == this.createdAt);
}

class SourceDriftCompanion extends UpdateCompanion<SourceDriftData> {
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
  final Value<bool> isPersonal;
  final Value<bool> isPublic;
  final Value<String?> homepage;
  final Value<String?> owner;
  final Value<String?> description;
  final Value<String?> repository;
  final Value<DateTime?> lastUpdated;
  final Value<DateTime> createdAt;
  const SourceDriftCompanion({
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
    this.isPersonal = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.homepage = const Value.absent(),
    this.owner = const Value.absent(),
    this.description = const Value.absent(),
    this.repository = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SourceDriftCompanion.insert({
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
    this.isPersonal = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.homepage = const Value.absent(),
    this.owner = const Value.absent(),
    this.description = const Value.absent(),
    this.repository = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       ulid = Value(ulid);
  static Insertable<SourceDriftData> custom({
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
    Expression<bool>? isPersonal,
    Expression<bool>? isPublic,
    Expression<String>? homepage,
    Expression<String>? owner,
    Expression<String>? description,
    Expression<String>? repository,
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
      if (isPersonal != null) 'is_personal': isPersonal,
      if (isPublic != null) 'is_public': isPublic,
      if (homepage != null) 'homepage': homepage,
      if (owner != null) 'owner': owner,
      if (description != null) 'description': description,
      if (repository != null) 'repository': repository,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SourceDriftCompanion copyWith({
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
    Value<bool>? isPersonal,
    Value<bool>? isPublic,
    Value<String?>? homepage,
    Value<String?>? owner,
    Value<String?>? description,
    Value<String?>? repository,
    Value<DateTime?>? lastUpdated,
    Value<DateTime>? createdAt,
  }) {
    return SourceDriftCompanion(
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
      isPersonal: isPersonal ?? this.isPersonal,
      isPublic: isPublic ?? this.isPublic,
      homepage: homepage ?? this.homepage,
      owner: owner ?? this.owner,
      description: description ?? this.description,
      repository: repository ?? this.repository,
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
    if (isPersonal.present) {
      map['is_personal'] = Variable<bool>(isPersonal.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<bool>(isPublic.value);
    }
    if (homepage.present) {
      map['homepage'] = Variable<String>(homepage.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (repository.present) {
      map['repository'] = Variable<String>(repository.value);
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
    return (StringBuffer('SourceDriftCompanion(')
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
          ..write('isPersonal: $isPersonal, ')
          ..write('isPublic: $isPublic, ')
          ..write('homepage: $homepage, ')
          ..write('owner: $owner, ')
          ..write('description: $description, ')
          ..write('repository: $repository, ')
          ..write('lastUpdated: $lastUpdated, ')
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
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source_drift (id)',
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
    sourceId,
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
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
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
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
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
  final int sourceId;
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
    required this.sourceId,
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
    map['source_id'] = Variable<int>(sourceId);
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
      sourceId: Value(sourceId),
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
      sourceId: serializer.fromJson<int>(json['sourceId']),
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
      'sourceId': serializer.toJson<int>(sourceId),
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
    int? sourceId,
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
    sourceId: sourceId ?? this.sourceId,
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
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
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
          ..write('sourceId: $sourceId, ')
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
    sourceId,
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
          other.sourceId == this.sourceId &&
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
  final Value<int> sourceId;
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
    this.sourceId = const Value.absent(),
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
    required int sourceId,
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
  }) : sourceId = Value(sourceId),
       title = Value(title);
  static Insertable<TrackDriftData> custom({
    Expression<int>? id,
    Expression<int>? sourceId,
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
      if (sourceId != null) 'source_id': sourceId,
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
    Value<int>? sourceId,
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
      sourceId: sourceId ?? this.sourceId,
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
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
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
          ..write('sourceId: $sourceId, ')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SourceDriftTable sourceDrift = $SourceDriftTable(this);
  late final $TrackDriftTable trackDrift = $TrackDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sourceDrift, trackDrift];
}

typedef $$SourceDriftTableCreateCompanionBuilder =
    SourceDriftCompanion Function({
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
      Value<bool> isPersonal,
      Value<bool> isPublic,
      Value<String?> homepage,
      Value<String?> owner,
      Value<String?> description,
      Value<String?> repository,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
    });
typedef $$SourceDriftTableUpdateCompanionBuilder =
    SourceDriftCompanion Function({
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
      Value<bool> isPersonal,
      Value<bool> isPublic,
      Value<String?> homepage,
      Value<String?> owner,
      Value<String?> description,
      Value<String?> repository,
      Value<DateTime?> lastUpdated,
      Value<DateTime> createdAt,
    });

final class $$SourceDriftTableReferences
    extends BaseReferences<_$AppDatabase, $SourceDriftTable, SourceDriftData> {
  $$SourceDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TrackDriftTable, List<TrackDriftData>>
  _trackDriftRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.trackDrift,
    aliasName: $_aliasNameGenerator(db.sourceDrift.id, db.trackDrift.sourceId),
  );

  $$TrackDriftTableProcessedTableManager get trackDriftRefs {
    final manager = $$TrackDriftTableTableManager(
      $_db,
      $_db.trackDrift,
    ).filter((f) => f.sourceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_trackDriftRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourceDriftTableFilterComposer
    extends Composer<_$AppDatabase, $SourceDriftTable> {
  $$SourceDriftTableFilterComposer({
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

  ColumnFilters<bool> get isPersonal => $composableBuilder(
    column: $table.isPersonal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homepage => $composableBuilder(
    column: $table.homepage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get owner => $composableBuilder(
    column: $table.owner,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repository => $composableBuilder(
    column: $table.repository,
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
      getReferencedColumn: (t) => t.sourceId,
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

class $$SourceDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceDriftTable> {
  $$SourceDriftTableOrderingComposer({
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

  ColumnOrderings<bool> get isPersonal => $composableBuilder(
    column: $table.isPersonal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homepage => $composableBuilder(
    column: $table.homepage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get owner => $composableBuilder(
    column: $table.owner,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repository => $composableBuilder(
    column: $table.repository,
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

class $$SourceDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceDriftTable> {
  $$SourceDriftTableAnnotationComposer({
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

  GeneratedColumn<bool> get isPersonal => $composableBuilder(
    column: $table.isPersonal,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPublic =>
      $composableBuilder(column: $table.isPublic, builder: (column) => column);

  GeneratedColumn<String> get homepage =>
      $composableBuilder(column: $table.homepage, builder: (column) => column);

  GeneratedColumn<String> get owner =>
      $composableBuilder(column: $table.owner, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get repository => $composableBuilder(
    column: $table.repository,
    builder: (column) => column,
  );

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
      getReferencedColumn: (t) => t.sourceId,
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

class $$SourceDriftTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceDriftTable,
          SourceDriftData,
          $$SourceDriftTableFilterComposer,
          $$SourceDriftTableOrderingComposer,
          $$SourceDriftTableAnnotationComposer,
          $$SourceDriftTableCreateCompanionBuilder,
          $$SourceDriftTableUpdateCompanionBuilder,
          (SourceDriftData, $$SourceDriftTableReferences),
          SourceDriftData,
          PrefetchHooks Function({bool trackDriftRefs})
        > {
  $$SourceDriftTableTableManager(_$AppDatabase db, $SourceDriftTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourceDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourceDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourceDriftTableAnnotationComposer($db: db, $table: table),
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
                Value<bool> isPersonal = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<String?> owner = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> repository = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SourceDriftCompanion(
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
                isPersonal: isPersonal,
                isPublic: isPublic,
                homepage: homepage,
                owner: owner,
                description: description,
                repository: repository,
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
                Value<bool> isPersonal = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<String?> homepage = const Value.absent(),
                Value<String?> owner = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> repository = const Value.absent(),
                Value<DateTime?> lastUpdated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SourceDriftCompanion.insert(
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
                isPersonal: isPersonal,
                isPublic: isPublic,
                homepage: homepage,
                owner: owner,
                description: description,
                repository: repository,
                lastUpdated: lastUpdated,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SourceDriftTableReferences(db, table, e),
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
                      SourceDriftData,
                      $SourceDriftTable,
                      TrackDriftData
                    >(
                      currentTable: table,
                      referencedTable: $$SourceDriftTableReferences
                          ._trackDriftRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SourceDriftTableReferences(
                            db,
                            table,
                            p0,
                          ).trackDriftRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sourceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SourceDriftTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceDriftTable,
      SourceDriftData,
      $$SourceDriftTableFilterComposer,
      $$SourceDriftTableOrderingComposer,
      $$SourceDriftTableAnnotationComposer,
      $$SourceDriftTableCreateCompanionBuilder,
      $$SourceDriftTableUpdateCompanionBuilder,
      (SourceDriftData, $$SourceDriftTableReferences),
      SourceDriftData,
      PrefetchHooks Function({bool trackDriftRefs})
    >;
typedef $$TrackDriftTableCreateCompanionBuilder =
    TrackDriftCompanion Function({
      Value<int> id,
      required int sourceId,
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
      Value<int> sourceId,
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

  static $SourceDriftTable _sourceIdTable(_$AppDatabase db) =>
      db.sourceDrift.createAlias(
        $_aliasNameGenerator(db.trackDrift.sourceId, db.sourceDrift.id),
      );

  $$SourceDriftTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<int>('source_id')!;

    final manager = $$SourceDriftTableTableManager(
      $_db,
      $_db.sourceDrift,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
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

  $$SourceDriftTableFilterComposer get sourceId {
    final $$SourceDriftTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sourceDrift,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceDriftTableFilterComposer(
            $db: $db,
            $table: $db.sourceDrift,
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

  $$SourceDriftTableOrderingComposer get sourceId {
    final $$SourceDriftTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sourceDrift,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceDriftTableOrderingComposer(
            $db: $db,
            $table: $db.sourceDrift,
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

  $$SourceDriftTableAnnotationComposer get sourceId {
    final $$SourceDriftTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sourceDrift,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceDriftTableAnnotationComposer(
            $db: $db,
            $table: $db.sourceDrift,
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
          PrefetchHooks Function({bool sourceId})
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
                Value<int> sourceId = const Value.absent(),
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
                sourceId: sourceId,
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
                required int sourceId,
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
                sourceId: sourceId,
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
          prefetchHooksCallback: ({sourceId = false}) {
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
                    if (sourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sourceId,
                                referencedTable: $$TrackDriftTableReferences
                                    ._sourceIdTable(db),
                                referencedColumn: $$TrackDriftTableReferences
                                    ._sourceIdTable(db)
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
      PrefetchHooks Function({bool sourceId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SourceDriftTableTableManager get sourceDrift =>
      $$SourceDriftTableTableManager(_db, _db.sourceDrift);
  $$TrackDriftTableTableManager get trackDrift =>
      $$TrackDriftTableTableManager(_db, _db.trackDrift);
}
