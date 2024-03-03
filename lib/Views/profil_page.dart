import 'dart:io';

import 'package:aplikasi_perpus_sederhana/Var/profil.dart';
import 'package:aplikasi_perpus_sederhana/Views/booklist_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/home_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfilPage extends StatefulWidget {
  final Profil? profil;
  const ProfilPage({super.key, this.profil});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List<Profil> profils = [];
  TextEditingController tglLahirController = TextEditingController();
  DateTime tglLahir = DateTime.now();
  File? _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 420,
              height: 280,
              decoration: BoxDecoration(
                color: const Color(0xff2C253F),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: const Color(0xFF8477DC),
                              child: Transform.translate(
                                offset: const Offset(-15, -4),
                                child: const Icon(
                                  Icons.person_4,
                                  size: 150,
                                  color: Color(0xff2C253F),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(80, 80),
                              child: CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                radius: 20,
                                child: IconButton(
                                  onPressed: _pickImage,
                                  icon: const Icon(Icons.photo_camera),
                                  color: const Color(0xff2C253F),
                                ),
                              ),
                            )
                          ],
                        )
                      : Stack(
                          children: [
                            CircleAvatar(
                                radius: 60,
                                backgroundColor: const Color(0xFF8477DC),
                                child: ClipOval(
                                  child: Image.file(
                                    _image!,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Transform.translate(
                              offset: const Offset(80, 80),
                              child: CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                radius: 20,
                                child: IconButton(
                                  onPressed: _pickImage,
                                  icon: const Icon(Icons.photo_camera),
                                  color: const Color(0xff2C253F),
                                ),
                              ),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Septian Asropik',
                    style: TextStyle(
                        color: Color(0xFFFFE8C2),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, left: 35, right: 35),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Poppins'),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Poppins'),
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telepon',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onTap: () async {
                      final pickDate = await showDatePicker(
                        context: context,
                        initialDate: tglLahir,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickDate != null && pickDate != tglLahir) {
                        setState(() {
                          tglLahir = pickDate;
                          tglLahirController.text =
                              DateFormat('dd-MM-yyyy').format(pickDate);
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    cursorColor: Colors.white,
                    minLines: 2,
                    maxLines: 2,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Poppins'),
                    decoration: const InputDecoration(
                      labelText: 'Saran dan Masukan',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFFFFE8C2),
                              title: const Text(
                                'Konfirmasi Keluar',
                                style: TextStyle(
                                    color: Color(0xff2C253F),
                                    fontFamily: 'Poppins',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                'Apakah anda yakin ingin keluar dari halaman ini?',
                                style: TextStyle(
                                    color: Color(0xff2C253F),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      child: const Text(
                                        'Batal',
                                        style: TextStyle(
                                            color: Color(0xff2C253F),
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Keluar',
                                        style: TextStyle(
                                            color: Color(0xff2C253F),
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LandingPage()));
                                      },
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Keluar',
                      style: TextStyle(
                          color: Color(0xFFFFE8C2),
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GNav(
          selectedIndex: 2,
          padding: const EdgeInsets.all(10),
          color: const Color(0xFF8477DC),
          activeColor: const Color(0xff2C253F),
          backgroundColor: const Color(0xff2C253F),
          tabBackgroundColor: const Color(0xFF8477DC),
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 800),
          gap: 10,
          iconSize: 28,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            GButton(
              icon: Icons.menu_book,
              text: 'Daftar Buku',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookListPage()));
              },
            ),
            GButton(
              icon: Icons.person,
              text: 'Profil',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
}
