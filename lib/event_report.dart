import 'package:flutter/material.dart';
import 'package:report/transaction_completed.dart';

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
