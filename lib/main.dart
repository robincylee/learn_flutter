import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/pages/record_choose.dart';
import 'package:learn_flutter/pages/record_continue.dart';
import 'package:learn_flutter/pages/listen_page.dart';
import 'package:learn_flutter/services/check_permission.dart';
import './pages/record_page.dart';
import 'pages/search_screen.dart';
import 'pages/profile_page.dart';
import 'pages/activity_history.dart';
import 'pages/home_page.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    // DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
      // home: WhatsAppUiClone(),
      title: 'My Story App',
      theme: ThemeData(
        primaryColor: Color(0xFF04375D),
        accentColor: Color(0xFF00935C),
      ),
      routes: {
        '/': (context) => WhatsAppUiClone(),
        '/record': (context) => RecordPage(),
        '/start': (context) => RecordChoose(),
        '/record_continue': (context) => RecordContinue()
      }));
}

class WhatsAppUiClone extends StatefulWidget {
  _WhatsAppUiClone createState() => _WhatsAppUiClone();
}

class _WhatsAppUiClone extends State<WhatsAppUiClone>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _getPermission();
    _tabcontroller = TabController(
      initialIndex: 1, //tmp properties
      vsync: this,
      length: 3,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(540, 960), allowFontScaling: false);

    // data = ModalRoute.of(context).settings.arguments;
    // print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('My Story App'),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabcontroller,
          indicatorColor: Colors.white,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            // Tab(
            //   icon: Icon(Icons.search),
            // ),
            Tab(icon: Icon(Icons.mic)),
            // Tab(icon: Icon(Icons.history)),
            Tab(icon: Icon(Icons.perm_identity)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: <Widget>[
          HomePage(),
          // SearchScreen(),
          RecordChoose(),
          // ActivityHistory(),
          ProfilePage()
        ],
      ),
    );
  }

  void _getPermission() async {
    bool hasPermission = await checkPermission();
  }
}
