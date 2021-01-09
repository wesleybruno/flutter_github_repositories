import 'package:dartz/dartz.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/configs/client/api_result.dart';
import 'package:github_repositories/ui/Strings.dart';
import 'package:meta/meta.dart';

class RepositoriosDecodeHelper {
  Either<ApiResult, List<RepositorioModel>> decodeRepositorios(
      {@required ApiResult result}) {
    try {
      if (result is Success) {
        final List<dynamic> resultados = result.dataList;

        final List<RepositorioModel> listaRepositorios = [];
        resultados.forEach((element) {
          listaRepositorios.add(RepositorioModel.fromJson(element));
        });

        return Right(listaRepositorios);
      }

      return Left(result);
    } catch (e) {
      result.message = Strings.erroAoDecodificar('List<RepositorioModel>');
      return Left(result);
    }
  }
}
