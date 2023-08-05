import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/addressdata.dart';
import '../../data/modle/addressmodle.dart';

class RestaurantLocationController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  AddressData addressData = AddressData(Get.find());
  Rx<AddressModle> addressModle = AddressModle().obs;
  late double lat_res;
  late double long_res;
  bool click = false;
  Position? position;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? addMapController;
  List<Marker> marker = [];
  List<LatLng> polylineCoordinates = [];

  getCurrentLocation(
      double lat, double long, double myLat, double myLong) async {
    statusRequest = StatusRequest.loding;
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 12.4,
    );
    marker.clear();
    marker.add(
        Marker(markerId: const MarkerId('1'), position: LatLng(myLat, myLong)));
    marker.add(
        Marker(markerId: const MarkerId('2'), position: LatLng(lat, long)));
    void getPolyPoints() async {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyD4Jj3u7QiNkyrvObsNAgUTT7G3h5BRj04', // Your Google Map Key
        PointLatLng(lat, long),
        PointLatLng(myLat, myLong),
      );
      if (result.points.isNotEmpty) {
        result.points.forEach(
          (PointLatLng point) => polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          ),
        );
        update();
      }
    }

    Get.toNamed(
      NameRoutes.restaurantLocation,
    );
    statusRequest = StatusRequest.none;
    update();
    // CameraPosition
  }

  getMyAddress() async {
    statusRequest = StatusRequest.loding;
    var response = await addressData
        .addressviwe(myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    print('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        addressModle.value = AddressModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    lat_res = double.parse(Get.arguments['lat_res']);
    long_res = double.parse(Get.arguments['long_res']);
    getMyAddress();
    super.onInit();
  }
}
