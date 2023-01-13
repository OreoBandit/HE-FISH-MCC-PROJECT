import 'package:fish/components/backgrounds/background.dart';
import 'package:fish/components/backgrounds/background_home.dart';
import 'package:fish/components/util/customized_listview.dart';
import 'package:fish/pages/fishDetail.dart';
import 'package:fish/pages/insertFish.dart';
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
  late TabController tabController;
  List<fishes> freshwaterFishes = [];
  List<fishes> saltywaterFishes = [];
  List<fishes> mixedwaterFishes = [];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
    if (widget.collections == "Fresh Water") {
      tabController.animateTo(0);
    } else if (widget.collections == "Salty Water") {
      tabController.animateTo(1);
    } else {
      tabController.animateTo(2);
    }

    freshwaterFishes.add(
      fishes(
        id: 123,
        user_id: 501,
        fish_type_ID: 1,
        author_id: 501,
        fish_name: "Koi",
        fish_desc: "crazy fresh water mf",
        fish_price: "Rp3.500.000",
        image_path: "assets/images/koi 1.jpg",
        author_name: widget.user.username,
        fish_type: "Fresh Water",
      ),
    );

    freshwaterFishes.add(
      fishes(
        id: 124,
        user_id: 501,
        author_id: 501,
        fish_type_ID: 1,
        fish_name: "Koi - 2",
        fish_desc: "crazy fresh water mf",
        fish_price: "Rp3.500.000",
        image_path: "assets/images/koi 1.jpg",
        author_name: widget.user.username,
        fish_type: "Fresh Water",
      ),
    );

    saltywaterFishes.add(
      fishes(
          id: 125,
          user_id: 501,
          author_id: 501,
          fish_type_ID: 2,
          fish_name: "Salty fish 1",
          fish_desc: "crazy salty water mf",
          fish_price: "Rp3.500.000",
          image_path: "assets/images/koi 1.jpg",
          author_name: widget.user.username,
          fish_type: "Salty Water"),
    );

    mixedwaterFishes.add(
      fishes(
          id: 126,
          user_id: 501,
          author_id: 501,
          fish_type_ID: 3,
          fish_name: "mixed fish 1",
          fish_desc: "crazy Mixed water mf",
          fish_price: "Rp3.500.000",
          image_path: "assets/images/koi 1.jpg",
          author_name: widget.user.username,
          fish_type: "Mixed Water"),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<fishes> freshwaterFishes = [
      fishes(
        id: 123,
        user_id: 501,
        fish_type_ID: 1,
        author_id: 501,
        fish_name: "Koi",
        fish_desc: "crazy fresh water mf",
        fish_price: "Rp3.500.000",
        image_path: "assets/images/koi 1.jpg",
        author_name: widget.user.username,
        fish_type: "Fresh Water",
      ),
      fishes(
        id: 124,
        user_id: 501,
        author_id: 501,
        fish_type_ID: 1,
        fish_name: "Koi - 2",
        fish_desc: "crazy fresh water mf",
        fish_price: "Rp3.500.000",
        image_path: "assets/images/koi 1.jpg",
        author_name: widget.user.username,
        fish_type: "Fresh Water",
      ),
      fishes(
        id: 124,
        user_id: 501,
        author_id: 501,
        fish_type_ID: 1,
        fish_name: "Koi - 2",
        fish_desc: "crazy fresh water mf",
        fish_price: "Rp3.500.000",
        image_path: "assets/images/koi 1.jpg",
        author_name: widget.user.username,
        fish_type: "Fresh Water",
      ),
    ];
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
                          // return fishDetail("Mixed Water", user: widget.user);
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
                    child: ListView.builder(
                      itemCount: freshwaterFishes.length,
                      itemBuilder: (context, index) {
                        return customizedListView(
                          fishItem: freshwaterFishes[index],
                          user: widget.user,
                        );
                      },
                    ),
                  ),
                ),

                //SALTY WATER FISH
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: saltywaterFishes.length,
                      itemBuilder: (context, index) {
                        return customizedListView(
                          fishItem: saltywaterFishes[index],
                          user: widget.user,
                        );
                      },
                    ),
                  ),
                ),

                //MIXED WATER FISH
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: mixedwaterFishes.length,
                      itemBuilder: (context, index) {
                        return customizedListView(
                          fishItem: mixedwaterFishes[index],
                          user: widget.user,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ) //BODY
            ),
      ),
    );
  }
}
