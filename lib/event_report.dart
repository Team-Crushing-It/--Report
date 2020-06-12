import 'package:flutter/material.dart';
import 'package:report/transaction_completed.dart';
import 'package:http/http.dart';
import 'camera_screen.dart';
import 'globals.dart' as globals;

class EventReport extends StatefulWidget {
  @override
  _EventReportState createState() => _EventReportState();
}

class _EventReportState extends State<EventReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraScreen()
//      backgroundColor: Colors.grey,
//      body: Stack(
//        alignment: Alignment.bottomCenter,
//        children: [
//          Container(
//            height: 70,
//            color: Colors.grey[800],
//          ),
//          Container(
//            padding: const EdgeInsets.all(7),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(500),
//              color: Colors.white
//            ),
//            width: 68,
//            height: 68,
//          ),
//          Container(
//            alignment: Alignment.bottomCenter,
//            child: IconButton(
//              iconSize: 50,
//              icon: Icon(Icons.camera_alt),
//              onPressed: () {
//                _doTransaction();
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => TransactionCompleted()),
//                );
//              },
//            )
//          ),
//        ],
//      ),
    );
  }
}



_doTransaction() async {
  String url = 'https://uploaded-report-api.herokuapp.com/';
  Response response = await get(url);
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  globals.gjson=json;
  print(json);
  print(globals.gjson);
}