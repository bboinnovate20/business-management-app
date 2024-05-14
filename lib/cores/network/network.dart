import 'dart:io';

class NetworkSection {
  
  Future<bool> isNetworkOffline() async {
    final response = await InternetAddress.lookup(const String.fromEnvironment('NETWORK_TEST_URL', defaultValue: "google.com"));
    return response.isEmpty ? true : false;
  }

}