import 'package:http/http.dart';

_doTransaction() async {
  String url = 'https://uploaded-report-api.herokuapp.com/';
  Response response = await get(url);
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  print(json);
}