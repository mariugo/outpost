import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:outpost/assets.dart';
import 'package:outpost/styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: Offset(-(TextStyles.h1.letterSpacing! * .5), 0),
              child: Text('OUTPOST', style: TextStyles.h1),
            ),
            Image.asset(AssetPaths.titleSelectedLeft, height: 65),
            Text('57', style: TextStyles.h2),
            Image.asset(AssetPaths.titleSelectedRight, height: 65),
          ],
        ),
        Text('INTO THE UNKNOWN', style: TextStyles.h3),
      ],
    );
  }
}
