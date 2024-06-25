import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_routes.dart';

final List<Map<String, String>> vanSchedule = [
  {'departure': '08:30', 'stop': 'Gedung D'},
  {'departure': '09:30', 'stop': 'Gedung E'},
  {'departure': '10:30', 'stop': 'Gedung F'},
];

class VanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Van Kampus'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Provider.of<FavoriteRoutes>(context, listen: false)
                  .addFavorite({'type': 'Van', 'route': 'Van Kampus'});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Jadwal Van Kampus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: vanSchedule.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Waktu Keberangkatan: ${vanSchedule[index]['departure']}'),
                      subtitle: Text('Lokasi Pemberhentian: ${vanSchedule[index]['stop']}'),
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
