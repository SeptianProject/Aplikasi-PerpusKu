import 'package:aplikasi_perpus_sederhana/Views/booklist_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/history_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: const Color(0xff2C253F),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
                icon: const Icon(
                  Icons.history,
                  color: Color(0xFFFFE8C2),
                  size: 24,
                ))
          ],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 40),
              Icon(Icons.menu_book, color: Color(0xFF8477DC), size: 32),
              SizedBox(width: 5),
              Text('Perpus-Ku',
                  style: TextStyle(
                      color: Color(0xFF8477DC),
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
            ],
          )),
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 50, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF8477DC)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello, Septian',
                      style: TextStyle(
                          color: Color(0xFFFFE8C2),
                          fontFamily: 'Poppins',
                          fontSize: 21,
                          fontWeight: FontWeight.w600)),
                  CircleAvatar(
                    backgroundColor: Color(0xff2C253F),
                    child: Icon(
                      Icons.person_4,
                      color: Color(0xFF8477DC),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Row(
              children: [
                Flexible(
                    flex: 2, child: Image.asset('assets/images/home-1.png')),
                const SizedBox(
                  width: 40,
                ),
                const Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Membaca',
                        style: TextStyle(
                            color: Color(0xff8CB18E),
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Teruslah membaca di manapun kamu berada atau apa pun yang kamu lakukan.',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Membaca',
                            style: TextStyle(
                                color: Color(0xffFFE8C2),
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Lebih baik membaca dan mengetahui sesuatu yang baru daripada memikirkan dan merenungkan sesuatu yang tidak benar.',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/home-2.png',
                    )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GNav(
          selectedIndex: 0,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
            GButton(
                icon: Icons.menu_book,
                text: 'Daftar Buku',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookListPage()));
                }),
            GButton(
                icon: Icons.person,
                text: 'Profil',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilPage()));
                }),
          ],
        ),
      ),
    );
  }
}
