part of 'home_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeInicialState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeCarregandoDadosState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeErroCarregarDadosState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeDadosCarregadosState extends HomeScreenState {
  final List<RepositorioModel> listaRepositorios;

  HomeDadosCarregadosState(this.listaRepositorios);
  @override
  List<Object> get props => [listaRepositorios];
}

class HomeSemConexaoState extends HomeScreenState {
  @override
  List<Object> get props => [];
}
