import 'dart:math';

import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(),
        body: new Center(
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
                    child: Scaffold(
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerFloat,
                      floatingActionButton: Container(
                        height: MediaQuery.of(context).size.width * 0.19,
                        width: MediaQuery.of(context).size.width * 0.19,
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.mic,
                            size: 40,
                          ),
                          backgroundColor: Colors.amber[300],
                          onPressed: () {
                            Navigator.pop(context, getRandom());
                          },
                        ),
                      ),
                      // margin: EdgeInsets.all(10),
                      // decoration: const ShapeDecoration(
                      //   color: Colors.blue,
                      //   shape: CircleBorder(),
                      // ),

                      // child: IconButton(
                      //   splashColor: Colors.amber,
                      //   splashRadius: 45,
                      //   padding: EdgeInsets.all(28),
                      //   icon: Icon(Icons.mic),
                      //   onPressed: () {
                      //     Navigator.pop(context, getRandom());
                      //   },
                      // ),
                    )))
          ],
        )));
  }
}

getRandom() {
  int lucky = Random().nextInt(3);
  switch (lucky) {
    case 0:
      return 'Success';
    case 1:
      return 'Fail';
    case 2:
      return 'No changes';
  }
}
