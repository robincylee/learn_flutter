import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "testing",
                textAlign: TextAlign.center,
              ),
              flex: 2,
            ),
            Expanded(
              child: Text("inside"),
              flex: 1,
            )
          ],
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    color: Colors.blue,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    splashColor: Colors.amber,
                    splashRadius: 45,
                    padding: EdgeInsets.all(28),
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      print("mic recooord");
                    },
                  ),
                )))
      ],
    )));
  }
}
