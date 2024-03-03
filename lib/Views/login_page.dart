import 'package:aplikasi_perpus_sederhana/Var/login.dart';
import 'package:aplikasi_perpus_sederhana/Views/home_page.dart';
import 'package:aplikasi_perpus_sederhana/Views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final Login? login;
  const LoginPage({super.key, this.login});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
        //Jika fokus pada text field, jangan hilangkan fokus
      }
      textFieldFocusNode.canRequestFocus =
          false; // false fokus jika mengetuk icon eye
    });
  }

  // RegExp emailReg = RegExp(r"^[a-z0-9_]*$", caseSensitive: false);
  RegExp passReg = RegExp(r"^[a-z0-9_]*$", caseSensitive: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C253F),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5),
                                  children: [
                                    TextSpan(
                                        text: 'Login ',
                                        style: TextStyle(
                                            color: Color(0xFFFFE8C2))),
                                    TextSpan(text: 'atau '),
                                    TextSpan(
                                        text: 'Sign Up ',
                                        style: TextStyle(
                                            color: Color(0xFFFFE8C2))),
                                    TextSpan(text: 'kak?')
                                  ]),
                            )),
                      ),
                      Flexible(
                        flex: 2,
                        child: Image.asset(
                          'assets/images/login.png',
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFE8C2)),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                    left: 60,
                    right: 60,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          child: TextFormField(
                            cursorColor: const Color(0xFF312A45),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (valueEmail) {
                              if (valueEmail!.isEmpty) {
                                return 'Please enter a email';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Color(0xFF312A45)),
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF312A45),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                size: 24,
                                color: Color(0xFF312A45),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: TextFormField(
                            cursorColor: const Color(0xFF312A45),
                            obscuringCharacter: '*',
                            obscureText: _obscured,
                            focusNode: textFieldFocusNode,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (valuePass) {
                              if (valuePass!.isEmpty) {
                                return 'Please enter a password';
                              } else if (!(passReg.hasMatch(valuePass))) {
                                return 'Dont use special character';
                              } else if (valuePass.length < 5) {
                                return 'Please fill more than 5';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF312A45),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 24,
                                color: Color(0xFF312A45),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: _toggleObscured,
                                  child: Icon(
                                    _obscured
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 24,
                                    color: const Color(0xFF312A45),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Belum punya akun?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()));
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFFFFE8C2),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String email = emailController.text;
                                    String password = passwordController.text;
                                    final login =
                                        Login(email: email, password: password);
                                    saveOrUpdateData(login);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 6, bottom: 6),
                                  backgroundColor: const Color(0xFFFFE8C2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Color(0xFF312A45),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveOrUpdateData(Login login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('data') ?? [];
    for (int i = 0; i < dataList.length; i++) {}
  }
}
