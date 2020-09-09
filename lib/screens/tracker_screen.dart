import 'package:crypto_track/models/currency_model.dart';
import 'package:crypto_track/widgets/currency_list_builder.dart';
import 'package:crypto_track/widgets/my_app_baar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../screens/add_currency_screen.dart';

class TrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.fromLTRB(8, 24, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [MyAppBar(), CurrencyListBuilder()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddCurrencyScreen();
          }));
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}

