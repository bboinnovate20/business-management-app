
import 'package:firebase_auth/firebase_auth.dart';

class ReturnedStatus {
  const ReturnedStatus(this.message, this.success, this.data, {this.otherData = const {}});

  final String message;
  final bool success;
  final User? data;
  final Map<String, dynamic> otherData;


  factory ReturnedStatus.fromJson(Map<String, String> json){
    return ReturnedStatus(json['message'] as String, json['success'] as bool, json['data'] as User?);
  }
  
  factory ReturnedStatus.returnedStatus({required String message, required bool success, User? data, Map<String, dynamic>? otherData}) {
      return ReturnedStatus(message, success, data, otherData: otherData ?? {});
  }

  factory ReturnedStatus.returnedStatusOther({required String message, required bool success, required Map<String, dynamic> otherData}) {
      return ReturnedStatus(message, success, null, otherData: otherData);
  }

  
}
