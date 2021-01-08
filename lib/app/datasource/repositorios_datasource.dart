import 'package:flutter/foundation.dart';
import 'package:github_repositories/configs/client/api_result.dart';
import 'package:github_repositories/configs/client/endpoint.dart';
import 'package:github_repositories/configs/client/request_api_provider.dart';

abstract class IRepositoriosDataSource{
   Future<ApiResult> buscarListaRepositories();
}

class GitHubDataSource implements IRepositoriosDataSource {
  final RequestApiProvider _requestApiProvider;
  
  GitHubDataSource({
    @required apiProvider
  }) : _requestApiProvider = apiProvider;

  @override
  Future<ApiResult> buscarListaRepositories() async{
    return await _requestApiProvider.execute(Endpoint(
      data: null,
      method: EndPointMethod.get,
      url: '/repositories',
    ));
  }

}