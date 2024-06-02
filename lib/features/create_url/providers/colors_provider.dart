import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorsProvider = Provider<List<Color>>((ref) {
  return [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.amber,
  ];
});

final colorsIndexProvider =
    StateNotifierProvider<ColorIndex, int>((ref) => ColorIndex());

class ColorIndex extends StateNotifier<int> {
  ColorIndex() : super(0);

  setIndex(int index) {
    state = index;
  }
}
