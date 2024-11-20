import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/pages/responsive.dart';
import 'package:cdev_diagrams/widgets/node_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.read(nodeList.notifier).state.add(nodeContainer(
        lockVariable: false,
        data: NodeData(
            nodeId: 0, title: "adawd", color: Colors.blue, desc: "das"),
        ref: ref,
        context: context));
    ref.read(nodeList.notifier).state.add(nodeContainer(
        lockVariable: false,
        data: NodeData(
            nodeId: 1, title: "adawd", color: Colors.blue, desc: "das"),
        ref: ref,
        context: context));
    ref.read(nodeList.notifier).state.add(nodeContainer(
        lockVariable: false,
        data: NodeData(
            nodeId: 2, title: "adawd", color: Colors.blue, desc: "das"),
        ref: ref,
        context: context));
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Responsive(),
    );
  }
}
