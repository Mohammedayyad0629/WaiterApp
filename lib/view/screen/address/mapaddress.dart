import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/addresscontroller.dart';
import '../../../core/class/handlingview.dart';
import '../../../core/constant/color.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddaAdressController());
    return Scaffold(
        body: GetBuilder<AddaAdressController>(
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
                                onTap: (latlong) {
                                  controller.addMarker(latlong);
                                },
                                initialCameraPosition: controller.kGooglePlex!,
                                onMapCreated:
                                    (GoogleMapController controllerMap) {
                                  controller.addMapController!
                                      .complete(controllerMap);
                                },
                              ),
                              Positioned(
                                bottom: 15,
                                left: 80,
                                right: 80,
                                child: Container(
                                  // padding: EdgeInsets.symmetric(horizontal: 50),
                                  height: 57,
                                  decoration: BoxDecoration(
                                      color: AppColor.maincolor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextButton(
                                    onPressed: () {
                                      controller.goto();
                                    },
                                    child: Text(
                                      'Next',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )));
  }
}
