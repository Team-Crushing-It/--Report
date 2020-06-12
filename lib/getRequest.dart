import 'package:http/http.dart';

void main() {
  _makeGetRequest();
}

_makeGetRequest() async {
  // make GET request
  String url = 'https://uploaded-report-api.herokuapp.com/';
  Response response = await get(url);
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  print(json);
}