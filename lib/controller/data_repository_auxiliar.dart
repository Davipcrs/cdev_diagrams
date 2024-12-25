import 'package:flutter_riverpod/flutter_riverpod.dart';

final nodeConnectionIdCreationController = StateProvider((_) => 0);
final nodeIdCreationController = StateProvider((_) => 0);
final nodeIdSelected = StateProvider((_) => 0);
final nodeGlobalLockProvider = StateProvider((_) => false);
