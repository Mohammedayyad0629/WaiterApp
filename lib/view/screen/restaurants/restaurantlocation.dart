import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/address/restaurantlocationcontroller.dart';
import '../../../core/class/handlingview.dart';

class RestaurantLocation extends StatelessWidget {
  const RestaurantLocation({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<RestaurantLocationController>();
    return Scaffold(
        body: GetBuilder<RestaurantLocationController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.kGooglePlex != null)
                        Expanded(
                          child: Stack(
                            children: [
                              GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.marker.toSet(),
                                onTap: (latlong) {},
                                initialCameraPosition: controller.kGooglePlex!,
                                polylines: {
                                  Polyline(
                                    polylineId: const PolylineId("route"),
                                    points: controller.polylineCoordinates,
                                    color: const Color(0xFF7B61FF),
                                    width: 6,
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )));
  }
}
