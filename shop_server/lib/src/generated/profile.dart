/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Profile extends _i1.TableRow {
  Profile({
    int? id,
    required this.userId,
    required this.favorites,
  }) : super(id);

  factory Profile.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Profile(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      favorites: serializationManager
          .deserialize<List<int>>(jsonSerialization['favorites']),
    );
  }

  static final t = ProfileTable();

  int userId;

  List<int> favorites;

  @override
  String get tableName => 'shop_profiles';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'favorites': favorites,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'favorites': favorites,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'userId': userId,
      'favorites': favorites,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'favorites':
        favorites = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Profile>> find(
    _i1.Session session, {
    ProfileExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Profile>(
      where: where != null ? where(Profile.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Profile?> findSingleRow(
    _i1.Session session, {
    ProfileExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Profile>(
      where: where != null ? where(Profile.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Profile?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Profile>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ProfileExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Profile>(
      where: where(Profile.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Profile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Profile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Profile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ProfileExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Profile>(
      where: where != null ? where(Profile.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ProfileExpressionBuilder = _i1.Expression Function(ProfileTable);

class ProfileTable extends _i1.Table {
  ProfileTable() : super(tableName: 'shop_profiles');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final userId = _i1.ColumnInt('userId');

  final favorites = _i1.ColumnSerializable('favorites');

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        favorites,
      ];
}

@Deprecated('Use ProfileTable.t instead.')
ProfileTable tProfile = ProfileTable();
