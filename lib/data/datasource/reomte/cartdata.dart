import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  getMyCartData(String token) async {
    var response = await crud.getHeadData(ApiLink.viweCart, token);
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String idMeal, String token) async {
    var response =
        await crud.deleteheadData('${ApiLink.deleteCart}$idMeal', token);
    return response.fold((l) => l, (r) => r);
  }

  addCart(String idMeal, String quantity, String token) async {
    var response = await crud.postheadData(
        '${ApiLink.addCart}$idMeal', {'quantity': quantity}, token);
    return response.fold((l) => l, (r) => r);
  }
}
