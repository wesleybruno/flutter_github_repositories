import 'package:flutter/foundation.dart';

class ItemRepositorioViewModel {
  final String autor;
  final String avatarUrl;
  final String nomeRepositorio;
  final String linkRepositorio;

  ItemRepositorioViewModel({
    @required this.autor,
    @required this.avatarUrl,
    @required this.nomeRepositorio,
    @required this.linkRepositorio,
  });
}
