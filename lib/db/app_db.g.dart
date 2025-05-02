// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $AbsensiTable extends Absensi with TableInfo<$AbsensiTable, AbsensiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbsensiTable(this.attachedDatabase, [this._alias]);
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateAbsenMeta = const VerificationMeta(
    'dateAbsen',
  );
  @override
  late final GeneratedColumn<DateTime> dateAbsen = GeneratedColumn<DateTime>(
    'date_absen',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagGpsMeta = const VerificationMeta('tagGps');
  @override
  late final GeneratedColumn<String> tagGps = GeneratedColumn<String>(
    'tag_gps',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, dateAbsen, status, tagGps];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'absensi';
  @override
  VerificationContext validateIntegrity(
    Insertable<AbsensiData> instance, {
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
    if (data.containsKey('date_absen')) {
      context.handle(
        _dateAbsenMeta,
        dateAbsen.isAcceptableOrUnknown(data['date_absen']!, _dateAbsenMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('tag_gps')) {
      context.handle(
        _tagGpsMeta,
        tagGps.isAcceptableOrUnknown(data['tag_gps']!, _tagGpsMeta),
      );
    } else if (isInserting) {
      context.missing(_tagGpsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AbsensiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AbsensiData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      dateAbsen: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_absen'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      tagGps:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tag_gps'],
          )!,
    );
  }

  @override
  $AbsensiTable createAlias(String alias) {
    return $AbsensiTable(attachedDatabase, alias);
  }
}

class AbsensiData extends DataClass implements Insertable<AbsensiData> {
  final int id;
  final String name;
  final DateTime? dateAbsen;
  final String status;
  final String tagGps;
  const AbsensiData({
    required this.id,
    required this.name,
    this.dateAbsen,
    required this.status,
    required this.tagGps,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dateAbsen != null) {
      map['date_absen'] = Variable<DateTime>(dateAbsen);
    }
    map['status'] = Variable<String>(status);
    map['tag_gps'] = Variable<String>(tagGps);
    return map;
  }

  AbsensiCompanion toCompanion(bool nullToAbsent) {
    return AbsensiCompanion(
      id: Value(id),
      name: Value(name),
      dateAbsen:
          dateAbsen == null && nullToAbsent
              ? const Value.absent()
              : Value(dateAbsen),
      status: Value(status),
      tagGps: Value(tagGps),
    );
  }

  factory AbsensiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AbsensiData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dateAbsen: serializer.fromJson<DateTime?>(json['dateAbsen']),
      status: serializer.fromJson<String>(json['status']),
      tagGps: serializer.fromJson<String>(json['tagGps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dateAbsen': serializer.toJson<DateTime?>(dateAbsen),
      'status': serializer.toJson<String>(status),
      'tagGps': serializer.toJson<String>(tagGps),
    };
  }

  AbsensiData copyWith({
    int? id,
    String? name,
    Value<DateTime?> dateAbsen = const Value.absent(),
    String? status,
    String? tagGps,
  }) => AbsensiData(
    id: id ?? this.id,
    name: name ?? this.name,
    dateAbsen: dateAbsen.present ? dateAbsen.value : this.dateAbsen,
    status: status ?? this.status,
    tagGps: tagGps ?? this.tagGps,
  );
  AbsensiData copyWithCompanion(AbsensiCompanion data) {
    return AbsensiData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dateAbsen: data.dateAbsen.present ? data.dateAbsen.value : this.dateAbsen,
      status: data.status.present ? data.status.value : this.status,
      tagGps: data.tagGps.present ? data.tagGps.value : this.tagGps,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AbsensiData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateAbsen: $dateAbsen, ')
          ..write('status: $status, ')
          ..write('tagGps: $tagGps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, dateAbsen, status, tagGps);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AbsensiData &&
          other.id == this.id &&
          other.name == this.name &&
          other.dateAbsen == this.dateAbsen &&
          other.status == this.status &&
          other.tagGps == this.tagGps);
}

class AbsensiCompanion extends UpdateCompanion<AbsensiData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> dateAbsen;
  final Value<String> status;
  final Value<String> tagGps;
  const AbsensiCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dateAbsen = const Value.absent(),
    this.status = const Value.absent(),
    this.tagGps = const Value.absent(),
  });
  AbsensiCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.dateAbsen = const Value.absent(),
    required String status,
    required String tagGps,
  }) : name = Value(name),
       status = Value(status),
       tagGps = Value(tagGps);
  static Insertable<AbsensiData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? dateAbsen,
    Expression<String>? status,
    Expression<String>? tagGps,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dateAbsen != null) 'date_absen': dateAbsen,
      if (status != null) 'status': status,
      if (tagGps != null) 'tag_gps': tagGps,
    });
  }

  AbsensiCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime?>? dateAbsen,
    Value<String>? status,
    Value<String>? tagGps,
  }) {
    return AbsensiCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dateAbsen: dateAbsen ?? this.dateAbsen,
      status: status ?? this.status,
      tagGps: tagGps ?? this.tagGps,
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
    if (dateAbsen.present) {
      map['date_absen'] = Variable<DateTime>(dateAbsen.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (tagGps.present) {
      map['tag_gps'] = Variable<String>(tagGps.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbsensiCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateAbsen: $dateAbsen, ')
          ..write('status: $status, ')
          ..write('tagGps: $tagGps')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AbsensiTable absensi = $AbsensiTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [absensi];
}

typedef $$AbsensiTableCreateCompanionBuilder =
    AbsensiCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime?> dateAbsen,
      required String status,
      required String tagGps,
    });
typedef $$AbsensiTableUpdateCompanionBuilder =
    AbsensiCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime?> dateAbsen,
      Value<String> status,
      Value<String> tagGps,
    });

