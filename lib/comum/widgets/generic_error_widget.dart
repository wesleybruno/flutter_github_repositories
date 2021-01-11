import 'package:flutter/material.dart';
import 'package:github_repositories/comum/widgets/botao_principal.dart';
import 'package:github_repositories/ui/Cores.dart';
import 'package:github_repositories/ui/DimensoesTela.dart';
import 'package:github_repositories/ui/Themes.dart';

class GenericErrorWidget extends StatelessWidget {
  final Function aoApertarTentarNovamente;
  final String textoPrincipal;
  final String textoExplicativo;
  final String semanticText;
  final String textoBotao;
  final Color corTexto;
  final Color corIcone;

  const GenericErrorWidget({
    Key key,
    this.aoApertarTentarNovamente,
    this.textoPrincipal,
    this.textoExplicativo,
    this.semanticText,
    this.textoBotao,
    this.corTexto,
    this.corIcone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 100.h,
            ),
            width: 50.w,
            height: 50.h,
            child: Icon(
              Icons.perm_scan_wifi_outlined,
              color: corIcone ?? Cores.preto,
              size: 24.0,
              semanticLabel: semanticText,
            ),
          ),
          Container(
            width: 350.w,
            margin: EdgeInsets.only(
              top: 40.h,
              bottom: 30.h,
            ),
            child: Text(
              textoPrincipal,
              textAlign: TextAlign.center,
              style: Themes.defaultTextStyle.copyWith(
                color: corTexto ?? Cores.preto,
                fontSize: 17.ssp,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 45.h,
            ),
            width: 320.w,
            child: Text(
              textoExplicativo,
              textAlign: TextAlign.center,
              style: Themes.defaultTextStyle.copyWith(
                color: corTexto ?? Cores.cinza[200],
                fontSize: 15.ssp,
              ),
            ),
          ),
          BotaoPrincipal(
            texto: textoBotao,
            corTexto: Cores.preto,
            aoClicar: aoApertarTentarNovamente,
            altura: 55.h,
            largura: 266.w,
          )
        ],
      ),
    );
  }
}
