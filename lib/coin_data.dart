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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'E66641F5-77C4-49B3-83E0-4E24C1BADC05';

class CoinData {
  //Create the asynchronous method getCoinData() that returns a Future(the price data)
  Future getCoinData(String selectedCurrency) async {
    //Use a for loop through the cryptolist and request the data for each of them in turn.
    //Return a Map of the results instead of a single value.

    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

      Uri uri = Uri.parse(requestURL);
      http.Response response = await http.get(uri);
      //make a GET request to the URL and wait for the response

      //check that the request was successful
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        //create new key value pair, with the key being the crypto symbol and the value being the lastprice of that cryptocurrency.

        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        //handle any errors that occur during the request
        print(response.statusCode);

        //throw an error if the request fails
        throw 'Problem with the get request';
      }
    }

    return cryptoPrices;
  }
}
