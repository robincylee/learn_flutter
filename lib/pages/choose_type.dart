import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ChooseType extends StatelessWidget {
  ScrollController _controller =
      ScrollController(initialScrollOffset: 100.0 * 5);
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
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    child: Card(
                        child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      onTap: () {
                        print("Develop navigator pushreplacement $index");
                      },
                      title: Text('The Enchanted Nightingale'),
                      subtitle: Text(
                          'Music by Julie Gable. Lyrics by Sidney Stein. Music by Julie Gable. Lyrics by Sidney Stein. Music by Julie Gable. Lyrics by Sidney Stein. Music by Julie Gable. Lyrics by Sidney Stein. Music by Julie Gable. Lyrics by Sidney Stein. Music by Julie Gable. Lyrics by Sidney Stein.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )),
                  );
                })));
  }
}

_thisMethod(BuildContext context) async {
  final result = await Navigator.pushNamed(context, '/record');
  Flushbar(
    margin: EdgeInsets.fromLTRB(150, 10, 150, 10),
    borderRadius: 10,
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
