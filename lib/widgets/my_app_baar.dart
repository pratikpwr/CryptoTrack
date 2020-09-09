import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CryptoTrack',
                style: GoogleFonts.poppins(fontSize: 36, color: Colors.white),
              ),
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
          ),
          /*Text(
            'Track your crypto-currency here'
                .toUpperCase(),
            style: GoogleFonts.poppins(
                color: Theme.of(context).accentColor,
                fontSize: 14),
          ),*/
          Text(
            'Swipe Left to Untrack Currency'.toUpperCase(),
            style: GoogleFonts.poppins(
                color: Theme.of(context).accentColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}