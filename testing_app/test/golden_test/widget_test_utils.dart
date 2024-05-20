import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

mixin TestDefaults {
  static double textScaleSize = Device.iphone11.textScale;
  static Size surfaceSize = Device.iphone11.size;
  static TargetPlatform platform = TargetPlatform.iOS;
}

mixin CustomDevices {
  static const Device iPhone7 = Device(
    name: 'iPhone 7',
    size: Size(375, 667),
    devicePixelRatio: 1,
  );

  static const Device iPhoneSE = Device(
    name: 'iPhone SE',
    size: Size(320, 568),
    devicePixelRatio: 1,
  );

  static const Device iPhone11 = Device(
    name: 'iPhone 11',
    size: Size(414, 896),
    devicePixelRatio: 1,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device samsungGalaxyS7 = Device(
    name: 'Samsung Galaxy S7',
    size: Size(360, 640),
    devicePixelRatio: 1,
  );

  static const Device googlePixel4 = Device(
    name: 'Google Pixel 4',
    size: Size(412, 869),
    devicePixelRatio: 1,
  );

  static const Device desktopSmall = Device(
    name: 'Desktop S',
    size: Size(800, 600),
    devicePixelRatio: 1,
  );

  static const Device desktopMedium = Device(
    name: 'Desktop M',
    size: Size(1280, 1024),
    devicePixelRatio: 1,
  );

  static const Device desktopLarge = Device(
    name: 'Desktop L',
    size: Size(1920, 1080),
    devicePixelRatio: 1,
  );
}
