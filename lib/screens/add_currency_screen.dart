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
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: _cryptoController,
              onChanged: (text) {
                crypto = _cryptoController.text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Crypto Currency eg. bitcoin',
                labelStyle: GoogleFonts.poppins(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: _fiatController,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fiat Currency eg. usd',
                labelStyle: GoogleFonts.poppins(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                fiat = _fiatController.text;
              },
            ),
            SizedBox(
              height: 18,
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<Currencies>(context, listen: false)
                    .addNewCurrency(crypto, fiat);
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.symmetric(horizontal: 52, vertical: 12),
              color: Theme.of(context).accentColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Done',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
