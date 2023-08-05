import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ResetPassword {
  Crud crud;
  ResetPassword(this.crud);
  resetkData(String email, String password) async {
    var response = await crud.postData(
        ApiLink.resetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
