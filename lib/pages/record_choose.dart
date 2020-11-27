import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/user_stories.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum categoryType { comedy, tragedy, rebirth, magic, adventure }

class RecordChoose extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  ScrollController _controller = ScrollController();
  // ScrollController(initialScrollOffset: 100.0 * 5);

  List<UserStory> tmp = [
    UserStory(
        'Lagoona Mandetta',
        'Great escape of Guinsea. A story of mysterious sea exploration in a world full of magical creatures. What Guinsea doesn\'t know, the mysterious sea was actually a twisted dimension that connected to the future',
        new DateTime.now(),
        categoryType.adventure.index),
    UserStory(
        'Runner',
        'A world that nothing is at rest. Everythings move till the day it vanish completely but not Guin. Move Guin, MOVE!',
        DateTime(DateTime.now().year - 1, DateTime.now().month + 5,
            DateTime.now().day - 30),
        categoryType.comedy.index),
    UserStory(
        'I Don\'t Magic',
        'Cooper a natural born without mana. Story of him changing how a normal magic world the way it would had operated',
        DateTime(DateTime.now().year - 2, DateTime.now().month - 4,
            DateTime.now().day),
        categoryType.magic.index),
    UserStory(
        'Sad World 2102',
        'No robots, no mobile phone, no vehicle, no electricity! Human society did not progress into a high end living environment that they used to claim!',
        DateTime(DateTime.now().year - 10, DateTime.now().month,
            DateTime.now().day - 40),
        categoryType.tragedy.index)
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              _thisMethod(context);
            },
          ),
        ),
        body: new Center(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
                controller: _controller,
                itemCount: tmp.length, //tmp data
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    child: Card(
                        child: ListTile(
                      leading: _getCatCon(tmp[index].category),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      onTap: () {
                        print("Develop navigator pushreplacement $index");
                        Navigator.pushNamed(context, '/record_continue',
                            arguments: tmp[index]);
                      },
                      title: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              tmp[index].title, //tmp data title
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              tmp[index].date.day.toString() +
                                  '/' +
                                  tmp[index].date.month.toString() +
                                  '/' +
                                  tmp[index]
                                      .date
                                      .year
                                      .toString(), //tmp data date
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(
                        tmp[index].desc, //tmp data desc
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                  );
                })));
  }
}

_getCatCon(value) {
  switch (categoryType.values[value]) {
    case categoryType.adventure:
      return Icon(Icons.anchor_rounded);
    case categoryType.magic:
      return Icon(Icons.local_fire_department_rounded);
    case categoryType.comedy:
      return Icon(Icons.mood_rounded);
    case categoryType.tragedy:
      return Icon(Icons.sentiment_very_dissatisfied);
    default:
      {
        return Icon(Icons.cached);
      }
  }
}

_thisMethod(BuildContext context) async {
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
