import 'package:flutter/material.dart';
import 'package:outpost/assets.dart';
import 'package:outpost/presentation/widgets/title_screen_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:outpost/styles.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  Color get _emitColor =>
      AppColors.emitColors[_difficultyOverride ?? _difficulty];
  Color get _orbColor =>
      AppColors.orbColors[_difficultyOverride ?? _difficulty];
  int _difficulty = 0;
  int? _difficultyOverride;
  final _finalReceiveLightAmt = 0.7;
  final _finalEmitLightAmt = 0.5;

  void _handleDifficultyPressed(int value) {
    setState(() => _difficulty = value);
  }

  void _handleDifficultyFocused(int? value) {
    setState(() => _difficultyOverride = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _AnimatedColors(
          orbColor: _orbColor,
          emitColor: _emitColor,
          builder: (_, orbColor, emitColor) {
            return Stack(
              children: [
                Image.asset(AssetPaths.titleBgBase),
                _LitImage(
                  color: _orbColor,
                  imgSrc: AssetPaths.titleBgReceive,
                  lightAmt: _finalReceiveLightAmt,
                ),
                _LitImage(
                  imgSrc: AssetPaths.titleMgBase,
                  color: _orbColor,
                  lightAmt: _finalReceiveLightAmt,
                ),
                _LitImage(
                  imgSrc: AssetPaths.titleMgReceive,
                  color: _orbColor,
                  lightAmt: _finalReceiveLightAmt,
                ),
                _LitImage(
                  imgSrc: AssetPaths.titleMgEmit,
                  color: _emitColor,
                  lightAmt: _finalEmitLightAmt,
                ),
                Image.asset(AssetPaths.titleFgBase),
                _LitImage(
                  imgSrc: AssetPaths.titleFgReceive,
                  color: _orbColor,
                  lightAmt: _finalReceiveLightAmt,
                ),
                _LitImage(
                  imgSrc: AssetPaths.titleFgEmit,
                  color: _emitColor,
                  lightAmt: _finalEmitLightAmt,
                ),
                Positioned.fill(
                  child: TitleScreenUi(
                    difficulty: _difficulty,
                    onDifficultyFocused: _handleDifficultyFocused,
                    onDifficultyPressed: _handleDifficultyPressed,
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 1.seconds, delay: .3.seconds);
          },
        ),
      ),
    );
  }
}

class _LitImage extends StatelessWidget {
  const _LitImage({
    required this.color,
    required this.imgSrc,
    required this.lightAmt,
  });
  final Color color;
  final String imgSrc;
  final double lightAmt;

  @override
  Widget build(BuildContext context) {
    final hsl = HSLColor.fromColor(color);
    return Image.asset(
      imgSrc,
      color: hsl.withLightness(hsl.lightness * lightAmt).toColor(),
      colorBlendMode: BlendMode.modulate,
    );
  }
}

class _AnimatedColors extends StatelessWidget {
  const _AnimatedColors({
    required this.emitColor,
    required this.orbColor,
    required this.builder,
  });

  final Color emitColor;
  final Color orbColor;

  final Widget Function(BuildContext context, Color orbColor, Color emitColor)
      builder;

  @override
  Widget build(BuildContext context) {
    final duration = .5.seconds;
    return TweenAnimationBuilder(
      tween: ColorTween(begin: emitColor, end: emitColor),
      duration: duration,
      builder: (_, emitColor, __) {
        return TweenAnimationBuilder(
          tween: ColorTween(begin: orbColor, end: orbColor),
          duration: duration,
          builder: (context, orbColor, __) {
            return builder(context, orbColor!, emitColor!);
          },
        );
      },
    );
  }
}
