import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);
  categoryMealsdata(String idCategory, String token) async {
    var response =
        await crud.getHeadData('${ApiLink.category}$idCategory', token);
    return response.fold((l) => l, (r) => r);
  }
}
