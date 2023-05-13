import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../components/util/User.dart';
import '../components/util/customized_textfield.dart';
import '../components/util/fishes.dart';
import 'FishesPage.dart';
import 'HomePage.dart';
import 'package:flutter/cupertino.dart';
import './editFish.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FishDetail extends StatefulWidget {
  final User user;
  final fishes item;
  const FishDetail({super.key, required this.user, required this.item});

  @override
  State<FishDetail> createState() => _fishDetailState();
}

class _fishDetailState extends State<FishDetail> {
  String? id; //NGAMBIL DARI ID DB
  String? type; //NGAMBIL DARI ID DB

  Future<bool> deleteFish(int id) async {
    var url = "http://10.0.2.2:3000/fishes/deleteFish";
    var response = await http.delete(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'id': id}));
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          closeManually: false,
          backgroundColor: const Color.fromARGB(255, 216, 229, 255),
          overlayColor: Colors.black,
          overlayOpacity: 0.6,
          visible: widget.user.id == widget.item.user_id,
          icon: Icons.menu,
          children: [
            //DELETE
            SpeedDialChild(
              child: const Icon(Icons.delete_forever_outlined),
              backgroundColor: Colors.red,
              onTap: () async {
                String msg = 'Fish Deleted';
                Color:
                Colors.red;
                if (await deleteFish(widget.item.fish_id)) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return fishesPages(widget.item.type, user: widget.user);
                      },
                    ),
                  );
                }
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              backgroundColor: const Color.fromARGB(255, 215, 215, 215),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return editFishPage(item: widget.item, user: widget.user);
                  },
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              //EXIT BUTTON TO LOGIN PAGE
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  //NAVIGASI KE HOME PAGE
                  onPressed: () {
                    Navigator.popUntil(
                        context, (Route<dynamic> route) => route.isFirst);
                  },
                ),
              ), //EXIT BUTTON TO LOGIN PAGE
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "${widget.item.fish_name} Detail Page",
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        //BODY
        body: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  // Image radius
                  child: Image.network(
                    widget.item.image_path,
                    fit: BoxFit.cover,
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            //AUTHOR NAME
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Text(
                      "Author: ",
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.item.author_name,
                      style: const TextStyle(
                        fontFamily: 'INTER',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            //FISH NAME

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Text(
                      "Fish Name: ",
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.item.fish_name,
                      style: const TextStyle(
                        fontFamily: 'INTER',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //FISH PRICE
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Text(
                        "Fish Price: ",
                        style: TextStyle(
                          fontFamily: 'SF',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.item.fish_price,
                        style: const TextStyle(
                          fontFamily: 'INTER',
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )),
            ),

            //FISH TYPE
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Text(
                      "Fish Type: ",
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.item.type,
                      style: const TextStyle(
                        fontFamily: 'INTER',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //FISH DESC
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Text(
                      "Fish Desc: ",
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.item.fish_desc,
                      style: const TextStyle(
                        fontFamily: 'INTER',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
