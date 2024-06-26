import 'package:nex_spot_app/app/auth/models/data/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_state_notifier.g.dart';

@riverpod
class UserStateNotifier extends _$UserStateNotifier {
  
  @override
  UserState build() => const UserState(firstName: "",  lastName:  "", email: "");
 
  update(UserState newUpdate) {
    state = newUpdate;
  }
}