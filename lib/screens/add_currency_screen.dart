import 'package:crypto_track/main.dart';
import 'package:crypto_track/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCurrencyScreen extends StatelessWidget {
  String crypto;
  String fiat;
  TextEditingController _cryptoController = new TextEditingController();
  TextEditingController _fiatController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.fromLTRB(8, 28, 8, 0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Text(
                  'Add Currency',
                  style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            TextField(
              controller: _cryptoController,
              decoration: InputDecoration(
                hintText: 'Enter crypto currency',
                focusColor: Colors.white,
                fillColor: Colors.white,
              ),
              onChanged: (text) {
                crypto = _cryptoController.text;
              },
            ),
            TextField(
              controller: _fiatController,
              decoration: InputDecoration(
                hintText: 'Enter fiat currency',
              ),
              onChanged: (text) {
                fiat = _fiatController.text;
              },
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<Currencies>(context, listen: false)
                    .addNewCurrency(crypto, fiat);
                /* Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));*/
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            )
          ],
        ),
      ),
    );
  }
}
