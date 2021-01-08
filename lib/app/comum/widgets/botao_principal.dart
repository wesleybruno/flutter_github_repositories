import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories/ui/Cores.dart';
import 'package:github_repositories/ui/DimensoesTela.dart';
import 'package:github_repositories/ui/Fontes.dart';

class BotaoPrincipal extends StatelessWidget {
  final double altura;
  final double largura;
  final Function aoClicar;
  final String texto;
  final Color corTexto;
  final Color corFundo;
  final Color corBorda;
  final bool exibirLoading;
  final String icone;
  final TextStyle textStyle;
  final Widget child;
  final bool habilitar;
  final double raioBorda;

  const BotaoPrincipal({
    Key key,
    this.altura,
    this.largura,
    this.aoClicar,
    this.corTexto,
    this.corFundo,
    this.corBorda,
    this.habilitar = true,
    this.icone,
    this.textStyle,
    this.exibirLoading = false,
    this.child,
    this.raioBorda,
    @required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: habilitar ? aoClicar : null,
      child: Container(
        height: altura,
        width: largura,
        decoration: BoxDecoration(
          color: habilitar ? (corFundo ?? Cores.azulClaro) : Cores.cinza[200],
          border: Border.all(color: corBorda ?? Cores.branco),
          borderRadius: BorderRadius.all(
            Radius.circular(raioBorda ?? 10.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _getChildren(),
        ),
      ),
    );
  }

  Widget _icone() {
    return Container(
      height: 25.h,
      width: 25.w,
      child: Image.asset(icone),
    );
  }

  Widget _textoBotao() {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: textStyle ??
          TextStyle(
            fontSize: 14.ssp,
            color: habilitar ? (corTexto ?? Cores.branco) : Cores.cinza[200],
            fontFamily: Fontes.montserrat,
          ),
    );
  }

  List<Widget> _getChildren() {
    List<Widget> lista = [];

    if (child != null) {
      lista.add(child);
      return lista;
    }

    if (icone != null) {
      lista.add(
        _icone(),
      );
    }

    lista.add(_textoBotao());
    if (exibirLoading) {
      lista.add(CupertinoActivityIndicator());
    }

    return lista;
  }
}
