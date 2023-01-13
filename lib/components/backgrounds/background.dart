import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //cari tau ukuran screen
    return Container(
      color: const Color.fromARGB(255, 216, 229, 255),
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/decor_atas.png",
                width: size.width * 0.5),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/decor_bawah.png",
                width: size.width * 0.5),
          ),
          child,
        ],
      ),
    );
  }
}
