// To parse this JSON data, do
//
//     final rate = rateFromMap(jsonString);

import 'dart:convert';

List<CryptoInfoModel> rateFromMap(String str) =>
    List<CryptoInfoModel>.from(json.decode(str).map((x) => CryptoInfoModel.fromMap(x)));

String rateToMap(List<CryptoInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CryptoInfoModel {
  CryptoInfoModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.lastUpdated,
  });

  String id;
  String symbol;
  String name;
  String image;
  String currentPrice;
  DateTime lastUpdated;

  factory CryptoInfoModel.fromMap(Map<String, dynamic> json) => CryptoInfoModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toString(),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "last_updated": lastUpdated.toIso8601String(),
      };
}
