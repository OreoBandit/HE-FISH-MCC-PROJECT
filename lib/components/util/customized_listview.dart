import 'package:fish/pages/fishDetail.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fish/components/util/User.dart';
import 'package:fish/components/util/fishes.dart';

class customizedListView extends StatefulWidget {
  final fishes fishItem;
  final User user;

  const customizedListView(
      {super.key, required this.fishItem, required this.user});

  @override
  State<customizedListView> createState() => _customizedListViewState();
}

class _customizedListViewState extends State<customizedListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FishDetail(user: widget.user, item: widget.fishItem);
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // backgroundColor: Palette.background,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  widget.fishItem.image_path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  //DAFTAR IKAN
                  children: [
                    Text(
                      widget.fishItem.fish_name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontFamily: 'INTER',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.fishItem.fish_price,
                      style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'INTER',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.fishItem.fish_desc,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'INTER',
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
