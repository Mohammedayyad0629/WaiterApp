import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class IconAndTitle extends StatelessWidget {
  const IconAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageAsset.icon,
          width: 150,
        ),
        ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [AppColor.maincolor, AppColor.maincoloroff])
                .createShader(bounds),
            child: Text(
              'Waiter',
              style: Theme.of(context).textTheme.displayMedium,
            )),
        Text(
          'Deliever Favorite Food',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
