
import 'package:firebase_auth/firebase_auth.dart';

class ReturnedStatus {
  const ReturnedStatus(this.message, this.success, this.data);

  final String message;
  final bool success;
  final UserCredential? data;


  factory ReturnedStatus.fromJson(Map<String, String> json){
    return ReturnedStatus(json['message'] as String, json['success'] as bool, json['data'] as UserCredential?);
  }
  
  factory ReturnedStatus.returnedStatus({required String message, required bool success, UserCredential? data}) {
      return ReturnedStatus(message, success, data);
  }
}
