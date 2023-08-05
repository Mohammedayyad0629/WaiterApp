import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class RestaurantData {
  Crud crud;
  RestaurantData(this.crud);
  getRestaurantdata(String idResturent) async {
    var response = await crud.getData('${ApiLink.getRestaurant}/$idResturent');
    return response.fold((l) => l, (r) => r);
  }

  getDataCategories(String idResturent) async {
    var response = await crud.getData('${ApiLink.homeCategories}/$idResturent');
    return response.fold((l) => l, (r) => r);
  }

  getofferproductsrestaurant(String idResturent) async {
    var response =
        await crud.getData('${ApiLink.offerproductsrestaurant}$idResturent');
    return response.fold((l) => l, (r) => r);
  }

  getbestproductsrestaurant(String page, String idResturent) async {
    var response = await crud
        .getData('${ApiLink.bestProdctRestaurant}$idResturent?page=$page');
    return response.fold((l) => l, (r) => r);
  }

  mealsrestaurant(String page, String idResturent, String idCategory) async {
    var response = await crud.getData(
        '${ApiLink.mealsRestaurant}$idCategory/$idResturent?page=$page');
    return response.fold((l) => l, (r) => r);
  }
}
