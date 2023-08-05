import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class PasswordData {
  Crud crud;
  PasswordData(this.crud);
  changepasswordData(
    String oldPassword,
    String password,
    String token,
  ) async {
    var response = await crud.postheadData(
        ApiLink.changepassword,
        {
          "old_password": oldPassword,
          "password": password,
        },
        token);
    return response.fold((l) => l, (r) => r);
  }
}
