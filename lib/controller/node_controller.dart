import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

final nodeCounterProvider = StateProvider((_) => 0);
final nodeList = StateProvider<List<Widget>>((_) {
  return List<Widget>.empty(growable: true);
});
