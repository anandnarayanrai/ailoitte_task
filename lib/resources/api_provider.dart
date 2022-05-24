import 'package:ailoitte_task/models/rum_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String _url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php';

  Future<RumModel> fetchModelList(String query) async {
    try {
      Response response = await _dio.get(_url, queryParameters: {"s": query});
      return RumModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RumModel.withError("Data not found / Connection issue");
    }
  }
}
