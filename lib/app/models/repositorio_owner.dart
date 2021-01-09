class OwnerModel {
  String login;
  int id;
  String avatarUrl;

  OwnerModel({
    this.login,
    this.id,
    this.avatarUrl,
  })  : assert(id != null),
        assert(login != null),
        assert(avatarUrl != null);

  OwnerModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
