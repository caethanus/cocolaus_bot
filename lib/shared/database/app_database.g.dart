// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsuarioDiscordTableTable extends UsuarioDiscordTable
    with TableInfo<$UsuarioDiscordTableTable, UsuarioDiscordTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuarioDiscordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idDiscordMeta = const VerificationMeta(
    'idDiscord',
  );
  @override
  late final GeneratedColumn<String> idDiscord = GeneratedColumn<String>(
    'id_discord',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeUsuarioDiscordMeta =
      const VerificationMeta('nomeUsuarioDiscord');
  @override
  late final GeneratedColumn<String> nomeUsuarioDiscord =
      GeneratedColumn<String>(
        'nome_usuario_discord',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    criadoEm,
    idDiscord,
    nomeUsuarioDiscord,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuarios_discord';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsuarioDiscordTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    } else if (isInserting) {
      context.missing(_criadoEmMeta);
    }
    if (data.containsKey('id_discord')) {
      context.handle(
        _idDiscordMeta,
        idDiscord.isAcceptableOrUnknown(data['id_discord']!, _idDiscordMeta),
      );
    } else if (isInserting) {
      context.missing(_idDiscordMeta);
    }
    if (data.containsKey('nome_usuario_discord')) {
      context.handle(
        _nomeUsuarioDiscordMeta,
        nomeUsuarioDiscord.isAcceptableOrUnknown(
          data['nome_usuario_discord']!,
          _nomeUsuarioDiscordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nomeUsuarioDiscordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDiscord};
  @override
  UsuarioDiscordTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsuarioDiscordTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
      idDiscord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_discord'],
      )!,
      nomeUsuarioDiscord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_usuario_discord'],
      )!,
    );
  }

  @override
  $UsuarioDiscordTableTable createAlias(String alias) {
    return $UsuarioDiscordTableTable(attachedDatabase, alias);
  }
}

