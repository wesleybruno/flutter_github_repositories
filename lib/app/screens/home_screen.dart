import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repositories/app/comum/widgets/erro_api_widget.dart';
import 'package:github_repositories/app/comum/widgets/sem_internet.dart';
import 'package:github_repositories/app/screens/cubit/home_cubit.dart';
import 'package:github_repositories/app/screens/widgets/item_repositorio_factory.dart';
import 'package:github_repositories/injection_container.dart';
import 'package:github_repositories/ui/Cores.dart';
import 'package:github_repositories/ui/DimensoesTela.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ItemRepositorioScreenFactory _itemRepositorioScreenFactory =
      ItemRepositorioScreenFactory();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (_) => dependencia<HomeScreenCubit>()..carregarRepositorios(),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeCarregandoDadosState) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: DimensoesTela.altura / 2),
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                ),
              );
            }

            if (state is HomeSemConexaoState) {
              return Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: SemInternetWidget(
                  corIcone: Cores.preto,
                  aoApertarTentarNovamente:
                      BlocProvider.of<HomeScreenCubit>(context)
                          .carregarRepositorios,
                ),
              );
            }

            if (state is HomeErroCarregarDadosState) {
              return Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: ErroApiWidget(
                  corIcone: Cores.preto,
                  aoApertarTentarNovamente:
                      BlocProvider.of<HomeScreenCubit>(context)
                          .carregarRepositorios,
                ),
              );
            }

            if (state is HomeDadosCarregadosState) {
              return _itemRepositorioScreenFactory.createList(
                listaRepositoriosModel: state.listaRepositorios,
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
