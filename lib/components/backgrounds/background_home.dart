import 'package:flutter/material.dart';

class Background_home extends StatelessWidget {
  final Widget child;
  const Background_home({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //cari tau ukuran screen
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -30,
            child: Image.asset("assets/images/Vector 5.png", width: size.width),
          ),
          Positioned(
            top: -30,
            child: Image.asset("assets/images/Vector 6.png", width: size.width),
          ),
          Positioned(
            top: -30,
            child: Image.asset("assets/images/Vector 7.png", width: size.width),
          ),
          Positioned(
            top: -30,
            child: Image.asset("assets/images/Vector 8.png", width: size.width),
          ),
          child,
        ],
      ),
    );
  }
}
