import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
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
    "https://cdn.vox-cdn.com/thumbor/p6q3uqBc5dwVAGvOe8ykMvDhl98=/0x0:2308x1536/1200x800/filters:focal(970x584:1338x952)/cdn.vox-cdn.com/uploads/chorus_image/image/66876122/1216250010.jpg.0.jpg"
  ];

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Peaceful protests in Portland, Oregon", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),),
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
                    Container(
                      color: Colors.white60,
                      width: 150,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas scelerisque nunc, sodales hendrerit ipsum maximus ut. Nulla eu efficitur eros, a tempus turpis.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text("Create New"),
                      color: Colors.lightGreen,
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Text("Report on this"),
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventReport()),
                            );
                          },
                        ),
                        FlatButton(
                          child: Text("Navigate to"),
                          color: Colors.lightGreen,
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text("Label"),
                          color: Colors.lightGreen,
                          onPressed: () {},
                        ),
                      ],
                    )
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
