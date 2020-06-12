import 'package:flutter/material.dart';
import 'package:report/event_report.dart';

class TransactionCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: NetworkImage("https://www.mpdrg.com/wp-content/uploads/2017/08/congratulations.ico")),
            Text(
              "Thanks for reporting on Peaceful Protests in Portland, Oregon!",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            Text("You earned +15pts\nYour current balance is $json", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30), textAlign: TextAlign.center,),
            FlatButton(
              child: Text(
                "Return to map",
                style: TextStyle(fontSize: 18),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
