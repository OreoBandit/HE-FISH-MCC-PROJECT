import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';

import '../components/backgrounds/background.dart';
import '../components/util/customized_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController password_controller_confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    "assets/images/he-fish-logo.png",
                    width: size.width * 0.7,
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: FractionallySizedBox(
                        child: Container(
                          height: size.height * 0.6,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),

                        //USERNAME
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 170, 0),
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
                          keyboardType: TextInputType.name,
                          suffixIcon: Icons.person,
                        ), //USERNAME

                        //pembatas
                        const SizedBox(height: 30),

                        //EMAIL
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 220, 0),
                          //EMAIL
                          child: Text(
                            "EMAIL",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF',
                              fontSize: 20,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ), //EMAIL
                        CustomizedTextField(
                          controller: email_controller,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icons.email,
                        ), //EMAIL

                        const SizedBox(height: 30),
                        //PASSWORD
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 165, 0),
                          //USERNAME
                          child: Text(
                            "PASSWORD",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF',
                              fontSize: 20,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ), //USERNAME
                        CustomizedTextField(
                          controller: password_controller,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: Icons.visibility,
                        ), //USERNAME

                        //pembatas
                        const SizedBox(height: 30),

                        //PASSWORD CONFIRM
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
                          //EMAIL
                          child: Text(
                            "CONFIRM PASSWORD",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF',
                              fontSize: 20,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ), //EMAIL
                        CustomizedTextField(
                          controller: password_controller_confirm,
                          hintText: "Confirm Password",
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: Icons.visibility,
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      //NAVIGASI KE HOME PAGE
                      onPressed: () {
                        RegExp pformat = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-_!@#\$&*~]).{8,}$');
                        String errMSG = "Successfuly registered!";
                        Color errCol;
                        if (username_controller.text.isEmpty ||
                            password_controller.text.isEmpty ||
                            email_controller.text.isEmpty ||
                            password_controller_confirm.text.isEmpty) {
                          errMSG = "Please fill all of the forms";
                          errCol = Colors.red;
                        } else if (username_controller.text.length < 4) {
                          errMSG = "username must be at least 4 characters";
                          errCol = Colors.red;
                        } else if (!EmailValidator.validate(
                            email_controller.text, true)) {
                          errMSG = "email format is incorrect";
                          errCol = Colors.red;
                        } else if (password_controller.text.length < 8) {
                          errMSG = "password must be at least 8 characters";
                          errCol = Colors.red;
                        } else if (!pformat
                            .hasMatch(password_controller.text)) {
                          errMSG =
                              "Password must contains at least 1 upper, lower, and number character!";
                          errCol = Colors.red;
                        } else if (!(password_controller.text ==
                            password_controller_confirm.text)) {
                          errMSG = "password did not match";
                          errCol = Colors.red;
                        } else {
                          if (1 > 4) {
                            //USERNAME ALREADY EXIST
                            errMSG = "Username already registered";
                            errCol = Colors.red;
                          } else if (1 > 4) {
                            //EMAIL ALREADY EXIST
                            errMSG = "Email already registered";
                            errCol = Colors.red;
                          } else if (1 > 4) {
                            //USERNAME ALREADY EXIST
                            errMSG = "Username already taken";
                            errCol = Colors.red;
                          } else {
                            Navigator.of(context).pop(context);
                            errCol = const Color.fromARGB(255, 130, 234, 134);
                          }
                          //API LOGIN
                          // if (1<2) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return const RegisterPage(
                          //             // user: User(
                          //             //   id: 1,
                          //             //   email: "Bimski.Diski@gmail.com",
                          //             //   username: "Brudda bimski",
                          //             //   token: "Bimski0123",
                          //             // ),
                          //             );
                          //       },
                          //     ),
                          //   );
                          //   errCol = const Color.fromARGB(255, 130, 234, 134);
                          // } //API LOGIN
                          // else {
                          //   //ERROR MESSAGE
                          //   errCol = Colors.red;
                          // }
                        }
                        final msg = SnackBar(
                          content: Text(errMSG),
                          backgroundColor: errCol,
                          duration: const Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(msg);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 227, 235, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'INTER',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
