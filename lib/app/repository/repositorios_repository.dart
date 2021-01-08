import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:github_repositories/app/datasource/repositorios_datasource.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/configs/client/api_result.dart';

class RepositoriosRepository {
  RepositoriosRepository({
    @required repositorioDataSource,
  }) : _dataSource = repositorioDataSource;

  final IRepositoriosDataSource _dataSource;

  Future<Either<ApiResult, List<RepositorioModel>>> buscarRepositorios() async {
    final result = await this._dataSource.buscarListaRepositories();

    if (result is Success) {
      final List<dynamic> resultados = result.dataList;

      final List<RepositorioModel> listaRepositorios = [];
      resultados.forEach((element) {
        listaRepositorios.add(RepositorioModel.fromJson(element));
      });

      return Right(listaRepositorios);
    }

    return Left(result);
  }
}
