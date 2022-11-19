import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soalatihan/view/main/latihan_soal/home_page.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({super.key});
  static String route = 'mapel_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Mata Pelajaran'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: MapelWidget(),
        );
      }),
    );
  }
}
