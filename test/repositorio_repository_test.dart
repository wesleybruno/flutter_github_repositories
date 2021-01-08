import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repositories/app/datasource/repositorios_datasource.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/app/repository/repositorios_repository.dart';
import 'package:github_repositories/configs/client/api_result.dart';
import 'package:mockito/mockito.dart';

class MockRepositorioDatasource extends Mock
    implements IRepositoriosDataSource {}

void main() {
  MockRepositorioDatasource mockRepositorioDataSource;
  RepositoriosRepository repositoriosRepository;

  setUp(() {
    mockRepositorioDataSource = MockRepositorioDatasource();
    repositoriosRepository = RepositoriosRepository(
        repositorioDataSource: mockRepositorioDataSource);
  });

  group('buscarRepositorios', () {
    final tRetornoErro = ApiError(
      message: 'Erro na api',
      statusCode: 400,
    );

    final tRetornoSucesso = Success(dataList: [], statusCode: 200);

    test(
      'Deve retornar uma lista de repositorios',
      () async {
        when(
          mockRepositorioDataSource.buscarListaRepositories(),
        ).thenAnswer(
          (_) async => tRetornoSucesso,
        );

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
        when(
          mockRepositorioDataSource.buscarListaRepositories(),
        ).thenAnswer(
          (_) async => tRetornoErro,
        );

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
