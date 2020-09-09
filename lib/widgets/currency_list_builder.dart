import 'package:crypto_track/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrencyListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 120,
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          return currencies.currencies.isEmpty ? Center(
            child: Text("Add Currency to track".toUpperCase() , style: GoogleFonts.poppins(color: Colors.white , fontSize: 18),),
          ):ListView.builder(
              itemCount: currencies.currencies.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(currencies.currencies[index].cryptoInfo.id +
                      currencies.currencies[index].fiat +
                      currencies.currencies[index].cryptoInfo.currentPrice),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    Provider.of<Currencies>(context, listen: false)
                        .removeCurrency(currencies.currencies[index].crypto,
                        currencies.currencies[index].fiat);
                  },
                  confirmDismiss: (direction) {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Are you sure?',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            content: Text(
                                'Do you want to remove the item from cart?',
                                style:
                                GoogleFonts.poppins(color: Colors.white)),
                            backgroundColor: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('No',
                                      style: GoogleFonts.poppins(
                                          color:
                                          Theme.of(context).accentColor))),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text('Yes',
                                      style: GoogleFonts.poppins(
                                          color:
                                          Theme.of(context).accentColor))),
                            ],
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xff3b1f50),
                        borderRadius: BorderRadius.circular(20)),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              currencies.currencies[index].cryptoInfo.image,
                              height: 65,
                              width: 65,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currencies.currencies[index].cryptoInfo.symbol
                                      .toUpperCase(),
                                  style: GoogleFonts.mukta(
                                      color: Colors.white, fontSize: 28),
                                ),
                                Text(
                                  currencies.currencies[index].cryptoInfo.name
                                      .toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              currencies.currencies[index].fiat.toUpperCase(),
                              style: GoogleFonts.poppins(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 18),
                            ),
                            Text(
                              currencies
                                  .currencies[index].cryptoInfo.currentPrice,
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
