import 'package:flutter/material.dart';

class OrbShaderConfig {
  final double zoom;
  final double exposure;
  final double roughness;
  final double metalness;
  final Color materialColor;
  final double lightRadius;
  final Color lightColor;
  final double lightBrightness;
  final double ior;
  final double lightAttenuation;
  final Color ambientLightColor;
  final double ambientLightBrightness;
  final double ambientLightDepthFactor;
  final double lightOffsetX;
  final double lightOffsetY;
  final double lightOffsetZ;

  const OrbShaderConfig({
    this.zoom = 0.3,
    this.exposure = 0.4,
    this.roughness = 0.3,
    this.metalness = 0.3,
    this.materialColor = const Color.fromARGB(255, 242, 163, 138),
    this.lightRadius = 0.75,
    this.lightColor = const Color(0xFFFFFFFF),
    this.lightBrightness = 15.00,
    this.ior = 0.5,
    this.lightAttenuation = 0.5,
    this.ambientLightColor = const Color(0xFFFFFFFF),
    this.ambientLightBrightness = 0.2,
    this.ambientLightDepthFactor = 0.3,
    this.lightOffsetX = 0,
    this.lightOffsetY = 0.1,
    this.lightOffsetZ = -0.66,
  })  : assert(zoom >= 0 && zoom <= 1),
        assert(exposure >= 0),
        assert(metalness >= 0 && metalness <= 1),
        assert(lightRadius >= 0),
        assert(lightBrightness >= 1),
        assert(ior >= 0 && ior <= 2),
        assert(lightAttenuation >= 0 && lightAttenuation <= 1),
        assert(ambientLightBrightness >= 0);

  OrbShaderConfig copyWith({
    double? zoom,
    double? exposure,
    double? roughness,
    double? metalness,
    Color? materialColor,
    double? lightRadius,
    Color? lightColor,
    double? lightBrightness,
    double? ior,
    double? lightAttenuation,
    Color? ambientLightColor,
    double? ambientLightBrightness,
    double? ambientLightDepthFactor,
    double? lightOffsetX,
    double? lightOffsetY,
    double? lightOffsetZ,
  }) {
    return OrbShaderConfig(
      zoom: zoom ?? this.zoom,
      exposure: exposure ?? this.exposure,
      roughness: roughness ?? this.roughness,
      metalness: metalness ?? this.metalness,
      materialColor: materialColor ?? this.materialColor,
      lightRadius: lightRadius ?? this.lightRadius,
      lightColor: lightColor ?? this.lightColor,
      lightBrightness: lightBrightness ?? this.lightBrightness,
      ior: ior ?? this.ior,
      lightAttenuation: lightAttenuation ?? this.lightAttenuation,
      ambientLightColor: ambientLightColor ?? this.ambientLightColor,
      ambientLightBrightness:
          ambientLightBrightness ?? this.ambientLightBrightness,
      ambientLightDepthFactor:
          ambientLightDepthFactor ?? this.ambientLightDepthFactor,
      lightOffsetX: lightOffsetX ?? this.lightOffsetX,
      lightOffsetY: lightOffsetY ?? this.lightOffsetY,
      lightOffsetZ: lightOffsetZ ?? this.lightOffsetZ,
    );
  }
}
