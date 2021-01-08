import 'package:flutter/material.dart';
import 'package:github_repositories/app/comum/widgets/botao_principal.dart';
import 'package:github_repositories/ui/Cores.dart';
import 'package:github_repositories/ui/DimensoesTela.dart';
import 'package:github_repositories/ui/Strings.dart';
import 'package:github_repositories/ui/Themes.dart';

class ErroApiWidget extends StatelessWidget {
  final Function aoApertarTentarNovamente;
  final Color corTexto;
  final Color corIcone;

  const ErroApiWidget({
    Key key,
    this.aoApertarTentarNovamente,
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
              Icons.error_outline,
              color: corIcone ?? Cores.preto,
              size: 24.0,
              semanticLabel:
                  'Tivemos um problema com o servidor, tente novamente!',
            ),
          ),
          Container(
            width: 350.w,
            margin: EdgeInsets.only(
              top: 40.h,
              bottom: 30.h,
            ),
            child: Text(
              Strings.desculpe,
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
              Strings.tenteMaisTarde,
              textAlign: TextAlign.center,
              style: Themes.defaultTextStyle.copyWith(
                color: corTexto ?? Cores.cinza[200],
                fontSize: 15.ssp,
              ),
            ),
          ),
          BotaoPrincipal(
            texto: Strings.tentarNovamente,
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
