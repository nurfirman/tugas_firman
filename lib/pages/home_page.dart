import 'package:flutter/material.dart';
import 'package:tugas_firman/pages/absensi_page.dart';
import 'package:tugas_firman/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var name = "Lionel Messi";
  var currentIndex = 0;

  // final db = AbsensiDb(getIt<AppDatabase>());
  // final Absensi = <AbsensiData>[];
  // final now = DateTime.now();

  // Future<void> getAbsensi() async {
  //   try {
  //     final result = await db.getAllAbsensi();
  //     setState(() {
  //       Absensi.clear();
  //       Absensi.addAll(result);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> delete(int id) async {
  //   try {
  //     await db.deleteAbsensi(id);
  //     await getAbsensi();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> addAbsensi({
  //   String name = '',
  //   String status = 'Masuk',
  // }) async {
  //   try {
  //     final absensi = AbsensiCompanion(
  //       name: Value(name),
  //       dateAbsen: Value(now),
  //       status: Value(status),
  //       tagGps: Value("kantor")
  //     );
  //     await db.addAbsensi(absensi);
  //     await getAbsensi();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> editAbsensi({
  //   required int id,
  //   String name = '',
  //   double price = 0.0,
  // }) async {
  //   try {
  //     final absensi = AbsensiCompanion(
  //       id: Value(id),
  //       name: Value(name),
  //     );
  //     await db.updateAbsensi(absensi);
  //     await getAbsensi();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

 @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
  body: [
          const AbsensiPage(),
          const ProfilePage(),
        ][currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Absensi'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
          ],
        ),
      );
  }
}