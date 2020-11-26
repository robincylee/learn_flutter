import 'package:flutter/material.dart';

class ChooseType extends StatelessWidget {
  ScrollController _controller =
      ScrollController(initialScrollOffset: 100.0 * 5);
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: ListView.builder(
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
                        Navigator.pushNamed(context, '/record');
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
