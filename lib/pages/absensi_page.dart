import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_firman/db/absensi_db.dart';
import 'package:tugas_firman/db/app_db.dart';
import 'package:tugas_firman/injector.dart';
import 'package:tugas_firman/pages/absensi_form_page.dart';

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
  var project = "Project A";
  var tagGps = "Gps Tag";
  
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
    String project = '',
    String tagGps = '',
  }) async {
    try {
      final absensi = AbsensiCompanion(
        name: Value(name),
        dateAbsen: Value(now),
        status: Value(status),
        tagGps: Value(tagGps),
        project: Value(project),
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
    String status = 'Masuk',  
    String project = 'Project A',
  }) async {
    try {
      final absensi = AbsensiCompanion(
        id: Value(id),
        name: Value(name),
        status: Value(status),
        project: Value(project),
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
        title: const Text('Absensi Labour Project'),
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
                  project: result['project'],
                  status: result['status'],
                  tagGps: result['tagGps'],
                );
              }
            },
            icon: Icon(Icons.add),
          ),
          
        ],
      ),
      body: 
      ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: Absensi.length,
        separatorBuilder: (_, __) => SizedBox(height: 10), 
        itemBuilder: (_, index) => 
        Card(
          child: ListTile(
            title: Text(DateFormat('EEE, dd MMMM y hh:mm:ss').format(Absensi[index].dateAbsen!)),
            subtitle: Text("${Absensi[index].project} \n ${Absensi[index].tagGps}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Absensi[index].status != "masuk" ? Icons.arrow_back : Icons.arrow_forward),
              // IconButton(
              //     onPressed: () async {
              //       final result = await Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => AbsensiFormPage(
              //             name: Absensi[index].name,
              //             status: Absensi[index].status,
              //             project: Absensi[index].project,
              //             tagGps: Absensi[index].tagGps,
              //           ),
              //         ),
              //       );
              //       if(result != null) {
              //         editAbsensi(
              //           id: Absensi[index].id,
              //           name: result['name'], 
              //         );
              //       }
              //     },
              //     icon: Icon(Icons.edit),
              //   ),
              //   IconButton(
              //     onPressed: () {
              //       delete(Absensi[index].id);
              //     },
              //     icon: Icon(Icons.delete),
              //   ),
              ],  
            ),
          ),
        ), 
        
      ),
    );
  }
}