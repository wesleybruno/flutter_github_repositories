import 'package:flutter/material.dart';
import 'package:github_repositories/app/models/repositorio_model.dart';
import 'package:github_repositories/app/screens/widgets/item_repositorio_viewmodel.dart';
import 'package:github_repositories/ui/Cores.dart';
import 'package:github_repositories/ui/DimensoesTela.dart';
import 'package:github_repositories/ui/Fontes.dart';
import 'package:github_repositories/ui/Themes.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemRepositorioScreenFactory {
  ItemRepositorioScreenFactory();

  Widget createList({
    List<RepositorioModel> listaRepositoriosModel,
  }) {
    final List<ItemRepositorioViewModel> listaViewModel = [];

    listaRepositoriosModel.asMap().forEach((index, element) {
      listaViewModel.add(ItemRepositorioViewModel(
        autor: element.owner.login,
        avatarUrl: element.owner.avatarUrl,
        linkRepositorio: element.htmlUrl,
        nomeRepositorio: element.name,
      ));
    });

    final List<Widget> _listaWidgets = List.generate(
      listaViewModel.length,
      (index) => _itemLista(
          index,
          () => {_launchURL(listaViewModel[index].linkRepositorio)},
          listaViewModel[index].autor,
          listaViewModel[index].nomeRepositorio,
          listaViewModel[index].avatarUrl),
    );

    _listaWidgets.insert(0, _textoPrincipal());

    return Column(
      children: _listaWidgets,
    );
  }

  _launchURL(String urlRepositorio) async {
    if (await canLaunch(urlRepositorio)) {
      await launch(urlRepositorio);
    } else {
      return false;
    }
  }

  Widget _textoPrincipal() {
    return Text(
      'Lista de Repositórios',
      style: Themes.defaultTextStyle.copyWith(
        color: Cores.preto,
        fontWeight: Fontes.bold,
        fontSize: 15.ssp,
      ),
    );
  }

  Widget _itemLista(
    int index,
    Function aoApertarItemTopico,
    String autor,
    String nomeRepositorio,
    String capaRepositorio,
  ) {
    return GestureDetector(
      onTap: aoApertarItemTopico,
      child: Container(
        height: 130.h,
        width: 374.w,
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Cores.cinza[200].withOpacity(0.2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
        ),
        child: Row(
          children: [
            _image(capaRepositorio),
            Container(
              margin: EdgeInsets.only(
                left: 13.w,
                top: 13.h,
                bottom: 13.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nomeRepositorio,
                    style: Themes.defaultTextStyle.copyWith(
                      color: Cores.preto,
                      fontWeight: Fontes.bold,
                      fontSize: 15.ssp,
                    ),
                  ),
                  Text(
                    autor,
                    style: Themes.defaultTextStyle.copyWith(
                      color: Cores.preto,
                      fontWeight: Fontes.normal,
                      fontSize: 13.ssp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _image(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.w),
      child: Container(
        height: 130.h,
        width: 92.w,
        child: imageUrl != null && imageUrl != ""
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )
            : Container(
                padding: EdgeInsets.all(10.w),
                color: Cores.cinza,
              ),
        decoration: BoxDecoration(
          color: Cores.cinza[200].withOpacity(0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
        ),
      ),
    );
  }
}
