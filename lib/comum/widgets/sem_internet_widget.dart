import 'package:flutter/material.dart';
import 'package:github_repositories/comum/widgets/generic_error_widget.dart';
import 'package:github_repositories/ui/Strings.dart';

class SemInternetWidget extends GenericErrorWidget {
  final Function aoApertarTentarNovamente;
  final Color corTexto;
  final Color corIcone;

  const SemInternetWidget({
    Key key,
    this.aoApertarTentarNovamente,
    this.corTexto,
    this.corIcone,
  }) : super(
          key: key,
          aoApertarTentarNovamente: aoApertarTentarNovamente,
          semanticText: Strings.dispositivoSemInternet,
          corIcone: corIcone,
          corTexto: corTexto,
          textoBotao: Strings.tentarNovamente,
          textoExplicativo: Strings.naoConseguimosVerificarInternet,
          textoPrincipal: Strings.offline,
        );
}
