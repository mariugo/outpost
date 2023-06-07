import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';

import 'package:outpost/common/ui_scaler.dart';
import 'package:outpost/presentation/widgets/difficulty_buttons.dart';
import 'package:outpost/presentation/widgets/start_button.dart';
import 'package:outpost/presentation/widgets/title_text.dart';

class TitleScreenUi extends StatelessWidget {
  final int difficulty;
  final void Function(int difficulty) onDifficultyPressed;
  final void Function(int? difficulty) onDifficultyFocused;
  final VoidCallback onStartPressed;

  const TitleScreenUi({
    Key? key,
    required this.difficulty,
    required this.onDifficultyPressed,
    required this.onDifficultyFocused,
    required this.onStartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
      child: Stack(
        children: [
          const TopLeft(
            child: UiScaler(
              alignment: Alignment.topLeft,
              child: TitleText(),
            ),
          ),
          BottomLeft(
            child: UiScaler(
              alignment: Alignment.bottomLeft,
              child: DifficultyBtns(
                difficulty: difficulty,
                onDifficultyPressed: onDifficultyPressed,
                onDifficultyFocused: onDifficultyFocused,
              ),
            ),
          ),
          BottomRight(
            child: UiScaler(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 40),
                child: StartBtn(onPressed: onStartPressed),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
