import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class TheMealData {
  Crud crud;
  TheMealData(this.crud);
  getMealdata(String idMeal) async {
    var response = await crud.getData('${ApiLink.theMeal}$idMeal');
    return response.fold((l) => l, (r) => r);
  }
}
