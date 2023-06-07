import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:outpost/presentation/widgets/difficulty_button.dart';

class DifficultyBtns extends StatelessWidget {
  const DifficultyBtns({
    super.key,
    required this.difficulty,
    required this.onDifficultyPressed,
    required this.onDifficultyFocused,
  });

  final int difficulty;
  final void Function(int difficulty) onDifficultyPressed;
  final void Function(int? difficulty) onDifficultyFocused;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DifficultyBtn(
          label: 'Casual',
          selected: difficulty == 0,
          onPressed: () => onDifficultyPressed(0),
          onHover: (over) => onDifficultyFocused(over ? 0 : null),
        ),
        DifficultyBtn(
          label: 'Normal',
          selected: difficulty == 1,
          onPressed: () => onDifficultyPressed(1),
          onHover: (over) => onDifficultyFocused(over ? 1 : null),
        ),
        DifficultyBtn(
          label: 'Hardcore',
          selected: difficulty == 2,
          onPressed: () => onDifficultyPressed(2),
          onHover: (over) => onDifficultyFocused(over ? 2 : null),
        ),
        const Gap(20),
      ],
    );
  }
}
