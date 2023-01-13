import 'package:flutter/material.dart';

class CustomizedTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final IconData suffixIcon;

  const CustomizedTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.suffixIcon});

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  Widget? iconSys;
  bool iconHidden = true;

  @override
  Widget build(BuildContext context) {
    if (widget.suffixIcon == Icons.visibility) {
      iconSys = IconButton(
        icon: Icon(
          iconHidden == true ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            iconHidden == true ? iconHidden = false : iconHidden = true;
          });
        },
      );
    } else if (widget.suffixIcon == Icons.person) {
      iconSys = Icon(widget.suffixIcon, color: Colors.grey);
      iconHidden = false;
    } else if (widget.suffixIcon == Icons.email) {
      iconSys = Icon(widget.suffixIcon, color: Colors.grey);
      iconHidden = false;
    } else if (widget.suffixIcon == Icons.abc) {
      iconHidden = false;
      iconSys = Icon(widget.suffixIcon, color: Colors.black, size: 30);
    } else if (widget.suffixIcon == Icons.attach_money_outlined) {
      iconHidden = false;
      iconSys = Icon(widget.suffixIcon, color: Colors.black, size: 25);
    } else {
      iconSys = Icon(widget.suffixIcon, color: Colors.white);
      iconHidden = false;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
      child: TextField(
        controller: widget.controller,
        obscureText: iconHidden,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontFamily: 'INTER',
            letterSpacing: 1,
          ),
          isDense: true,
          suffixIcon: iconSys,
        ),
      ),
    );
  }
}
