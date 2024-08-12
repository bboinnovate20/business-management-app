

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nex_spot_app/app/auth/provider/user_state_notifier.dart';
import 'package:nex_spot_app/app/business/models/data_sources/business_remote_data_source.dart';
import 'package:nex_spot_app/app/business/models/repositories/user_business_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_business_repository_provider.g.dart';



@riverpod
UserBusinessRepository userBusinessRepository(UserBusinessRepositoryRef ref) {
    final firebaseDatabase = FirebaseFirestore.instance;
    final userId = ref.watch(userStateNotifierProvider);
    print("user ${userId.email}");
    final userBusinessRemoteDataSource = FirebaseUserBusinessRemoteDataSource(database: firebaseDatabase, userId: userId.userId);
    
    return UserBusinessRepository(userBusinessRemoteDataSource);
}