import 'dart:convert';

PostRequestModel postRequestModelFromJson(String str) =>
    PostRequestModel.fromJson(json.decode(str));

class PostRequestModel {
  String status;
  String message;

  PostRequestModel({this.status = '', this.message = ''});

  factory PostRequestModel.fromJson(Map<String, dynamic> json) {
    return PostRequestModel(status: json["status"], message: json["message"]);
  }
}
