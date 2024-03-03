import 'package:aplikasi_perpus_sederhana/Views/borrowing_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/home_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List bookImages = [
    'assets/images/book1.png',
    'assets/images/book2.png',
    'assets/images/book3.png',
    'assets/images/book4.png',
    'assets/images/book5.png',
  ];

  final List dataList = [
    {
      'image': 'assets/images/book7.png',
      'title': 'LABYRINTH',
      'subtitle': 'Jane Doe',
      'date': '2008-07-11',
    },
    {
      'image': 'assets/images/book6.png',
      'title': 'DREAMS OF STACY',
      'subtitle': 'Kelvin Rey',
      'date': '2006-02-21',
    },
    {
      'image': 'assets/images/book5.png',
      'title': 'START BUSINESS',
      'subtitle': 'Antonio Perez',
      'date': '2005-09-29',
    },
    {
      'image': 'assets/images/book4.png',
      'title': 'THE GAME OF LIFE',
      'subtitle': 'Abraham Smith',
      'date': '2004-12-02',
    },
    {
      'image': 'assets/images/book3.png',
      'title': 'DIGITAL MIND',
      'subtitle': 'Martin J. Amundsen',
      'date': '2005-08-26',
    },
    {
      'image': 'assets/images/book2.png',
      'title': 'SMALL TALK',
      'subtitle': 'Nicholas Harrison',
      'date': '2007-09-14',
    },
    {
      'image': 'assets/images/book1.png',
      'title': 'AWAY',
      'subtitle': 'Sylvia Walker',
      'date': '2005-10-19',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff2C253F),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book,
                color: Color(0xFF8477DC),
                size: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Perpus-Ku',
                style: TextStyle(
                    color: Color(0xFF8477DC),
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )),
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: const Color(0xFF8477DC),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 8))
                ]),
            margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Column(
              children: [
                const Text(
                  'Buku Terbaru',
                  style: TextStyle(
                      color: Color(0xFF2C253F),
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 5, left: 4),
                          child: Image.asset(bookImages[index]));
                    },
                    itemCount: bookImages.length,
                  ),
                ),
                const Divider(
                  height: 9,
                  thickness: 2,
                  color: Color(0xFF2C253F),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 50, 40, 36),
            child: const Column(
              children: [
                Text(
                  'Daftar Buku',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  style: ListTileStyle.list,
                  leading: Image.asset(
                    dataList[index]['image'],
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      dataList[index]['title'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataList[index]['subtitle'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text(dataList[index]['date'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 8,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 5)
                    ],
                  ),
                  trailing: IconButton(
                    alignment: Alignment.centerRight,
                    icon: const Icon(Icons.arrow_circle_right_outlined),
                    iconSize: 26,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PagePeminjaman()));
                    },
                  ),
                );
              },
              itemCount: dataList.length,
              separatorBuilder: (context, index) {
                return const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xFF8477DC));
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GNav(
          selectedIndex: 1,
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
}
