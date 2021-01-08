abstract class ApiResult {
  String message;
  int statusCode;
  List dataList;
  Map<String, dynamic> data;
}

class Success implements ApiResult {
  int statusCode;
  Map<String, dynamic> data;
  List dataList;
  String message;
  Success({
    this.statusCode,
    this.data,
    this.dataList,
  });
}

class Failure implements ApiResult {
  int statusCode;
  String message;
  Map<String, dynamic> data;
  List dataList;
  Failure({
    this.statusCode,
    this.message,
    this.data,
  });
}

class ApiError implements ApiResult {
  int statusCode;
  String message;
  Map<String, dynamic> data;
  List dataList;

  ApiError({
    this.statusCode,
    this.message,
    this.data,
  });
}

class NoInternet implements ApiResult {
  int statusCode;
  String message;
  Map<String, dynamic> data;
  List dataList;

  NoInternet({
    this.statusCode,
    this.message,
    this.data,
  });
}
