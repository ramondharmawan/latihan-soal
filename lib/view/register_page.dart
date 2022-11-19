import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soalatihan/view/main_page.dart';

import '../constants/r.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String route = "register_page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  String gender = 'Laki-Laki';
  List<String> classSlta = ['10', '11', '12'];
  String selectedClass = '10';

  final emailController = TextEditingController();
  // TextEditingController untuk menyimpan hasil inputan, disini kita pakai email sebagai contoh

  onTapGender(Gender genderInput) {
    if (genderInput == Gender.lakiLaki) {
      gender = 'Laki-Laki';
    } else {
      gender = 'Perempuan';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3f5),
      // resizeToAvoidBottomInset: false, aktifkan ini jika spacer dibawah aktif dan remove widget SingleChildScrollView pada body
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Yuk isi data diri!',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ButtonLogin(
            onTap: () {
              print(emailController.text);
              // Navigator.of(context).pushNamed(MainPage.route);
              // ini diganti dibawah untuk menghilangkan tombol back iconTheme pada halaman home page, profile page dan chat page:
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(MainPage.route, (context) => false);
            },
            backgroundColor: R.colors.primary,
            borderColor: R.colors.primary,
            child: Text(
              R.strings.daftar,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterTextField(
                hintText: 'NamaLengkap',
                title: 'Nama Lengkap',
              ),
              RegisterTextField(
                controllers: emailController,
                hintText: 'Email',
                title: 'Email',
              ),
              const Text(
                "Jenis Kelamin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: gender == 'Laki-Laki'
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.greyBorder,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.lakiLaki);
                        },
                        child: Text(
                          'Laki-Laki',
                          style: TextStyle(
                            color: gender == 'Laki-Laki'
                                ? Colors.white
                                : const Color(0xff282828),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: gender == 'Perempuan'
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.greyBorder,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.perempuan);
                        },
                        child: Text(
                          'Perempuan',
                          style: TextStyle(
                            color: gender == 'Perempuan'
                                ? Colors.white
                                : const Color(0xff282828),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "Kelas",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: R.colors.greyBorder,
                    )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: selectedClass,
                      items: classSlta
                          .map(
                            (e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? val) {
                        selectedClass = val!;
                        setState(() {});
                      }),
                ),
              ),
              const SizedBox(height: 5),
              const RegisterTextField(
                hintText: 'Nama Sekolah',
                title: 'Nama Sekolah',
              ),
              // Spacer(),
              // di bawah adalah button login bawah
              // ButtonLogin(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(MainPage.route);
              //   },
              //   backgroundColor: R.colors.primary,
              //   borderColor: R.colors.primary,
              //   child: Text(
              //     R.strings.daftar,
              //     style: const TextStyle(
              //       fontSize: 17,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              // ), Button login di pindahkan ke atas ke bottomNavigationBar dan di wrap dengan safeArea widget ini digunakan jika formnya gak banyak
              // jadi hanya ada dua pilihan , aktifkan spacer(), resizeToAvoidBottomInset: false, button login bawah lalu diaktifkan bottomNavigationBar dan SafeArea atau sebaliknya
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controllers,
  }) : super(key: key);
  final String title;
  final String hintText;
  final TextEditingController? controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(
                color: R.colors.greyBorder,
              )),
          child: TextField(
            controller: controllers,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: R.colors.greyHintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
