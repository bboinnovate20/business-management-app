// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nex_spot_app/app/auth/models/data/register.dart';
import 'package:nex_spot_app/app/auth/models/data_sources/registration_remote_data_source.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/app/business/models/data_sources/business_remote_data_source.dart';
import 'package:nex_spot_app/app/business/models/repositories/user_business_repository.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';


void main() {

  test("Register User", () async {
      const personalData = UserPersonalData("Ibrahim", "Musa", "imusa229@gmail.com", "12345678Ola");
       final user = MockUser(
          isAnonymous: false,
          uid: 'ibrahim',
          email: personalData.email,
          displayName: '${personalData.firstName} ${personalData.lastName}',
        );
      final MockFirebaseAuth auth = MockFirebaseAuth(mockUser: user);

      final userRegistration = FirebaseRegistrationDataSource(instance: auth);
      final ReturnedStatus response = await userRegistration.registerUser(personalData);

      expect(response.data?.email, "imusa229@gmail.com");
      expect(response.data?.displayName, "Ibrahim Musa");

  });
  test('Register User Business', () async {

        const businessAddress = UserBusinessAddress(street:'48, Freeman Street', state: 'Lagos', country: 'Nigeria');
        
        const userBusinessDetails = UserBusinessDetails(userId: 'imusa229@gmail.com', businessName:  'Albarika Computer Center', 
                  businessAddress:  businessAddress, businessCategory:  'catering-services', businessRCNumber: '4311100RC', role: 'services');

        final dataInstance = FakeFirebaseFirestore();
    
        final registerUser = FirebaseUserBusinessRemoteDataSource( userId: 1, database: dataInstance);
        final registerUserBusiness = UserBusinessRepository(registerUser);

        final ReturnedStatus response = await registerUserBusiness.registerUserBusiness(userBusinessDetails);
        
        print(response.otherData);

        expect(true, response.success);
  });

}
