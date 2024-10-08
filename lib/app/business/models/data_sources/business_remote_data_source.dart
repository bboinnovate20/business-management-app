
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/cores/common/return_error_thrown.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';
import 'package:nex_spot_app/cores/constants/database.dart';

class UserBusinessRemoteDataSource {
  const UserBusinessRemoteDataSource({this.userId, required this.database});
  
  final String? userId;
  final FirebaseFirestore database;


  registerBusiness(UserBusinessDetails userBusinessDetails){}
  
  registerUserBusiness(String createdBusinessId){}

  getUserBusinesses(){}

  uploadImages(File path, String imagePurpose){}
}


class FirebaseUserBusinessRemoteDataSource implements UserBusinessRemoteDataSource {
    

  
    const FirebaseUserBusinessRemoteDataSource({required this.database, this.userId});


    @override
  final FirebaseFirestore database;
  @override
  final String? userId;
  // @override
  // String? get userId {
  //       return FirebaseAuth.instance.currentUser?.uid;
  // }
    
 
    @override
    Future<ReturnedStatus> getUserBusinesses() async {
      print("user id $userId");
      if(userId == null) return userNotExistThrow();
    
      try {
        final DocumentReference getUserBusinessDoc = database.collection(DatabaseCollection.userBusinessColl).doc(userId.toString());
        final getBusinessDetails = await getUserBusinessDoc.get();

        final getUserBusinessData = getBusinessDetails.data() as Map<String, dynamic>;
        
        if(getUserBusinessData.isEmpty) {
            ReturnedStatus.returnedStatus(message: 'User business not exist', success: false);
        }

        return ReturnedStatus.returnedStatusOther(message: 'User Business Fetched', success: true, otherData: getUserBusinessData);

      } catch (e) {
        return const ReturnedStatus('Something went wrong, try again', false, null);
      }

    }

    @override
    Future<ReturnedStatus> registerUserBusiness(String createdBusinessId) async {
      
      if(userId == null) return userNotExistThrow();

      try {
          database.collection(DatabaseCollection.userBusinessColl).doc(userId.toString()).set({'businesses': [createdBusinessId]});
          return ReturnedStatus.returnedStatusOther(message: 'User Business Successfully created', success: true, otherData: {'id': userId});  

      } catch (e) {
          return ReturnedStatus.returnedStatus(message: 'Error creating User Business', success: false);  
      }
    }

    @override
    Future<ReturnedStatus> registerBusiness(UserBusinessDetails businessDetails) async {
      try {
          final registerBusinessResponse  = await database.collection(DatabaseCollection.businessColl).add(businessDetails.toJson());
          final response = await registerBusinessResponse.get();
          final businessData = response.data();

          return ReturnedStatus.returnedStatusOther(
            message: 'Successfully register Business',
            success: true,
            otherData: {'businessId': registerBusinessResponse.id, 'businessInfo': businessData}
          );
      } catch (e) {
        const ReturnedStatus('Something went wrong, try again', false, null);
      }

      return ReturnedStatus.returnedStatus(message: 'Unable to register business', success: false);
    }

    @override
    uploadImages(File path, String imagePurpose) async {
        try {
          print(path);
          print(imagePurpose);
          final getReference = geReferenceFileName(imagePurpose);
          print("started  the  uploading");
          final TaskSnapshot pathResponse = await (getReference['image_ref'] as Reference).putFile(path, SettableMetadata(
                                contentType: "image/*",
                              ));
          print("completed");
          return ReturnedStatus.returnedStatusOther(message: 'Image Uploaded', success: true, otherData: {'snapshot': pathResponse});

        } 
        catch (e) {
          return const ReturnedStatus('Error Uploading File', false, null);
        }

    }

    geReferenceFileName(String imagePurpose) { 
          final storageRef = FirebaseStorage.instance.ref();
          Reference? imagesRef = storageRef.child("business_uploads/userId/$imagePurpose");
          // Reference? userImage = imagesRef.child("${userId}_images");
          String fileName = imagePurpose;
          return {'name': fileName, 'image_ref': imagesRef};
    }
      
}

