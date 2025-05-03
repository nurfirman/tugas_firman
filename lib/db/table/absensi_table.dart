import 'package:drift/drift.dart';

class Absensi extends Table {
  @override
  String get tableName => 'absensi';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dateAbsen => dateTime().nullable()();
  TextColumn get status => text().withLength(min: 1, max: 50)();
  TextColumn get tagGps => text().withLength(min: 1, max: 100)();
  TextColumn get project => text().withLength(min: 1, max: 150)();
}