import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'coffee_with_jane.dart';
import 'event_report.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  List<String> imageLinks = [
    "https://news.wttw.com/sites/default/files/styles/full/public/article/image-non-gallery/photo10.JPG?itok=IPAwQXD_",
    "https://img.apmcdn.org/a414fa2cff53807222f65edb0297f36fd5759f9a/uncropped/60fde1-20200529-floyd-protests-national07.jpg",
    "https://www.dailybulletin.com/wp-content/uploads/2020/05/IDB-L-PROTEST-RC-0531-18-WL-1.jpg?w=620",
    "https://cdn.vox-cdn.com/thumbor/p6q3uqBc5dwVAGvOe8ykMvDhl98=/0x0:2308x1536/1200x800/filters:focal(970x584:1338x952)/cdn.vox-cdn.com/uploads/chorus_image/image/66876122/1216250010.jpg.0.jpg",
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
            GestureDetector(
              child: Image(
                image: AssetImage("assets/map-overlay.png"),
                alignment: Alignment.bottomCenter,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoffeeWithJane()),
                );
              },
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
                                  image: AssetImage("assets/reported.png"),
                                ),
                              ),
                              Text(
                                "Virginia Beach",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        itemCount: imageLinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(fit: BoxFit.cover, image: NetworkImage(imageLinks[index])),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                      ),
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
