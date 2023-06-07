import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:outpost/assets.dart';
import 'package:outpost/common/shader_effect.dart';
import 'package:outpost/common/ticking_builder.dart';
import 'package:outpost/styles.dart';
import 'package:provider/provider.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
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
        ).animate().fadeIn(delay: .8.seconds, duration: .7.seconds),
        Text('INTO THE UNKNOWN', style: TextStyles.h3).animate().fadeIn(
              delay: 1.seconds,
              duration: .7.seconds,
            ),
      ],
    );
    return Consumer<FragmentPrograms?>(
      builder: (context, fragmentPrograms, _) {
        if (fragmentPrograms == null) return content;
        return TickingBuilder(
          builder: (context, time) {
            return AnimatedSampler(
              (image, size, canvas) {
                const double overdrawPx = 30;
                final shader = fragmentPrograms.ui.fragmentShader();
                shader
                  ..setFloat(0, size.width)
                  ..setFloat(1, size.height)
                  ..setFloat(2, time)
                  ..setImageSampler(0, image);
                Rect rect = Rect.fromLTWH(-overdrawPx, -overdrawPx,
                    size.width + overdrawPx, size.height + overdrawPx);
                canvas.drawRect(rect, Paint()..shader = shader);
              },
              child: content,
            );
          },
        );
      },
    );
  }
}
