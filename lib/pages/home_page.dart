import 'package:flutter/material.dart';

enum IconDisplay { star_border, star_half, star }

class HomePage extends StatelessWidget {
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
                      },
                      leading: getMethod(index),
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

getMethod(value) {
  if (value < 3) {
    return Icon(Icons.star);
  } else if (value < 6) {
    return Icon(Icons.star_half);
  } else {
    return Icon(Icons.star_border);
  }
}

// Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const ListTile(
//                 leading: Icon(Icons.album),
//                 title: Text('The Enchanted Nightingale'),
//                 subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                     child: const Text('BUY TICKETS'),
//                     onPressed: () {/* ... */},
//                   ),
//                   const SizedBox(width: 8),
//                   TextButton(
//                     child: const Text('LISTEN'),
//                     onPressed: () {/* ... */},
//                   ),
//                   const SizedBox(width: 8),
//                 ],
//               ),
//             ],
//           ),
//         )
