import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final colorsIndexProvider =
    StateNotifierProvider<ColorIndex, int>((ref) => ColorIndex());

class ColorIndex extends StateNotifier<int> {
  ColorIndex() : super(0);

  setIndex(int index) {
    state = 0;
    state = index;
  }
}
