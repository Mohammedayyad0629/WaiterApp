import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  getFavoriteData(String token) async {
    var response = await crud.getHeadData(ApiLink.favorite, token);
    return response.fold((l) => l, (r) => r);
  }

  favoriteAddOrRemove(String idMeal, String token) async {
    var response =
        await crud.putheadData('${ApiLink.favoriteAddOrRemove}$idMeal', token);
    return response.fold((l) => l, (r) => r);
  }
}
