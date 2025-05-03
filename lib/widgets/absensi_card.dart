import 'package:flutter/material.dart';

class AbsensiCard extends StatelessWidget {
  const AbsensiCard({
    super.key,
    required this.absensiData,
  });

  final Map<String, String?> absensiData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: absensiData['image'] != null 
                  ? NetworkImage(absensiData['image']!)
                  : null,
              radius: 40,
              child: Text(absensiData['name']![0]),
            ),
            SizedBox(height: 8),
            Text(
              absensiData['name']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}