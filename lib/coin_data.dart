import 'dart:convert';
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
  'ZAR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'E66641F5-77C4-49B3-83E0-4E24C1BADC05';
const coinsExchangeRate = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';

class CoinData {
  //Create the asynchronous method getCoinData() that returns a Future(the price data)
  Future getCoinData(String selectedCurrency) async {
    //create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.

    String requestURL = '&coinAPIURL/BTC/USD?apikey=&apiKey';
    //make a GET request to the URL and wait for the response
    http.Response response = await http.get(requestURL as Uri);

    print(response);

    //check that the request was successful
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      //handle any errors that occur during the request
      print(response.statusCode);

      //throw an error if the request fails
      throw 'Problem with the get request';
    }
  }
}
