import 'package:flutter_riverpod/flutter_riverpod.dart';

// @DOCSTART
// ### data_repository_auxiliar.dart (Data repository Auxiliar) @NL
// File Responsible to hold some StateProviders for some helper functionality @NL
// @CBS dart

final nodeConnectionIdCreationController = StateProvider((_) => 0);
final nodeIdCreationController = StateProvider((_) => 0);
final nodeIdSelected = StateProvider((_) => 0);
final nodeGlobalLockProvider = StateProvider((_) => false);

// @CBE
// @NL
// @DOCEND
