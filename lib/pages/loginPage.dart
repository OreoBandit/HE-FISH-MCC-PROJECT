import 'dart:convert';

import 'package:fish/components/backgrounds/background.dart';
import 'package:fish/components/util/User.dart';
import 'package:fish/components/util/customized_textfield.dart';
import 'package:fish/pages/HomePage.dart';
import 'package:fish/pages/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import '../components/util/google_sign_in_api.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  Future<User> loginUser(String username, String pass) async {
    var url = 'http://10.0.2.2:3000/users/login'; //mobile device
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'username': username, 'pass': pass}));
    var result = jsonDecode(response.body);
    if (result.length > 0) {
      return User.fromJson(result[0]);
    } else {
      return User(
        id: -1,
        email: 'none',
        username: 'none',
        pass: 'none',
        token: 'none',
      );
    }
  }

  Future googleLogin(BuildContext context) async {
    final user = await GoogleSignInApi.login(context);
    String errMSG = 'Login Succesful';
    Color errCol = const Color.fromARGB(255, 130, 234, 134);
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(
              user: User(
                id: 1,
                email: "bimski.diski@gmail.com",
                username: username_controller.text,
                token: "Bram112",
                pass: 'divine intervention',
              ),
            );
          },
        ),
      );
    }
    final msg = SnackBar(
      content: Text(errMSG),
      backgroundColor: errCol,
      duration: const Duration(seconds: 2),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(msg);
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/images/he-fish-logo.png",
                    width: size.width * 0.7,
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SIGN IN TO CONTINUE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF',
                        fontSize: 25,
                        letterSpacing: 1.2,
                        color: Color.fromARGB(255, 27, 27, 27)),
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Center(
                      child: FractionallySizedBox(
                        child: Container(
                          height: size.height * 0.5,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 175, 0),

                          //USERNAME
                          child: Text(
                            "USERNAME",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF',
                              fontSize: 20,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ), //USERNAME

                        CustomizedTextField(
                            controller: username_controller,
                            hintText: "Username",
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: Icons.person),

                        //PASSWORD
                        const SizedBox(height: 40),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 175, 0),

                          //PASSWORD
                          child: Text(
                            "PASSWORD",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF',
                              fontSize: 20,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        CustomizedTextField(
                          controller: password_controller,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: Icons.visibility,
                        ), //PASSWORD

                        //BUTTON LOGIN
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              //NAVIGASI KE HOME PAGE

                              onPressed: () async {
                                RegExp pformat = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-_!@#\$&*~]).{8,}$');
                                String errMSG = 'Login Succesful';
                                Color errCol;
                                if (username_controller.text.isEmpty ||
                                    password_controller.text.isEmpty) {
                                  errMSG = "Please fill all of the forms";
                                  errCol = Colors.red;
                                } else if (!pformat
                                    .hasMatch(password_controller.text)) {
                                  errMSG =
                                      "Password must contains at least 1 upper, lower, and number character!";
                                  errCol = Colors.red;
                                } else {
                                  User validate = await loginUser(
                                      username_controller.text,
                                      password_controller.text);
                                  //API LOGIN
                                  if (validate.id >= 0) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomePage(
                                            user: validate,
                                          );
                                        },
                                      ),
                                    );
                                    errCol = Colors.green;
                                  } else {
                                    //ERROR MESSAGE
                                    errMSG = "Something went wrong!";
                                    errCol = Colors.red;
                                  }
                                }
                                final msg = SnackBar(
                                  content: Text(errMSG),
                                  backgroundColor: errCol,
                                  duration: const Duration(seconds: 2),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(msg);
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 227, 235, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                "LOG IN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'INTER',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ), //BUTTON LOGIN

                        //LOG IN WITH GOOGLE
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //GOOGLE LOGIN
                              TextButton(
                                onPressed: () {
                                  googleLogin(context);
                                },
                                child: const Text(
                                  "OR LOG IN WITH",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SF',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                "assets/images/google icon.png",
                                width: size.width * 0.03,
                              )
                            ],
                          ),
                        ), //LOG IN WITH GOOGLE API
                      ],
                    )
                  ],
                ),

                //DONT HAVE ACCOUNT?
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    //API LOGIN WITH GOOGLE
                    // MaterialPageRoute(builder:  )
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'INTER',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ), //REGISTER
              ],
            ),
          ),
        ),
      ),
    );
  }
}
