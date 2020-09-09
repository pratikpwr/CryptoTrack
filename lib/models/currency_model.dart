import 'package:crypto_track/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Currency {
  String crypto;
  String fiat;
  CryptoInfoModel cryptoInfo;

  Currency({this.crypto, this.fiat, this.cryptoInfo});
}

class Currencies with ChangeNotifier {
  List<Currency> _currencies = [];

  List<Currency> get currencies {
    return [..._currencies];
  }

  Future<void> addNewCurrency(String crypto, String fiat) async {
    CryptoInfoModel _cryptoInfo = await fetchData(crypto, fiat);

    final newCurrency =
        Currency(crypto: crypto, fiat: fiat, cryptoInfo: _cryptoInfo);
    _currencies.add(newCurrency);
    notifyListeners();
  }

  Future<CryptoInfoModel> fetchData(String crypto, String fiat) async {
    var url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$fiat&ids=$crypto&order=market_cap_desc&per_page=100&page=1&sparkline=false%22%20-H%20%22accept:%20application/json';

    try {
      var response = await http.get(url);

      var data = json.decode(response.body)[0];

      CryptoInfoModel cryptoInfoModel = CryptoInfoModel.fromMap(data);

      return cryptoInfoModel;
    } catch (error) {
      throw error;
    }
  }

  void removeCurrency(String crypto, String fiat) {
    final removeCurrency = Currency(crypto: crypto, fiat: fiat);
    _currencies.remove(removeCurrency);
    notifyListeners();
  }
}
