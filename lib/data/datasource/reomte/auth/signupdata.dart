import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postData(String email, String password, String name, String mobile,
      String token, String lat, String long) async {
    var response = await crud.postData(ApiLink.signup, {
      "email": email,
      "password": password,
      "name": name,
      "mobile": mobile,
      'fcm_token': token,
      'location_lat': lat,
      'location_long': long
    });
    return response.fold((l) => l, (r) => r);
  }
}
