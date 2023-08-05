import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waiter/data/modle/categoriemodle.dart';
import 'package:waiter/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/homedata.dart';
import '../../data/modle/allrestaurantsmodle.dart';
import '../../data/modle/bestproductsmodel.dart';
import '../../data/modle/offerproductsmodle.dart';
import '../../data/modle/profilemodle.dart';
import 'package:dio/dio.dart' as dio;

class HomepageController extends GetxController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  HomeData homeData = HomeData(Get.find());
  Rx<AllCategriesModel> dataCategories = AllCategriesModel().obs;
  Rx<BestProductsModel> dataBestProducts = BestProductsModel().obs;
  Rx<AllRestaurantsModle> dataAllRestaurants = AllRestaurantsModle().obs;
  Rx<OfferProductsModle> dataOfferProducts = OfferProductsModle().obs;
  Rx<ProfileModle> profileModle = ProfileModle().obs;
  late StatusRequest statusRequest;
  GlobalKey<FormState> textKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController addrees;
  late TextEditingController name;
  late TextEditingController mobile;
  ImageSource? source;
  bool isOpen = true;
  File? myimage;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);
      myimage = img;
    } on PlatformException catch (e) {
      print(e);
    }
    sendImage();
    log('message');

    update();
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void sendImage() async {
    dio.Dio dio2 = dio.Dio();

    dio.MultipartFile imageFile = await dio.MultipartFile.fromFile(
      myimage!.path,
      filename: myimage!.path.split('/').last,
    );

    dio.FormData formData = dio.FormData.fromMap({
      'photo': imageFile,
    });
    String tokeni = myServices.sharedPreferences.getString('token')!;
    dio.Options options = dio.Options(
      headers: {
        'Authorization': 'Bearer $tokeni',
        // Add any other headers as needed
      },
    );
    try {
      dio.Response response = await dio2.post(ApiLink.changephoto,
          data: formData, options: options);
      // Handle the response as needed
      if (response.data['status'] == true) {
        getProfileData();
      }
      log(response.data);
    } catch (e) {
      // Handle any errors
      print(e);
    }
    update();
  }

  getProfileData() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData
        .getProfileData(myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        profileModle.value = ProfileModle.fromJson(response);
        email = TextEditingController(text: profileModle.value.data!.email);
        password = TextEditingController(text: 'Password');
        name = TextEditingController(text: profileModle.value.data!.name);
        mobile = TextEditingController(text: profileModle.value.data!.mobile);
        addrees = TextEditingController(text: 'Addrees');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getChangePhotoeData() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData.getChangePhotoData(
        myimage!, myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getEditeProfileData() async {
    if (textKey.currentState!.validate()) {
      statusRequest = StatusRequest.loding;
      var response = await homeData.getUpdateProfileData(email.text, name.text,
          mobile.text, myServices.sharedPreferences.getString('token')!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print('ress $response');
        if (response['status']) {
          profileModle.value = ProfileModle.fromJson(response);
          Get.snackbar('ُWarning !', 'The data has been modified successfully');
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  getDataCategorie() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData.getDataCategories();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        dataCategories.value = AllCategriesModel.fromJson(response);
        getProfileData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  logOut() {
    myServices.sharedPreferences.setString('step', "1");
    Get.offAllNamed(NameRoutes.login);
  }

  getBestProducts() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData.getBestProducts();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        dataBestProducts.value = BestProductsModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getOfferProducts() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData.getOfferProducts();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        dataOfferProducts.value = OfferProductsModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getAllRestaurants() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData.getAllRestaurants();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        dataAllRestaurants.value = AllRestaurantsModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    getAllRestaurants();
    getDataCategorie();
    getOfferProducts();
    getBestProducts();
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  bool enabled = false;
  changeenabled() {
    if (enabled == false) {
      enabled = true;
    } else {
      enabled = false;
    }
    update();
  }

  @override
  void onInit() {
    getProfileData();

    initialData();
    super.onInit();
  }

  goItems(categories, selectedcat, categoryid) {
    Get.toNamed(NameRoutes.items, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      'categoryid': categoryid
    });
  }
}

// class SearchController extends GetxController {
//   ItemsData itemsData = ItemsData(Get.find());
//   List<ItemsModle> searchList = [];
//   late StatusRequest statusRequest;
//   TextEditingController? search;
//   bool isSearch = false;
//   checkSearch(val) {
//     if (val == "") {
//       isSearch = false;
//     }
//     update();
//   }

//   onSearchItems() {
//     isSearch = true;
//     searchItems();
//     update();
//   }

  // searchItems() async {
  //   statusRequest = StatusRequest.loding;
  //   var response = await itemsData.searchData(search!.text);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       searchList.clear();
  //       List responseData = response['data'];
  //       searchList.addAll(responseData.map((e) => ItemsModle.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }
// }
