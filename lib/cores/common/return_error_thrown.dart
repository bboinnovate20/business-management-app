  import 'package:nex_spot_app/cores/common/returned_status.dart';

userNotExistThrow() {
      return const ReturnedStatus('User Not Exist', false, null);
  }

unknownErrorThrow() {
      return const ReturnedStatus('Something went wrong, try again', false, null);
}