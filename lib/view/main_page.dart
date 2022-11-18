import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soalatihan/view/main/discussion/chat_page.dart';
import 'package:soalatihan/view/main/latihan_soal/home_page.dart';
import 'package:soalatihan/view/main/profile/profile_page.dart';

import '../constants/r.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static String route = "main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //perlu controller untuk berpindah pindah
  final _pc = PageController();
  // posisi dimana halaman ini skrg
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          R.assets.imgDiscuss,
          width: 30,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ChatPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigation(),
      body: PageView(
        // attach controller pc dibawah ini
        controller: _pc,
        // matikan swapnya
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(), // ini posisi ke 0
          ProfilePage(), // ini posisi ke 1
        ],
      ), // ini method( extract method dengan nama _buildbottomNavigation) karena akan digunakan pada halaman ini saja
    );
  }

  Container _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 20,
          color: Colors.black.withOpacity(0.06),
        )
      ]),
      child: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        index = 0;
                        _pc.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            R.assets.imgHome,
                            height: 30,
                          ),
                          const Text("Home"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Material(
                    child: InkWell(
                      // onTap: (){}, matikan ini agar gak ada splash saat diklik
                      child: Column(
                        children: [
                          Opacity(
                            opacity: 0,
                            child: Image.asset(
                              R.assets.imgHome,
                              height: 30,
                            ),
                          ),
                          const Text("Diskusi"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        print('Profile');
                        index = 1;
                        _pc.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Column(
                        children: const [
                          // Image.asset(
                          //   R.assets.imgHome,
                          //   height: 30,
                          // ),
                          Icon(
                            Icons.person,
                            size: 30,
                          ),
                          Text("Profile"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
