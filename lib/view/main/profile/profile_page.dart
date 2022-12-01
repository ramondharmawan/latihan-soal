import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soalatihan/view/login_page.dart';

import '../../../constants/r.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun Saya',
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            // color tidak boleh digunakan secara bersamaan dengan decoration disini, jika tidak akan error
            padding: EdgeInsets.only(
              top: 28,
              bottom: 60,
              right: 15,
              left: 15,
            ),
            decoration: BoxDecoration(
              color: R.colors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama User',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Nama Sekolah User',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  R.assets.imgAvatar,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
          // SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Colors.black.withOpacity(0.25),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 13),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Identitas Diri'),
                SizedBox(height: 15),
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Nama Lengkap User',
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Nama Lengkap User',
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Nama Lengkap User',
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Nama Lengkap User',
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: R.colors.greySubtitleHome,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Nama Lengkap User',
                  style: TextStyle(
                    // color: R.colors.greySubtitleHome,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (kIsWeb) {
                await GoogleSignIn(
                        clientId:
                            "932789887897-qkralmk08rvch81rdngbiq4k6t1905c0.apps.googleusercontent.com")
                    .signOut();
              } else {
                await GoogleSignIn().signOut();
              }

              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      // fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
