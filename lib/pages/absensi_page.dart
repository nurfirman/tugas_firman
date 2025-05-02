import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:tugas_firman/db/absensi_db.dart';
import 'package:tugas_firman/db/app_db.dart';
import 'package:tugas_firman/injector.dart';
import 'package:tugas_firman/pages/absensi_form_page.dart';
import 'package:tugas_firman/pages/setting_page.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});
  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {

  final db = AbsensiDb(getIt<AppDatabase>());
  final Absensi = <AbsensiData>[];
  final now = DateTime.now();
  var name = "Lionel Messi";
  
  @override
  void initState() {
    getAbsensi();
    super.initState();
  }

  Future<void> getAbsensi() async {
    try {
      final result = await db.getAllAbsensi();
      setState(() {
        Absensi.clear();
        Absensi.addAll(result);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await db.deleteAbsensi(id);
      await getAbsensi();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addAbsensi({
    String name = '',
    String status = 'Masuk',
  }) async {
    try {
      final absensi = AbsensiCompanion(
        name: Value(name),
        dateAbsen: Value(now),
        status: Value(status),
        tagGps: Value("kantor")
      );
      await db.addAbsensi(absensi);
      await getAbsensi();
    } catch (e) {
      print(e);
    }
  }

  Future<void> editAbsensi({
    required int id,
    String name = '',
    double price = 0.0,
  }) async {
    try {
      final absensi = AbsensiCompanion(
        id: Value(id),
        name: Value(name),
      );
      await db.updateAbsensi(absensi);
      await getAbsensi();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
                    IconButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AbsensiFormPage(),
                ),
              );
              if(result != null) {
                addAbsensi(
                  name: result['name'], 
                );
              }
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              final result = await Navigator.push(context, MaterialPageRoute(
                builder: (context) => SettingPage(
                  name: name,
                ),
              ));
              if(result != null) {
                setState(() {
                  name = result;
                });
              }
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: Absensi.length,
        separatorBuilder: (_, __) => SizedBox(height: 16), 
        itemBuilder: (_, index) => Card(
          child: ListTile(
            title: Text(Absensi[index].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Absensi[index].status),  
                IconButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AbsensiFormPage(
                          name: Absensi[index].name,
                          status: Absensi[index].status,
                        ),
                      ),
                    );
                    if(result != null) {
                      editAbsensi(
                        id: Absensi[index].id,
                        name: result['name'], 
                      );
                    }
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    delete(Absensi[index].id);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            )
          ),
        ), 
      ),
    );
  }
}