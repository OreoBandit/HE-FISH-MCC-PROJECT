import 'package:fish/pages/FishesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/HomePage.dart';
import 'package:fish/components/backgrounds/background_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fish/components/util/my_carousel.dart';
import '../components/util/User.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
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
                  "Hello, ${widget.user.username}!",
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
        body: Background_home(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 25),
                // Image.asset("assets/images/he-fish-logo.png",
                //     width: size.width * 0.7),
                const Center(
                  child: Text(
                    'We Provide The Best Fishes For You.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'INTER',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: my_carousel(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Text(
                      'Our Collection of Fish',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SF',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    //BARIS BUTTON 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //BUTTON 1 - FRESHWATER
                        SizedBox(
                          height: 130,
                          width: 130,

                          //BUTTON 1 - FRESHWATER
                          child: ElevatedButton(
                            //NAVIGASI KE HOME PAGE
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return fishesPages("Fresh Water",
                                        user: widget.user);
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              primary: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/images/freshwater.jpg",
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    "FRESH WATER",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'INTER',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //BUTTON 1 - FRESHWATER

                        const SizedBox(width: 50),

                        //BUTTON 2 - SALTY WATER
                        SizedBox(
                          height: 130,
                          width: 130,
                          child: ElevatedButton(
                            //NAVIGASI KE HOME PAGE
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return fishesPages("Salty Water",
                                        user: widget.user);
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              primary: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/images/salty-water.jpg",
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    "SALTY WATER",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'INTER',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Button 2 - SALTY WATER
                      ],
                    ),

                    const SizedBox(height: 50),

                    //BARIS BUTTON 2
                    SizedBox(
                      height: 130,
                      width: 130,

                      //BUTTON 3 - MIXED WATER
                      child: ElevatedButton(
                        //NAVIGASI KE HOME PAGE
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return fishesPages("Mixed Water",
                                    user: widget.user);
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      "assets/images/mixed-water.jpg",
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Center(
                              child: Text(
                                "MIXED WATER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'INTER',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
