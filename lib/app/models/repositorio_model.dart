import 'package:github_repositories/app/models/repositorio_owner.dart';

class RepositorioModel {
  int id;
  String name;
  OwnerModel owner;
  String htmlUrl;

  RepositorioModel({
    this.id,
    this.name,
    this.owner,
    this.htmlUrl,
  })  : assert(id != null),
        assert(name != null),
        assert(owner != null),
        assert(htmlUrl != null);

  RepositorioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    owner =
        json['owner'] != null ? new OwnerModel.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
  }
}
