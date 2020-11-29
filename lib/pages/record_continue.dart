import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_flutter/models/user_stories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordContinue extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> storyTable = [
    'Run Guin',
    'Moving is believing',
    'No don\'t stop there',
    'Bye Guin'
  ];
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final UserStory story = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
        appBar: AppBar(
          title: Text(story.title),
        ),
        floatingActionButton: Container(
          height: MediaQuery.of(context).size.width * 0.19,
          width: MediaQuery.of(context).size.width * 0.19,
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 40,
            ),
            backgroundColor: Colors.amber[300],
            onPressed: () {
              _addStory(context);
            },
          ),
        ),
        body: new Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
              flex: 3,
              child: Container(
                  color: Colors.black26,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          size: 60,
                        ),
                      ]))),
          Expanded(
              flex: 7,
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  controller: _controller,
                  itemCount: storyTable.length, //tmp data
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60,
                      child: Card(
                          child: ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.person_rounded),
                          onPressed: () {
                            print("person button pressed");
                          },
                        ),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        onTap: () {
                          print("Develop navigator pushreplacement $index");
                        },
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(storyTable[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(24))),
                            ),
                            // Expanded(
                            //   flex: 3,
                            //   child: Text(
                            //     tmp[index].date.day.toString() +
                            //         '/' +
                            //         tmp[index].date.month.toString() +
                            //         '/' +
                            //         tmp[index]
                            //             .date
                            //             .year
                            //             .toString(), //tmp data date
                            //     textAlign: TextAlign.right,
                            //   ),
                            // )
                          ],
                        ),
                        // subtitle: Text(
                        //   tmp[index].desc, //tmp data desc
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      )),
                    );
                  })),
        ]));
  }
}

_addStory(BuildContext context) async {
  final result = await Navigator.pushNamed(context, '/record');
  Flushbar(
    margin: EdgeInsets.fromLTRB(150, 10, 150, 10),
    animationDuration: Duration(seconds: 0),
    blockBackgroundInteraction: false,
    backgroundColor: Colors.black38,
    borderRadius: 8,
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$result', style: TextStyle(color: Colors.white)),
      ],
    ),
    duration: Duration(seconds: 2),
  )..show(context);
}
