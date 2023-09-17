// ignore_for_file: implementation_imports

import 'package:serverpod/serverpod.dart';
import 'package:serverpod/src/database/database.dart';

extension DatabaseX on Database {
  /// Inserts or Update a single [TableRow].
  Future<void> insertOrUpdate(
    TableRow row, {
    Transaction? transaction,
  }) async {
    var conn = await databaseConnection;

    if (row.id == null) {
      await conn.insert(
        row,
        session: session,
        transaction: transaction,
      );
    } else {
      await conn.update(
        row,
        session: session,
        transaction: transaction,
      );
    }
  }
}
