import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'event_report.dart';

class CoffeeWithJane extends StatefulWidget {
  @override
  _CoffeeWithJaneState createState() => _CoffeeWithJaneState();
}

class _CoffeeWithJaneState extends State<CoffeeWithJane> {
  GoogleMapController mapController;
  List<String> imageLinks = [
    "https://news.wttw.com/sites/default/files/styles/full/public/article/image-non-gallery/photo10.JPG?itok=IPAwQXD_",
    "https://img.apmcdn.org/a414fa2cff53807222f65edb0297f36fd5759f9a/uncropped/60fde1-20200529-floyd-protests-national07.jpg",
    "https://cdn.discordapp.com/attachments/720674902868361267/721048110532526140/unknown.png",
  ];

  final LatLng _center = const LatLng(36.780364, -76.086723);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            AbsorbPointer(
              absorbing: true,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
            Image(
              image: AssetImage("assets/map-overlay.png"),
              alignment: Alignment.bottomCenter,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/avatar.png"),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Image(
                                  image: AssetImage("assets/unreported.png"),
                                ),
                              ),
                              Text(
                                "Breakfast With Jane",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(scrollDirection: Axis.horizontal, children: [
                        Container(
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(fit: BoxFit.cover, image: NetworkImage("https://d.newsweek.com/en/full/1531241/national-coffee-day-2019-deals.jpg")),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(fit: BoxFit.cover, image: NetworkImage("https://cdn.mos.cms.futurecdn.net/2Nxaff2rdwTTzS8MQx47b9-320-80.jpg")),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventReport()),
                            );
                          },
                          child: Container(
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(fit: BoxFit.cover, image: AssetImage("assets/add-report.png")),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("add")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("browse"))
        ]),
      ),
    );
  }
}
