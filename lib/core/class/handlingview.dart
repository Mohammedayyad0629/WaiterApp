import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:waiter/core/class/statusrequest.dart';

import '../constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loding
        ? Center(child: Lottie.asset(ImageAsset.loding))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(ImageAsset.offline2))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(ImageAsset.serverfailure))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(ImageAsset.nodata))
                    : widget;
  }
}

class HandlingNoDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingNoDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loding
        ? Center(
            child: Lottie.asset(
            ImageAsset.loding2,
          ))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(ImageAsset.offline2))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(ImageAsset.serverfailure))
                : widget;
  }
}
