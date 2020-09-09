import 'package:crypto_track/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrencyListBuilder extends StatelessWidget {
  const CurrencyListBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          return ListView.builder(
              itemCount: currencies.currencies.length,
              itemBuilder: (context, index) {
                return Container(
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
                            height: 70,
                            width: 70,
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
                );
              });
        },
      ),
    );
  }
}
