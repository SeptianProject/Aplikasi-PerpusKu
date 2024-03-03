import 'package:aplikasi_perpus_sederhana/Views/login_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/loading.png'),
              SizedBox(
                width: 260,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                          text: 'Selamat ',
                          style: TextStyle(color: Color(0xFF8477DC))),
                      TextSpan(text: 'Datang di Aplikasi '),
                      TextSpan(
                          text: 'Perpus-Ku',
                          style: TextStyle(color: Color(0xFF8477DC))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                '-',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 80),
                    fontFamily: 'Poppins',
                    fontSize: 18),
              ),
              SizedBox(
                width: 250,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 80),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(text: 'Jangan membaca karena ingin '),
                      TextSpan(text: 'dianggap pintar, bacalah karena kamu '),
                      TextSpan(text: 'mau membaca, dengan sendirinya '),
                      TextSpan(text: 'kamu akan jadi pintar'),
                    ],
                  ),
                ),
              ),
              const Text(
                '-',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 80),
                    fontFamily: 'Poppins',
                    fontSize: 18),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color(0xFF8477DC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text(
                  'Mulai Sekarang',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
