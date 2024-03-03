import 'package:aplikasi_perpus_sederhana/Var/signup.dart';
import 'package:aplikasi_perpus_sederhana/Views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  final SignUp? signUp;
  const SignUpPage({super.key, this.signUp});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
                  margin: const EdgeInsets.only(top: 50, left: 15, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5),
                                children: [
                                  TextSpan(
                                      text: 'Sign Up ',
                                      style: TextStyle(
                                        color: Color(0xFF8CB18E),
                                      )),
                                  TextSpan(text: 'sebentar '),
                                  TextSpan(
                                      text: 'ya ',
                                      style: TextStyle(
                                        color: Color(0xFF8CB18E),
                                      )),
                                  TextSpan(text: 'kak')
                                ]),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 2,
                          child: Image.asset('assets/images/register.png'))
                    ],
                  ),
                ),
                const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF8CB18E),
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 60, right: 60),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: const Color(0xFF312A45),
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Color(0xFF312A45)),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Nama',
                            labelStyle: const TextStyle(
                                color: Color(0xFF312A45),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              size: 24,
                              color: Color(0xFF312A45),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
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
                        const SizedBox(height: 20),
                        TextFormField(
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
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
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
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String name = nameController.text;
                                    String email = emailController.text;
                                    String password = passwordController.text;
                                    final signUp = SignUp(
                                        name: name,
                                        email: email,
                                        password: password);
                                    saveOrUpdateData(signUp);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18, top: 6, bottom: 6),
                                  backgroundColor: const Color(0xFF8CB18E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Sign Up',
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

  Future<void> saveOrUpdateData(SignUp signUp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('data') ?? [];
    for (int i = 0; i < dataList.length; i++) {}
  }
}
