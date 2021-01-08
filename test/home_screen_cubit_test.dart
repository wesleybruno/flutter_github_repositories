import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/app/repository/repositorios_repository.dart';
import 'package:github_repositories/app/screens/cubit/home_cubit.dart';
import 'package:github_repositories/configs/client/api_result.dart';
import 'package:mockito/mockito.dart';

class MockRepositoriosRepository extends Mock
    implements RepositoriosRepository {}

void main() {
  HomeScreenCubit homeScreenCubit;
  MockRepositoriosRepository mockRepositoriosRepository;
  final List<RepositorioModel> listaRepositorios = [];

  setUp(() {
    mockRepositoriosRepository = MockRepositoriosRepository();
    homeScreenCubit = HomeScreenCubit(
      repositoriosRepository: mockRepositoriosRepository,
    );
  });

  tearDown(
    () => homeScreenCubit.close(),
  );

  group('BuscarRepositorios (cubit): ', () {
    test(
      'Verificar estado inicial',
      () {
        expect(
          homeScreenCubit.state,
          HomeInicialState(),
        );
      },
    );
  });

  blocTest<HomeScreenCubit, HomeScreenState>(
    'Sucesso - Buscar Lista repositorios',
    build: () {
      when(
        mockRepositoriosRepository.buscarRepositorios(),
      ).thenAnswer(
        (_) async => Right(listaRepositorios),
      );
      return homeScreenCubit;
    },
    act: (bloc) async => homeScreenCubit.carregarRepositorios(),
    expect: <HomeScreenState>[
      HomeCarregandoDadosState(),
      HomeDadosCarregadosState(listaRepositorios),
    ],
  );

  blocTest<HomeScreenCubit, HomeScreenState>(
    'Erro - Falha ao buscar lista de repositorios',
    build: () {
      when(
        mockRepositoriosRepository.buscarRepositorios(),
      ).thenAnswer(
        (_) async => Left(
          ApiError(statusCode: 400),
        ),
      );
      return homeScreenCubit;
    },
    act: (bloc) async => homeScreenCubit.carregarRepositorios(),
    expect: <HomeScreenState>[
      HomeCarregandoDadosState(),
      HomeErroCarregarDadosState()
    ],
  );

  blocTest<HomeScreenCubit, HomeScreenState>(
    'Sem Internet',
    build: () {
      when(
        mockRepositoriosRepository.buscarRepositorios(),
      ).thenAnswer(
        (_) async => Left(
          ApiError(statusCode: null),
        ),
      );
      return homeScreenCubit;
    },
    act: (bloc) async => homeScreenCubit.carregarRepositorios(),
    expect: <HomeScreenState>[
      HomeCarregandoDadosState(),
      HomeSemConexaoState()
    ],
  );
}
