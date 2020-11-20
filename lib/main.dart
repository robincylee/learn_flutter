import 'package:flutter/material.dart';
import './pages/record_page.dart';
import 'pages/search_screen.dart';
import 'pages/profile_page.dart';
import 'pages/activity_history.dart';
import 'pages/home_page.dart';
//import

void main() {
  runApp(new MaterialApp(
    home: new WhatsAppUiClone(),
    title: 'WhatsApp',
    theme: new ThemeData(
      primaryColor: new Color(0xFF04375D),
      accentColor: new Color(0xFF00935C),
    ),
  ));
}

class WhatsAppUiClone extends StatefulWidget {
  _WhatsAppUiClone createState() => new _WhatsAppUiClone();
}

class _WhatsAppUiClone extends State<WhatsAppUiClone>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = new TabController(
      vsync: this,
      length: 5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text('WhatsApp'),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabcontroller,
          indicatorColor: Colors.white,
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.search),
            ),
            new Tab(icon: new Icon(Icons.mic)),
            new Tab(icon: new Icon(Icons.history)),
            new Tab(icon: new Icon(Icons.perm_identity)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabcontroller,
        children: <Widget>[
          new HomePage(),
          new SearchScreen(),
          new RecordPage(),
          new ActivityHistory(),
          new ProfilePage()
        ],
      ),
    );
  }
}
