class UserBusinessDetails {
  const UserBusinessDetails(
    {required this.userId, required this.businessName, 
    required this.businessAddress, required this.businessCategory, 
    required this.businessRCNumber, required this.role});

  final String userId;
  final String businessName;
  final UserBusinessAddress businessAddress;
  final String businessCategory;
  final String? businessRCNumber;
  final String role;
 

  // factory UserBusinessDetails.fromJson(Map<String, String> json) {
  //   final UserBusinessAddress businessAddress = UserBusinessAddress(json['street'] as String, json['street'] as String, json['country'] as String);
    
  //   return UserBusinessDetails(json['userId'] as String, json['businessName'] as String, businessAddress, 
  //          json['password'] as String, json['RCNumber'], json['role'] as String);
  // }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'businessName': businessName,
      'businessCategory': businessCategory,
      'role': role,
      'businessAddress': {
        'street': businessAddress.street,
        'state': businessAddress.state,
        'country': businessAddress.country,
      },
      'businessRCNumber': businessRCNumber
    };
  }
}

class UserBusinessAddress {
  const UserBusinessAddress({required this.street, required this.state, required this.country});

  final String street;
  final String state;
  final String country;
}


class BusinessDetails {
  const BusinessDetails(
    this.businessName, 
    this.businessAddress, this.businessCategory, this.businessRCNumber);

  final String businessName;
  final UserBusinessAddress businessAddress;
  final int businessCategory;
  final String? businessRCNumber;
 
  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'businessCategory': businessCategory,
      'businessAddress': {
        'street': businessAddress.street,
        'state': businessAddress.state,
        'country': businessAddress.country,
      },
    };
  }

  // factory BusinessDetails.fromJson(Map<String, String> json) {
  //   final UserBusinessAddress businessAddress = UserBusinessAddress(street: json['street'] as String, json['street'] as String, json['country'] as String);
    
  //   return BusinessDetails(json['businessName'] as String, businessAddress, 
  //          json['password'] as int, json['RCNumber']);
  // }
}
