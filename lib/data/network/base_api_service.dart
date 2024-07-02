abstract class BaseApiService {
  final String baseUrl = 'http://178.157.14.18:591/api/';

  static const String loginAccountName = "suffatech";
  static const String loginPassword = "SuffaTech3917";

  Future<dynamic> getResponse(String url);
}
