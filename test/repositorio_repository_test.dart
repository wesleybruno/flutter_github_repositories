import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repositories/app/datasource/repositorios_datasource.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/app/repository/repositorios_decode_helper.dart';
import 'package:github_repositories/app/repository/repositorios_repository.dart';
import 'package:github_repositories/configs/client/api_result.dart';
import 'package:mockito/mockito.dart';

class MockRepositorioDatasource extends Mock
    implements IRepositoriosDataSource {}

class MockDecodeHelper extends Mock implements RepositoriosDecodeHelper {}

void main() {
  MockRepositorioDatasource mockRepositorioDataSource;
  RepositoriosRepository repositoriosRepository;
  MockDecodeHelper mockDecodeHelper;

  setUp(() {
    mockRepositorioDataSource = MockRepositorioDatasource();
    mockDecodeHelper = MockDecodeHelper();
    repositoriosRepository = RepositoriosRepository(
      repositorioDataSource: mockRepositorioDataSource,
      repositoriosDecodeHelper: mockDecodeHelper,
    );
  });

  group('Repositorio repository:', () {
    final tRetornoErro = ApiError(
      message: 'Erro na api',
      statusCode: 400,
    );

    final tRetornoSucesso = Success(dataList: [], statusCode: 200);
    List<RepositorioModel> tListaRepositorios = [];
    test(
      'Deve retornar uma lista de repositorios',
      () async {
        when(mockRepositorioDataSource.buscarListaRepositories())
            .thenAnswer((_) async => tRetornoSucesso);

        when(mockDecodeHelper.decodeRepositorios(result: tRetornoSucesso))
            .thenAnswer((_) => Right(tListaRepositorios));

        final result = await repositoriosRepository.buscarRepositorios();
        expect(result, isA<Right>());
        expect(result.fold((l) => l, (r) => r), isA<List<RepositorioModel>>());
        verify(mockRepositorioDataSource.buscarListaRepositories()).called(1);
        verifyNoMoreInteractions(mockRepositorioDataSource);
      },
    );

    test(
      'Deve retornar erro da API quando houver falha',
      () async {
        when(mockRepositorioDataSource.buscarListaRepositories())
            .thenAnswer((_) async => tRetornoErro);

        when(mockDecodeHelper.decodeRepositorios(result: tRetornoErro))
            .thenAnswer((_) => Left(tRetornoErro));

        final result = await repositoriosRepository.buscarRepositorios();

        expect(result, isA<Left>());
        expect(
          result,
          Left<ApiResult, List<RepositorioModel>>(tRetornoErro),
        );
        verify(mockRepositorioDataSource.buscarListaRepositories()).called(1);
        verifyNoMoreInteractions(mockRepositorioDataSource);
      },
    );
  });
}
