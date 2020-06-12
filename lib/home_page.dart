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
    "https://techcrunch.com/wp-content/uploads/2015/04/codecode.jpg",
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    "https://images.unsplash.com/photo-1538370965046-79c0d6907d47?ixlib=rb-1.2.1&w=1000&q=80",
    "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg"
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
