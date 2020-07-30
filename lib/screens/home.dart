import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:galleria/globalwidgets.dart';
import 'package:galleria/screens/featuredDetails.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      darkMode = WidgetsBinding.instance.window.platformBrightness
              .toString()
              .contains("dark")
          ? true
          : false;
      setState(() {});
    }
  }

  List<PaletteColor> colors;
  Color domininant = Colors.red;

  List<String> imageCaption = [
    "Watch Dogs",
    "Ones' Justice",
    "Fifa 20",
    "Assasin's Creed",
    "Watch Dogs",
    "Ones' Justice",
    "Fifa 20",
    "Assasin's Creed",
    "Watch Dogs",
    "Ones' Justice",
    "Fifa 20",
    "Assasin's Creed"
  ];

  //Bottombar variables
  Color homeColor = Colors.red;
  Color settingsColor = darkMode ? Colors.black : Colors.white;
  Color addColor = darkMode ? Colors.black : Colors.white;
  Color cartColor = darkMode ? Colors.black : Colors.white;
  String homeText = "Home";
  String cartText = "";
  String addText = "";
  String settingsText = "";

  @override
  void initState() {
    getImagePallete("assets/images/img0.jpg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
//          AnimatedContainer(
//            duration: Duration(milliseconds: 500),
//            height: MediaQuery.of(context).size.height,
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                colors: [
//                  domininant,
//                  Colors.white,
//                  Colors.white,
//
//                ]
//              )
//            ),
//          ),
            Container(
                margin: EdgeInsets.only(top: 80),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Electrical",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 7,
                                        width: 7,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.red),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Furniture",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 7,
                                        width: 7,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: darkMode
                                                ? Colors.black
                                                : Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Plumbing",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 7,
                                        width: 7,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: darkMode
                                                ? Colors.black
                                                : Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: false,
                                height: 450,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 1500),
                                autoPlayCurve: Curves.fastOutSlowIn,
//                                onPageChanged: ((i, changed) {
//
//                                }),
                                enableInfiniteScroll: false,
                                enlargeCenterPage: true,
                                viewportFraction: 0.6,
                                pauseAutoPlayOnTouch: true,
                                aspectRatio: 20 / 9,
                                initialPage: 1,
                              ),
                              items: [1, 2, 3, 4, 5].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        FeaturedDetails(
                                                          image:
                                                              "assets/images/img$i.jpg",
                                                          title:
                                                              imageCaption[i],
                                                          imageTag: "image$i",
                                                        )));
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Column(
                                            children: [
                                              Text(
                                                imageCaption[i],
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: darkMode
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Hero(
                                                tag: "image$i",
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Container(
                                                    height: 320,
                                                    child: Image.asset(
                                                      "assets/images/img$i.jpg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 80),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.grain),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.yellow),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.purple),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),

            appBar("Galle", "ria", Icons.search, Icons.details),

            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: darkMode ? Colors.black : Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bottomBarSelection(0);
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: homeColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.view_carousel),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              homeText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkMode ? Colors.white : Colors.black),
                            )
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomBarSelection(1);
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: cartColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.shopping_cart),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              cartText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkMode ? Colors.white : Colors.black),
                            )
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomBarSelection(2);
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: addColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              addText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkMode ? Colors.white : Colors.black),
                            )
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomBarSelection(3);
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: settingsColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.settings),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              settingsText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkMode ? Colors.white : Colors.black),
                            )
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        duration: Duration(milliseconds: 200),
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

  Future<Color> getImagePallete(String imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(AssetImage(imageProvider));

    domininant = paletteGenerator.dominantColor.color;
    setState(() {});
    return paletteGenerator.dominantColor.color;
  }

  void bottomBarSelection(int i) {
    if (i == 0) {
      homeColor = Colors.red.withOpacity(1);
      homeText = "Home";

      cartColor = Colors.transparent;
      cartText = "";
      addColor = Colors.transparent;
      addText = "";
      settingsColor = Colors.transparent;
      settingsText = "";

      setState(() {});
    }
    if (i == 1) {
      cartColor = Colors.red.withOpacity(1);
      cartText = "Cart";

      homeColor = Colors.transparent;
      homeText = "";
      addColor = Colors.transparent;
      addText = "";
      settingsColor = Colors.transparent;
      settingsText = "";

      setState(() {});
    }
    if (i == 2) {
      addColor = Colors.red.withOpacity(1);
      addText = "Add";

      homeColor = Colors.transparent;
      homeText = "";
      cartColor = Colors.transparent;
      cartText = "";
      settingsColor = Colors.transparent;
      settingsText = "";

      setState(() {});
    }

    if (i == 3) {
      settingsColor = Colors.red.withOpacity(1);
      settingsText = "Settings";

      homeColor = darkMode ? Colors.black : Colors.white;
      homeText = "";
      addColor = darkMode ? Colors.black : Colors.white;
      addText = "";
      cartColor = darkMode ? Colors.black : Colors.white;
      cartText = "";

      setState(() {});
    }
  }
}
