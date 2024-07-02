import 'dart:io';

import 'package:http/http.dart' as http;
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(
    String url,
  ) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      dynamic responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      return false;
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      default:
        return false;
    }
  }
}
