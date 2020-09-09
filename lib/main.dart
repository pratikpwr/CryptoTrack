import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crypto_track/screens/tracker_screen.dart';
import 'package:crypto_track/models/currency_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Currencies>(
      create: (ctx) => Currencies(),
      child: MaterialApp(
        title: "CryptoTrack",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xffD933C3),
            canvasColor: const Color(0xff1c0436),
         // scaffoldBackgroundColor: const Color(0xff070219),
         // backgroundColor: const Color(0xff231454),
          cardColor: const Color(0xff3b1f50),
          accentColor: const Color(0xffd933c3)
        ),
        home: TrackerScreen(),
      ),
    );
  }
}