class $$AbsensiTableFilterComposer
    extends Composer<_$AppDatabase, $AbsensiTable> {
  $$AbsensiTableFilterComposer({
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

  ColumnFilters<DateTime> get dateAbsen => $composableBuilder(
    column: $table.dateAbsen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagGps => $composableBuilder(
    column: $table.tagGps,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AbsensiTableOrderingComposer
    extends Composer<_$AppDatabase, $AbsensiTable> {
  $$AbsensiTableOrderingComposer({
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

  ColumnOrderings<DateTime> get dateAbsen => $composableBuilder(
    column: $table.dateAbsen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagGps => $composableBuilder(
    column: $table.tagGps,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AbsensiTableAnnotationComposer
    extends Composer<_$AppDatabase, $AbsensiTable> {
  $$AbsensiTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get dateAbsen =>
      $composableBuilder(column: $table.dateAbsen, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get tagGps =>
      $composableBuilder(column: $table.tagGps, builder: (column) => column);
}

class $$AbsensiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AbsensiTable,
          AbsensiData,
          $$AbsensiTableFilterComposer,
          $$AbsensiTableOrderingComposer,
          $$AbsensiTableAnnotationComposer,
          $$AbsensiTableCreateCompanionBuilder,
          $$AbsensiTableUpdateCompanionBuilder,
          (
            AbsensiData,
            BaseReferences<_$AppDatabase, $AbsensiTable, AbsensiData>,
          ),
          AbsensiData,
          PrefetchHooks Function()
        > {
  $$AbsensiTableTableManager(_$AppDatabase db, $AbsensiTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AbsensiTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AbsensiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AbsensiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> dateAbsen = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> tagGps = const Value.absent(),
              }) => AbsensiCompanion(
                id: id,
                name: name,
                dateAbsen: dateAbsen,
                status: status,
                tagGps: tagGps,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime?> dateAbsen = const Value.absent(),
                required String status,
                required String tagGps,
              }) => AbsensiCompanion.insert(
                id: id,
                name: name,
                dateAbsen: dateAbsen,
                status: status,
                tagGps: tagGps,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AbsensiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AbsensiTable,
      AbsensiData,
      $$AbsensiTableFilterComposer,
      $$AbsensiTableOrderingComposer,
      $$AbsensiTableAnnotationComposer,
      $$AbsensiTableCreateCompanionBuilder,
      $$AbsensiTableUpdateCompanionBuilder,
      (AbsensiData, BaseReferences<_$AppDatabase, $AbsensiTable, AbsensiData>),
      AbsensiData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AbsensiTableTableManager get absensi =>
      $$AbsensiTableTableManager(_db, _db.absensi);
}
