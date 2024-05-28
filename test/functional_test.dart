// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/app/business/models/data_sources/business_remote_data_source.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';
import 'package:nex_spot_app/firebase_options.dart';

void main() {
  test('Register User Business', () async {

        const businessAddress = UserBusinessAddress('48, Freeman Street', 'Lagos', 'Nigeria');
        
        const userBusinessDetails = UserBusinessDetails('imusa229@gmail.com', 'Albarika Computer Center', 
                                              businessAddress, 'catering-services','services', '4311100RC');
        debugPrint("creating an instance");
        final dataInstance = FakeFirebaseFirestore();
        debugPrint("instance created ");

        debugPrint("registering user");
        final registerUser = UserBusinessRemoteDataSource( userId: 1, database: dataInstance);

        // debugPrint("response returned");
        final ReturnedStatus response = await registerUser.registerUserBusiness(userBusinessDetails);

        print("print debugging");
        debugPrint(response.message);
        print(response.otherData);
        
        expect(true, response.success);
  });
}
