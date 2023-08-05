import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password, String token) async {
    var response = await crud.postData(ApiLink.login, {
      "mobile": email,
      "password": password,
      'fcm_token': token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
