import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = '';
//use your api from coinapi.io in here
const coinURL = 'https://rest.coinapi.io/v1/exchangerate';

class GetCoinData {
  String selectedCurrency;
  GetCoinData(this.selectedCurrency);
  Future<dynamic> getBTCdata() async {
    dynamic btcWorth;
    http.Response response =
        await http.get('$coinURL/BTC/$selectedCurrency?apikey=$apiKey');
    print(response.statusCode);
    var data = jsonDecode(response.body);
    btcWorth = data['rate'];
    return btcWorth;
  }

  Future<dynamic> getETHdata() async {
    dynamic ethWorth;
    http.Response response =
        await http.get('$coinURL/ETH/$selectedCurrency?apikey=$apiKey');
    var data = jsonDecode(response.body);
    ethWorth = data['rate'];
    return ethWorth;
  }

  Future<dynamic> getLTCdata() async {
    dynamic ltcWorth;
    http.Response response =
        await http.get('$coinURL/LTC/$selectedCurrency?apikey=$apiKey');
    var data = jsonDecode(response.body);
    ltcWorth = data['rate'];
    return ltcWorth;
  }
}
