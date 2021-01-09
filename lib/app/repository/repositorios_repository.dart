import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:github_repositories/app/datasource/repositorios_datasource.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/app/repository/repositorios_decode_helper.dart';
import 'package:github_repositories/configs/client/api_result.dart';

class RepositoriosRepository {
  RepositoriosRepository({
    @required repositorioDataSource,
    @required repositoriosDecodeHelper,
  })  : _dataSource = repositorioDataSource,
        _decodeHelper = repositoriosDecodeHelper;

  final IRepositoriosDataSource _dataSource;
  final RepositoriosDecodeHelper _decodeHelper;

  Future<Either<ApiResult, List<RepositorioModel>>> buscarRepositorios() async {
    final result = await this._dataSource.buscarListaRepositories();
    return _decodeHelper.decodeRepositorios(result: result);
  }
}
