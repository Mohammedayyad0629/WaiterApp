import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeForget {
  Crud crud;
  VerifyCodeForget(this.crud);
  checkCode(String email, String verifycode) async {
    var response = await crud.postData(
        ApiLink.verifycodeforget, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
