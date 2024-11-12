import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectNodeProvider = StateProvider((_) => 0);
final selectNodeDataProvider = StateProvider((_) => NodeData());
