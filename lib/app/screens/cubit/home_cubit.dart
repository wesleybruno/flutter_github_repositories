import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/app/repository/repositorios_repository.dart';

part 'home_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  RepositoriosRepository _repositoriosRepository;

  HomeScreenCubit({
    @required RepositoriosRepository repositoriosRepository,
  })  : _repositoriosRepository = repositoriosRepository,
        super(HomeInicialState());

  Future<void> carregarRepositorios() async {
    emit(HomeCarregandoDadosState());

    final result = await _repositoriosRepository.buscarRepositorios();
    result.fold((erro) {
      if (erro.statusCode == null) {
        return emit(HomeSemConexaoState());
      } else {
        return emit(HomeErroCarregarDadosState());
      }
    }, (listaRepositorios) {
      return emit(HomeDadosCarregadosState(listaRepositorios));
    });
  }
}
