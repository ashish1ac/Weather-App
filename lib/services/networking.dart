import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url}); // create constructor to getting url.

  Future getDataFromServer() async {
    var serverAddressURL = Uri.parse(url); // for converting url to Uri for iPv6

    // getting data from server using server address i.e url
    Response response = await get(serverAddressURL);
    String data = response.body;
    // print(data);

    if (response.statusCode == 200) {
      // statusCode == 200 means request is successful
      return jsonDecode(data);
    } else {
      // statusCode 400 means no data available at server
      print(response.statusCode);
    }
  }
}
