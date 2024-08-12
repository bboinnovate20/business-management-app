import 'dart:io';

import 'package:nex_spot_app/app/business/models/data/business.dart';
import 'package:nex_spot_app/app/business/models/data_sources/business_remote_data_source.dart';
import 'package:nex_spot_app/cores/common/return_error_thrown.dart';
import 'package:nex_spot_app/cores/common/returned_status.dart';

class UserBusinessRepository {

  const UserBusinessRepository(this.userBusinessRemoteDataSource);
  
  final UserBusinessRemoteDataSource userBusinessRemoteDataSource;

    Future<ReturnedStatus> registerUserBusiness(UserBusinessDetails userBusinessDetails) async {
        print( "user ${userBusinessRemoteDataSource.userId}");

        if(userBusinessRemoteDataSource.userId!.isEmpty) return userNotExistThrow();
        
        try {
          final ReturnedStatus isUserBusinessExist = await userBusinessRemoteDataSource.getUserBusinesses();

          if(isUserBusinessExist.success) {
            return ReturnedStatus.returnedStatus(message: 'User Business already Exist', success: false);
          }
          
          final ReturnedStatus registerBusinessDetail = await userBusinessRemoteDataSource.registerBusiness(userBusinessDetails);
          
          if(registerBusinessDetail.success) {

            final registerUserBusiness = await userBusinessRemoteDataSource.registerUserBusiness(registerBusinessDetail.otherData['businessId']);

            return ReturnedStatus.returnedStatusOther(message: 'User Business Successfully created', success: true, 
                  otherData: {'user_business': registerBusinessDetail.otherData, 'user_id': registerUserBusiness.otherData['id']});  
          }

          return ReturnedStatus.returnedStatus(message: 'Error creating business', success: false);
        } 
        catch (e) {

          return const ReturnedStatus('Something went wrong, try again', false, null);  
        }
      
    }


    Future<ReturnedStatus> getUserBusiness() async {
        return await userBusinessRemoteDataSource.getUserBusinesses();
    }

    Future<ReturnedStatus> uploadBusinessLogo(File path) async {
        final ReturnedStatus uploadImage = await userBusinessRemoteDataSource.uploadImages(path, 'logo');
        return uploadImage;
    }

    Future<ReturnedStatus> uploadBusinessSignature(File path) async {
        final ReturnedStatus uploadImage = await userBusinessRemoteDataSource.uploadImages(path, 'signature');
        return uploadImage;
    }
  
  
}