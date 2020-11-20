import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Center(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
      return new Card(
          child: const ListTile(
        leading: const Icon(Icons.album),
        title: const Text('The Enchanted Nightingale'),
        subtitle: const Text(
          'Music by Julie Gable. Lyrics by Sidney Stein.',
        ),
      ));
    })));
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
