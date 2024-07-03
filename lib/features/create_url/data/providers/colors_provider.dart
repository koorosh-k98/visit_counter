import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_url_data_provider.dart';

final colorsProvider = Provider<List<Color>>((ref) {
  return [
    const Color(0xFFFECACA),
    const Color(0xFFBBF7D0),
    const Color(0xFFBFDBFE),
    const Color(0xFFFBCFE8),
    const Color(0xFFFDE68A),
  ];
});

final backgroundColorsProvider = Provider<List<Color>>((ref) {
  return [
    const Color(0xFFE80000),
    const Color(0xFF12B700),
    const Color(0xFF0015B5),
    const Color(0xFFFF00C7),
    const Color(0xFFD68400),
  ];
});

final colorProvider = Provider<Color>((ref) {
  final colors = ref.watch(colorsProvider);
  final index = ref.watch(colorsIndexProvider);
  final randomIndex = ref.watch(randomColorIndexProvider);
  return index >= colors.length ? colors[randomIndex] : colors[index];
});

final backgroundColorProvider = Provider<Color>((ref) {
  final backgroundColors = ref.watch(backgroundColorsProvider);
  final index = ref.watch(colorsIndexProvider);
  final randomIndex = ref.watch(randomColorIndexProvider);
  return index >= backgroundColors.length
      ? backgroundColors[randomIndex]
      : backgroundColors[index];
});

final colorsIndexProvider =
    StateNotifierProvider<ColorIndex, int>((ref) => ColorIndex(ref));

class ColorIndex extends StateNotifier<int> {
  Ref ref;

  ColorIndex(this.ref) : super(0);

  setIndex(int index) {
    state = 0;
    state = index;
    ref.invalidate(randomColorIndexProvider);
    ref.invalidate(createUrlDataProvider);
  }
}

final randomColorIndexProvider = Provider<int>((ref) {
  final colors = ref.watch(colorsProvider);
  return Random().nextInt(colors.length);
});
