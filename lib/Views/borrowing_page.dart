import 'dart:convert';

import 'package:aplikasi_perpus_sederhana/Var/book.dart';
import 'package:aplikasi_perpus_sederhana/Views/home_page.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class PagePeminjaman extends StatefulWidget {
  final Book? book;

  const PagePeminjaman({super.key, this.book});

  @override
  State<PagePeminjaman> createState() => _PagePeminjamanState();
}

class _PagePeminjamanState extends State<PagePeminjaman> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController tglPinjamController = TextEditingController();
  TextEditingController tglKembaliController = TextEditingController();
  DateTime tglPinjam = DateTime.now();
  DateTime tglKembali = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
          height: 600,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: const Color(0xff2C253F),
            shadowColor: Colors.black,
            elevation: 8,
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Peminjaman Buku',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      controller: nameController,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Nama Peminjam',
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: tglPinjamController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Pinjam',
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
                          initialDate: tglPinjam,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickDate != null && pickDate != tglPinjam) {
                          setState(() {
                            tglPinjam = pickDate;
                            tglPinjamController.text =
                                DateFormat('dd-MM-yyyy').format(pickDate);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      controller: tglKembaliController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Pengembalian',
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
                          initialDate: tglKembali,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickDate != null && pickDate != tglKembali) {
                          setState(() {
                            tglKembali = pickDate;
                            tglKembaliController.text =
                                DateFormat('dd-MM-yyyy').format(pickDate);
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFE8C2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          elevation: 6,
                          shadowColor: Colors.black,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String id = widget.book != null
                                ? widget.book!.id
                                : const Uuid().v4();
                            String name = nameController.text;
                            String tglPinjam = tglPinjamController.text;
                            String tglKembali = tglKembaliController.text;
                            final book = Book(
                              id: id,
                              name: name,
                              tglPinjam: tglPinjam,
                              tglKembali: tglKembali,
                            );
                            saveOrUpdateData(book);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              color: Color(0xff2C253F),
                              fontFamily: 'Poppins',
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveOrUpdateData(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('data') ?? [];
    Map<String, String> newData = {
      'id': book.id,
      'name': book.name,
      'tglPinjam': book.tglPinjam,
      'tglKembali': book.tglKembali,
    };
    int dataIndex = -1;
    for (int i = 0; i < dataList.length; i++) {
      Map<String, dynamic> item = jsonDecode(dataList[i]);
      if (item['id'] == book.id) {
        dataIndex = i;
        break;
      }
    }
    if (dataIndex != -1) {
      dataList[dataIndex] = jsonEncode(newData); // Edit the existing item
    } else {
      dataList.add(jsonEncode(newData)); // Add a new item to the list
    }
    prefs.setStringList(
        'data', dataList); // Save the updated list to local storage
    debugPrint(dataList.toString());
  }
}
