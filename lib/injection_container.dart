import 'package:get_it/get_it.dart';
import 'package:github_repositories/app/datasource/repositorios_datasource.dart';
import 'package:github_repositories/app/repository/repositorios_decode_helper.dart';
import 'package:github_repositories/app/repository/repositorios_repository.dart';
import 'package:github_repositories/app/screens/cubit/home_cubit.dart';
import 'package:github_repositories/configs/client/check_connectivty.dart';
import 'package:github_repositories/configs/client/custom_dio.dart';
import 'package:github_repositories/configs/client/request_api_provider.dart';

final dependencia = GetIt.instance;

Future<void> init() async {
  dependencia.registerLazySingleton(
    () => LocalConnectivity(),
  );

  dependencia.registerFactory(
    () => CustomDio(),
  );

  dependencia.registerFactory(
    () => RequestApiProvider(
      customDio: dependencia<CustomDio>(),
    ),
  );

  dependencia.registerFactory(
    () => GitHubDataSource(
      apiProvider: dependencia<RequestApiProvider>(),
    ),
  );

  dependencia.registerFactory(
    () => RepositoriosDecodeHelper(),
  );

  dependencia.registerFactory(
    () => RepositoriosRepository(
      repositorioDataSource: dependencia<GitHubDataSource>(),
      repositoriosDecodeHelper: dependencia<RepositoriosDecodeHelper>(),
    ),
  );

  dependencia.registerFactory(
    () => HomeScreenCubit(
      repositoriosRepository: dependencia<RepositoriosRepository>(),
    ),
  );
}
