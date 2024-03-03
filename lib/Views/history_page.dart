import 'dart:convert';

import 'package:aplikasi_perpus_sederhana/Var/book.dart';
import 'package:aplikasi_perpus_sederhana/Views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      appBar: AppBar(
          toolbarHeight: 60,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: const Color(0xFFFFE8C2),
            iconSize: 28,
          ),
          backgroundColor: const Color(0xff2C253F),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu_book, color: Color(0xFF8477DC), size: 32),
              SizedBox(width: 5),
              Text('Perpus-Ku',
                  style: TextStyle(
                      color: Color(0xFF8477DC),
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
              SizedBox(width: 30)
            ],
          )),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: books.isEmpty
            ? const Center(
                child: Text(
                '✨ 404 NOT FOUND ✨',
                style: TextStyle(
                    color: Color(0xFFFFE8C2),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ))
            : Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 55, horizontal: 25),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Book book = books[index];
                    return ListTile(
                      textColor: Colors.white,
                      leading: const Icon(
                        Icons.bookmark_outline,
                        color: Color(0xFFFFE8C2),
                        size: 50,
                      ),
                      title: Text(
                        'Nama : ${book.name}',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Tanggal Pinjam : ${book.tglPinjam}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Tanggal Pengembalian : ${book.tglKembali}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color(0xFFFFE8C2),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xFFFFE8C2),
                                title: const Text(
                                  'Konfirmasi Hapus',
                                  style: TextStyle(
                                      color: Color(0xff2C253F),
                                      fontFamily: 'Poppins',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                content: const Text(
                                  'Apakah anda yakin ingin menghapus item ini?',
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
                                          'Hapus',
                                          style: TextStyle(
                                              color: Color(0xff2C253F),
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () {
                                          deleteData(book);
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HistoryPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  itemCount: books.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1.5,
                      color: Color(0xFFFFE8C2),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('data') ?? [];
    List<Book> parsedData = [];
    for (String dataUser in dataList) {
      debugPrint(dataUser);
      Map<String, dynamic> decodedData = jsonDecode(dataUser);
      Book book = Book(
        id: decodedData['id'],
        name: decodedData['name'],
        tglPinjam: decodedData['tglPinjam'] ?? "-",
        tglKembali: decodedData['tglKembali'] ?? "-",
      );
      parsedData.add(book);
    }
    setState(() {
      books = parsedData;
    });
  }

  Future<void> deleteData(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('data') ?? [];
    dataList.removeWhere((data) {
      final Map<String, dynamic> decodedData = jsonDecode(data);
      final String id = decodedData['id'];
      return id == book.id;
    });
    prefs.setStringList('data', dataList);
  }
}
