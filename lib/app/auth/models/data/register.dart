    class UserPersonalData {
      const UserPersonalData(this.firstName, this.lastName, this.email, this.password);

      final String firstName;
      final String lastName;
      final String email;
      final String password;

      factory UserPersonalData.fromJson(Map<String, String> json) {
        return UserPersonalData(
              json['firstName'] as String, json['lastName'] as String, 
              json['email'] as String, json['password'] as String);
      }

      Map<String, String> toJson() {
        return {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password
        };
      }
    }