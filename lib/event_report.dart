import 'package:flutter/material.dart';
import 'package:report/transaction_completed.dart';
import 'package:http/http.dart';

class EventReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: IconButton(
          iconSize: 50,
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            _doTransaction();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransactionCompleted()),
            );
          },
        )
      ),
    );
  }
}
String json;
_doTransaction() async {
  String url = 'https://uploaded-report-api.herokuapp.com/';
  Response response = await get(url);
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  json = response.body;
  print(json);
}