import 'package:tugas_firman/db/app_db.dart';

class AbsensiDb {

  final AppDatabase db;

  AbsensiDb(this.db);

  Future<void> addAbsensi(AbsensiCompanion data) async {
    await db.into(db.absensi).insert(data);
  }

  Future<List<AbsensiData>> getAllAbsensi() async {
    return await db.select(db.absensi).get();
  }

  Future<void> deleteAbsensi(int id) async {
    await (db.delete(db.absensi)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateAbsensi(AbsensiCompanion data) async {
    await (db.update(db.absensi)..where((tbl) => tbl.id.equals(data.id.value))).write(data);
  }

}