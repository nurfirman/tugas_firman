import 'package:flutter/material.dart';
import 'package:tugas_firman/pages/main_page.dart';
import 'package:tugas_firman/pages/profile_page.dart';
import 'package:tugas_firman/pages/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var name = "Lionel Messi";
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
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
      body: [
        MainPage(name: name),
        ProfilePage(
          name: name,
          onSave: (val) {
            setState(() {
              name = val;
            });
          },
        ),
       
      ][index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ]
      ),
    );
  }
}