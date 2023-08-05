import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  postData(String name, String address, String mobile, double lat, double long,
      String token) async {
    var response = await crud.postheadData(
        ApiLink.addaddress,
        {
          "name": name,
          "address": address,
          "mobile": mobile,
          'latitude': lat.toString(),
          'longitude': long.toString()
        },
        token);
    return response.fold((l) => l, (r) => r);
  }

  addressviwe(String token) async {
    var response = await crud.getHeadData(ApiLink.addressView, token);
    return response.fold((l) => l, (r) => r);
  }

  deleteaddress(String idAddress, String token) async {
    var response =
        await crud.deleteheadData('${ApiLink.addressDelete}$idAddress', token);
    return response.fold((l) => l, (r) => r);
  }
}
