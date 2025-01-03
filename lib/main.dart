import 'package:cdev_diagrams/pages/responsive_diagram_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cdev Diagrams',
      theme: cdevSuiteLightTheme,
      darkTheme: cdevSuiteDarkTheme,
      themeMode: ThemeMode.dark,
      home: const ResponsiveDiagramPage(),
    );
  }
}
