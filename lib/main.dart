import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> imgList = [
  'https://media.istockphoto.com/photos/blank-plastic-credit-cards-front-view-mockup-picture-id1330497623?s=612x612',
  'https://media.istockphoto.com/photos/close-up-male-hand-and-levitating-template-mockup-bank-credit-card-picture-id1300003353?s=612x612',
  'https://media.istockphoto.com/photos/close-up-female-hand-holds-levitating-template-mockup-bank-credit-picture-id1262298956?s=612x612',
  'https://media.istockphoto.com/photos/african-american-female-hand-holds-levitating-template-mockup-bank-picture-id1358946700?s=612x612',
  'https://media.istockphoto.com/photos/gold-credit-card-in-woman-hand-on-dark-background-picture-id1038675516?s=612x612',
  'https://media.istockphoto.com/photos/consumer-friendly-marketing-closeup-of-businessman-hand-holding-card-picture-id1224768495?s=612x612'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarNavBar(),
    );
  }
}

class BelajarNavBar extends StatefulWidget {
  @override
  _BelajarNavBarState createState() => _BelajarNavBarState();
}

class _BelajarNavBarState extends State<BelajarNavBar> {
  int _selectedNavbar = 0;
  var _pages = <Widget>[
    Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              SizedBox(height: 30),
              //appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Good Morning , John!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.history,
                    ),
                  ),
                ]),
              ),

              // SizedBox(height: 25),
              // // card
              // SizedBox(height: 50),
              Container(
                height: 199,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(200, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                ),
              ),

              // Transaction Section
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
                child: Text(
                  'Transaction Histories',
                  style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(children: [
                    ListTile(leading: Image.network('https://cdn-icons-png.flaticon.com/512/563/563284.png'), title: Text("Market bills", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("December 28, 2021")),
                    ListTile(leading: Image.network('https://toppng.com/public/uploads/thumbnail/supermarket-cctv-icon-supermarket-ico-11563033623cvqtsfy7xz.png'), title: Text("Supermarket bills", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("December 28, 2021")),
                    ListTile(leading: Image.network('https://cdn-icons-png.flaticon.com/512/3700/3700434.png'), title: Text("Store bills", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("December 28, 2021")),
                    ListTile(leading: Image.network('https://cdn-icons-png.flaticon.com/512/93/93158.png'), title: Text("Wifi bills", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("December 28, 2021")),
                    ListTile(leading: Image.network('https://icon-library.com/images/electricity-icon-png/electricity-icon-png-23.jpg'), title: Text("electricity bills", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("December 28, 2021"))
                  ])),
            ]),
          ),
        )),
    Icon(Icons.assessment, size: 150, color: Colors.grey),
    Icon(Icons.add, size: 150, color: Colors.grey),
    Icon(Icons.circle_notifications_rounded, size: 150, color: Colors.grey),
    Icon(Icons.account_box_outlined, size: 150, color: Colors.grey),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: _pages.elementAt(_selectedNavbar)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: (''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: (''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: (''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications_rounded),
            label: (''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: (''),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
