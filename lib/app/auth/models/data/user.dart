class UserState {
  const UserState({required this.email, required this.firstName, required this.lastName, this.businessInformation, this.isAuthenticated = false});
  final bool isAuthenticated;
  final String firstName;
  final String lastName;
  final String email;
  final UserBusinessInfoState? businessInformation;
}


class UserBusinessInfoState{

  const UserBusinessInfoState(this.businessName, this.address);

  final String businessName;
  final String address;
}