class UsuarioDiscordTableData extends DataClass
    implements Insertable<UsuarioDiscordTableData> {
  final String id;
  final DateTime criadoEm;
  final String idDiscord;
  final String nomeUsuarioDiscord;
  const UsuarioDiscordTableData({
    required this.id,
    required this.criadoEm,
    required this.idDiscord,
    required this.nomeUsuarioDiscord,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    map['id_discord'] = Variable<String>(idDiscord);
    map['nome_usuario_discord'] = Variable<String>(nomeUsuarioDiscord);
    return map;
  }

  UsuarioDiscordTableCompanion toCompanion(bool nullToAbsent) {
    return UsuarioDiscordTableCompanion(
      id: Value(id),
      criadoEm: Value(criadoEm),
      idDiscord: Value(idDiscord),
      nomeUsuarioDiscord: Value(nomeUsuarioDiscord),
    );
  }

  factory UsuarioDiscordTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsuarioDiscordTableData(
      id: serializer.fromJson<String>(json['id']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
      idDiscord: serializer.fromJson<String>(json['idDiscord']),
      nomeUsuarioDiscord: serializer.fromJson<String>(
        json['nomeUsuarioDiscord'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
      'idDiscord': serializer.toJson<String>(idDiscord),
      'nomeUsuarioDiscord': serializer.toJson<String>(nomeUsuarioDiscord),
    };
  }

  UsuarioDiscordTableData copyWith({
    String? id,
    DateTime? criadoEm,
    String? idDiscord,
    String? nomeUsuarioDiscord,
  }) => UsuarioDiscordTableData(
    id: id ?? this.id,
    criadoEm: criadoEm ?? this.criadoEm,
    idDiscord: idDiscord ?? this.idDiscord,
    nomeUsuarioDiscord: nomeUsuarioDiscord ?? this.nomeUsuarioDiscord,
  );
  UsuarioDiscordTableData copyWithCompanion(UsuarioDiscordTableCompanion data) {
    return UsuarioDiscordTableData(
      id: data.id.present ? data.id.value : this.id,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
      idDiscord: data.idDiscord.present ? data.idDiscord.value : this.idDiscord,
      nomeUsuarioDiscord: data.nomeUsuarioDiscord.present
          ? data.nomeUsuarioDiscord.value
          : this.nomeUsuarioDiscord,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioDiscordTableData(')
          ..write('id: $id, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('idDiscord: $idDiscord, ')
          ..write('nomeUsuarioDiscord: $nomeUsuarioDiscord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, criadoEm, idDiscord, nomeUsuarioDiscord);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsuarioDiscordTableData &&
          other.id == this.id &&
          other.criadoEm == this.criadoEm &&
          other.idDiscord == this.idDiscord &&
          other.nomeUsuarioDiscord == this.nomeUsuarioDiscord);
}

class UsuarioDiscordTableCompanion
    extends UpdateCompanion<UsuarioDiscordTableData> {
  final Value<String> id;
  final Value<DateTime> criadoEm;
  final Value<String> idDiscord;
  final Value<String> nomeUsuarioDiscord;
  final Value<int> rowid;
  const UsuarioDiscordTableCompanion({
    this.id = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.idDiscord = const Value.absent(),
    this.nomeUsuarioDiscord = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsuarioDiscordTableCompanion.insert({
    required String id,
    required DateTime criadoEm,
    required String idDiscord,
    required String nomeUsuarioDiscord,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       criadoEm = Value(criadoEm),
       idDiscord = Value(idDiscord),
       nomeUsuarioDiscord = Value(nomeUsuarioDiscord);
  static Insertable<UsuarioDiscordTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? criadoEm,
    Expression<String>? idDiscord,
    Expression<String>? nomeUsuarioDiscord,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (idDiscord != null) 'id_discord': idDiscord,
      if (nomeUsuarioDiscord != null)
        'nome_usuario_discord': nomeUsuarioDiscord,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsuarioDiscordTableCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? criadoEm,
    Value<String>? idDiscord,
    Value<String>? nomeUsuarioDiscord,
    Value<int>? rowid,
  }) {
    return UsuarioDiscordTableCompanion(
      id: id ?? this.id,
      criadoEm: criadoEm ?? this.criadoEm,
      idDiscord: idDiscord ?? this.idDiscord,
      nomeUsuarioDiscord: nomeUsuarioDiscord ?? this.nomeUsuarioDiscord,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (idDiscord.present) {
      map['id_discord'] = Variable<String>(idDiscord.value);
    }
    if (nomeUsuarioDiscord.present) {
      map['nome_usuario_discord'] = Variable<String>(nomeUsuarioDiscord.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioDiscordTableCompanion(')
          ..write('id: $id, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('idDiscord: $idDiscord, ')
          ..write('nomeUsuarioDiscord: $nomeUsuarioDiscord, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsuarioDiscordTableTable usuarioDiscordTable =
      $UsuarioDiscordTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [usuarioDiscordTable];
}

typedef $$UsuarioDiscordTableTableCreateCompanionBuilder =
    UsuarioDiscordTableCompanion Function({
      required String id,
      required DateTime criadoEm,
      required String idDiscord,
      required String nomeUsuarioDiscord,
      Value<int> rowid,
    });
typedef $$UsuarioDiscordTableTableUpdateCompanionBuilder =
    UsuarioDiscordTableCompanion Function({
      Value<String> id,
      Value<DateTime> criadoEm,
      Value<String> idDiscord,
      Value<String> nomeUsuarioDiscord,
      Value<int> rowid,
    });

class $$UsuarioDiscordTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsuarioDiscordTableTable> {
  $$UsuarioDiscordTableTableFilterComposer({
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

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idDiscord => $composableBuilder(
    column: $table.idDiscord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeUsuarioDiscord => $composableBuilder(
    column: $table.nomeUsuarioDiscord,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsuarioDiscordTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuarioDiscordTableTable> {
  $$UsuarioDiscordTableTableOrderingComposer({
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

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idDiscord => $composableBuilder(
    column: $table.idDiscord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeUsuarioDiscord => $composableBuilder(
    column: $table.nomeUsuarioDiscord,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsuarioDiscordTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuarioDiscordTableTable> {
  $$UsuarioDiscordTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  GeneratedColumn<String> get idDiscord =>
      $composableBuilder(column: $table.idDiscord, builder: (column) => column);

  GeneratedColumn<String> get nomeUsuarioDiscord => $composableBuilder(
    column: $table.nomeUsuarioDiscord,
    builder: (column) => column,
  );
}

class $$UsuarioDiscordTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuarioDiscordTableTable,
          UsuarioDiscordTableData,
          $$UsuarioDiscordTableTableFilterComposer,
          $$UsuarioDiscordTableTableOrderingComposer,
          $$UsuarioDiscordTableTableAnnotationComposer,
          $$UsuarioDiscordTableTableCreateCompanionBuilder,
          $$UsuarioDiscordTableTableUpdateCompanionBuilder,
          (
            UsuarioDiscordTableData,
            BaseReferences<
              _$AppDatabase,
              $UsuarioDiscordTableTable,
              UsuarioDiscordTableData
            >,
          ),
          UsuarioDiscordTableData,
          PrefetchHooks Function()
        > {
  $$UsuarioDiscordTableTableTableManager(
    _$AppDatabase db,
    $UsuarioDiscordTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuarioDiscordTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuarioDiscordTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UsuarioDiscordTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<String> idDiscord = const Value.absent(),
                Value<String> nomeUsuarioDiscord = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsuarioDiscordTableCompanion(
                id: id,
                criadoEm: criadoEm,
                idDiscord: idDiscord,
                nomeUsuarioDiscord: nomeUsuarioDiscord,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime criadoEm,
                required String idDiscord,
                required String nomeUsuarioDiscord,
                Value<int> rowid = const Value.absent(),
              }) => UsuarioDiscordTableCompanion.insert(
                id: id,
                criadoEm: criadoEm,
                idDiscord: idDiscord,
                nomeUsuarioDiscord: nomeUsuarioDiscord,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsuarioDiscordTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuarioDiscordTableTable,
      UsuarioDiscordTableData,
      $$UsuarioDiscordTableTableFilterComposer,
      $$UsuarioDiscordTableTableOrderingComposer,
      $$UsuarioDiscordTableTableAnnotationComposer,
      $$UsuarioDiscordTableTableCreateCompanionBuilder,
      $$UsuarioDiscordTableTableUpdateCompanionBuilder,
      (
        UsuarioDiscordTableData,
        BaseReferences<
          _$AppDatabase,
          $UsuarioDiscordTableTable,
          UsuarioDiscordTableData
        >,
      ),
      UsuarioDiscordTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsuarioDiscordTableTableTableManager get usuarioDiscordTable =>
      $$UsuarioDiscordTableTableTableManager(_db, _db.usuarioDiscordTable);
}
