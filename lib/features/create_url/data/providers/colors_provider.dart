import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_url_data_provider.dart';

final colorsProvider = Provider<List<Color>>((ref) => const [
      Color(0xFFFECACA),
      Color(0xFFBBF7D0),
      Color(0xFFBFDBFE),
      Color(0xFFFBCFE8),
      Color(0xFFFDE68A),
    ]);

final backgroundColorsProvider = Provider<List<Color>>((ref) => const [
      Color(0xFFE80000),
      Color(0xFF12B700),
      Color(0xFF0015B5),
      Color(0xFFFF00C7),
      Color(0xFFD68400),
    ]);

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
    NotifierProvider<ColorIndex, int>(() => ColorIndex());

class ColorIndex extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) {
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
