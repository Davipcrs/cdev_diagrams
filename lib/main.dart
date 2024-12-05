import 'package:cdev_diagrams/pages/responsive_diagram_page.dart';
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
    super.initState();

    /*
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
    */
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
      home: const ResponsiveDiagramPage(),
    );
  }
}
