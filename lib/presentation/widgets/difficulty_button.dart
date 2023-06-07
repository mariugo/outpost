import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:outpost/assets.dart';
import 'package:outpost/styles.dart';

class DifficultyBtn extends StatelessWidget {
  const DifficultyBtn({
    super.key,
    required this.selected,
    required this.onPressed,
    required this.onHover,
    required this.label,
  });
  final String label;
  final bool selected;
  final VoidCallback onPressed;
  final void Function(bool hasFocus) onHover;

  @override
  Widget build(BuildContext context) {
    return FocusableControlBuilder(
      onPressed: onPressed,
      onHoverChanged: (_, state) => onHover.call(state.isHovered),
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 250,
            height: 60,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: (!selected && (state.isHovered || state.isFocused))
                      ? 1
                      : 0,
                  duration: .3.seconds,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D1FF).withOpacity(.1),
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                  ),
                ),
                if (state.isHovered || state.isFocused) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D1FF).withOpacity(.1),
                    ),
                  ),
                ],
                if (selected) ...[
                  CenterLeft(
                    child: Image.asset(AssetPaths.titleSelectedLeft),
                  ),
                  CenterRight(
                    child: Image.asset(AssetPaths.titleSelectedRight),
                  ),
                ],
                Center(
                  child: Text(label.toUpperCase(), style: TextStyles.btn),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
