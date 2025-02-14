import '../app_url/app_url.dart';
import 'network_api_servces.dart';

class ApiRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> getApi({required String url, var data}) async {
    dynamic response = _apiService.getHeaderApi(data, url);

    return response;
  }

  Future<dynamic> getHeaderApi(var data, var headersss) async {
    dynamic response =
        _apiService.getProfileApi(data, AppUrl.getProfileApi, headersss);

    return response;
  }

  Future<dynamic> postApi(var data, String url, var header) async {
    dynamic response = _apiService.postApi(data, url, header);

    return response;
  }

  Future<dynamic> putApi(var data, String url, var header) async {
    dynamic response = _apiService.putApi(data, url, header);
    return response;
  }

  Future<dynamic> deleteApi(String url, var header) async {
    dynamic response = _apiService.deleteApi(url, header);

    return response;
  }

}
