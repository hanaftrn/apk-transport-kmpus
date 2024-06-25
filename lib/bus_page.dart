import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_routes.dart';

final List<Map<String, String>> busSchedule = [
  {'departure': '08:00', 'stop': 'Gedung A'},
  {'departure': '09:00', 'stop': 'Gedung B'},
  {'departure': '10:00', 'stop': 'Gedung C'},
];

class BusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Kampus'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Provider.of<FavoriteRoutes>(context, listen: false)
                  .addFavorite({'type': 'Bus', 'route': 'Bus Kampus'});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Jadwal Bus Kampus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: busSchedule.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Waktu Keberangkatan: ${busSchedule[index]['departure']}'),
                      subtitle: Text('Lokasi Pemberhentian: ${busSchedule[index]['stop']}'),
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
