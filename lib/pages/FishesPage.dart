import 'dart:convert';
import 'package:fish/components/backgrounds/background.dart';
import 'package:fish/components/backgrounds/background_home.dart';
import 'package:fish/components/util/customized_listview.dart';
import 'package:fish/pages/fishDetail.dart';
import 'package:fish/pages/insertFish.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fish/components/backgrounds/background.dart';
import 'package:fish/components/util/fishes.dart';
import 'package:fish/components/util/fishes_type.dart';
import '../components/util/User.dart';
import '../components/util/cirlceIndicator.dart';

class fishesPages extends StatefulWidget {
  final User user;
  String collections;

  fishesPages(this.collections, {super.key, required this.user});

  @override
  State<fishesPages> createState() => _fishesPagesState();
}

class _fishesPagesState extends State<fishesPages>
    with TickerProviderStateMixin {
  //NEW ADDITION
  late TabController tabController;
  late Future<List<fishes>> fishdata;

  Future<List<fishes>> getallfish() async {
    List<fishes> itemList = [];
    itemList.clear();
    String url = "http://10.0.2.2:3000/fishes/";
    var respond = await http.get(Uri.parse(url));
    var res = jsonDecode(respond.body);

    for (var i in res) {
      itemList.add(fishes.fromJSON(i));
    }
    return itemList;
  }
  //NEW ADDITION

  @override
  void initState() {
    super.initState();
    fishdata = getallfish();
    tabController = TabController(length: 3, vsync: this);
    if (widget.collections == "Fresh Water") {
      tabController.animateTo(0);
    } else if (widget.collections == "Salty Water") {
      tabController.animateTo(1);
    } else {
      tabController.animateTo(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 216, 229, 255),
                // backgroundColor: const Colors.,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return insertFish(user: widget.user);
                      },
                    ),
                  );
                },

                child: const Icon(
                  Icons.add,
                  size: 50,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          //APPBAR
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
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "FISHES",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: CircleTabIndicator(color: Colors.black, radius: 3),
              tabs: const [
                Tab(
                  child: Text(
                    'Fresh Water',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Salty Water',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Mixed Water',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ), //APPBAR

          //BODY
          body: TabBarView(
            controller: tabController,
            children: [
              //FRESHWATER FISH
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: FutureBuilder(
                    future: fishdata,
                    builder: (context, snapshot) {
                      var fishList = snapshot.data as List<fishes>;
                      var filtered = fishList.where((i) => i.fish_type_ID == 1);
                      // if (snapshot.hasData) {
                      if (filtered.isEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "No fishes? :(((",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ));
                      } else {
                        return ListView(
                          children: filtered
                              .map((e) => customizedListView(
                                  fishItem: e, user: widget.user))
                              .toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
              //FRESH WATER

              //SALTY WATER
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: FutureBuilder(
                    future: fishdata,
                    builder: (context, snapshot) {
                      var fishList = snapshot.data as List<fishes>;
                      var filtered = fishList.where((i) => i.fish_type_ID == 2);
                      // if (snapshot.hasData) {
                      if (filtered.isEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "No fishes? :(((",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ));
                      } else {
                        return ListView(
                          children: filtered
                              .map((e) => customizedListView(
                                  fishItem: e, user: widget.user))
                              .toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
              //SALTY WATER

              //MIXED
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: FutureBuilder(
                    future: fishdata,
                    builder: (context, snapshot) {
                      var fishList = snapshot.data as List<fishes>;
                      var filtered = fishList.where((i) => i.fish_type_ID == 3);
                      // if (snapshot.hasData) {
                      if (filtered.isEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "No fishes? :(((",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ));
                      } else {
                        return ListView(
                          children: filtered
                              .map((e) => customizedListView(
                                  fishItem: e, user: widget.user))
                              .toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
              //MIXED
            ],
          ),
        ),
      ),
    );

    //SALTY WATER FISH

    //MIXED WATER FISH
  }
}
