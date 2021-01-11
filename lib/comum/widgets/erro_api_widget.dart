import 'package:flutter/material.dart';
import 'package:github_repositories/comum/widgets/generic_error_widget.dart';
import 'package:github_repositories/ui/Strings.dart';

class ErroApiWidget extends GenericErrorWidget {
  final Function aoApertarTentarNovamente;
  final Color corTexto;
  final Color corIcone;

  const ErroApiWidget({
    Key key,
    this.aoApertarTentarNovamente,
    this.corTexto,
    this.corIcone,
  }) : super(
          key: key,
          aoApertarTentarNovamente: aoApertarTentarNovamente,
          semanticText: Strings.problemasComServidor,
          corIcone: corIcone,
          corTexto: corTexto,
          textoBotao: Strings.tentarNovamente,
          textoExplicativo: Strings.desculpe,
          textoPrincipal: Strings.tenteMaisTarde,
        );
}
