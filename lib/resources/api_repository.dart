import 'package:ailoitte_task/models/rum_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<RumModel> fetchModelList(String query) {
    print(query);
    return _provider.fetchModelList(query);
  }
}

class NetworkError extends Error {}
