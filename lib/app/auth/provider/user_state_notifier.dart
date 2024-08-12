import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_state_notifier.g.dart';

@Riverpod(keepAlive: true)    
class UserStateNotifier extends _$UserStateNotifier {
  
  @override
  UserState build() { 
    ref.keepAlive();
    return const UserState(userId: "", firstName: "",  lastName:  "", email: "e");
  }
  
 
  update(UserState newUpdate) {
    state = newUpdate;
  }
}
