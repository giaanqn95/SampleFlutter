
class BaseResponseA {
  final String code;
  final String message;
  final dynamic data;

  BaseResponseA({this.code, this.message, this.data});

  factory BaseResponseA.fromJson(Map<String, dynamic> json) {
    return BaseResponseA(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}