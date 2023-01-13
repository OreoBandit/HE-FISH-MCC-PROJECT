import 'package:fish/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:cross_file/src/types/interface.dart';

void main() {
  runApp(const HE_FISH());
}

class HE_FISH extends StatelessWidget {
  const HE_FISH({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HE FISH',
      home: loginPage(),
    );
  }
}
