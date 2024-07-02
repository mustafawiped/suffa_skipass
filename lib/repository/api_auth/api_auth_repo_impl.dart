import 'package:suffa_skipass/data/network/api_end_points.dart';
import 'package:suffa_skipass/repository/api_auth/api_auth_repo.dart';

import '../../../data/network/base_api_service.dart';
import '../../../data/network/network_api_service.dart';

class ApiAuthRepoImpl extends ApiAuthRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<bool> login() async {
    try {
      String loginApiUrl =
          "${ApiEndpoints.login}userName=${BaseApiService.loginAccountName}&password=${BaseApiService.loginPassword}";
      dynamic response = await _apiService.getResponse(loginApiUrl);

      if (response is bool) return false;

      return true;
    } catch (e) {
      return false;
    }
  }
}
