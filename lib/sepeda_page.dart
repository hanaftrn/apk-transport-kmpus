import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_routes.dart';

final List<Map<String, String>> sepedaSchedule = [
  {'departure': 'Setiap saat', 'stop': 'Lokasi Sepeda A'},
  {'departure': 'Setiap saat', 'stop': 'Lokasi Sepeda B'},
  {'departure': 'Setiap saat', 'stop': 'Lokasi Sepeda C'},
];

class SepedaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepeda Kampus'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Provider.of<FavoriteRoutes>(context, listen: false)
                  .addFavorite({'type': 'Sepeda', 'route': 'Sepeda Kampus'});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Jadwal dan Lokasi Sepeda Kampus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sepedaSchedule.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Waktu Keberangkatan: ${sepedaSchedule[index]['departure']}'),
                      subtitle: Text('Lokasi Pemberhentian: ${sepedaSchedule[index]['stop']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
