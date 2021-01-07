import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
    var rate;
    Future getdata(String bitcur,String cur) async {
    final url='https://rest.coinapi.io/v1/exchangerate/$bitcur/$cur?apikey=01675C65-BA0F-4E2E-A0A8-F26F7105F559';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
    var decoderate = data['rate'];
      rate=decoderate.round();
      print(rate);
      return rate;

    }
    else
      print(response.statusCode);
  }


}