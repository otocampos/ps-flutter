import 'package:entregaudium/features/profile/data/models/profile_model.dart';

class BaseResponseModel {
  BaseResponseModel({
    this.success,
    this.response,
  });

  String? success;
  dynamic? response;
  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    response = json['response'] != null
        ? ProfileModel.fromJson(json['response'])
        : null;
  }

}