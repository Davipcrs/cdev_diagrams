import 'package:cdev_diagrams/pages/diagram_page_desktop.dart';
import 'package:cdev_diagrams/pages/diagram_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponsiveDiagramPage extends ConsumerWidget {
  const ResponsiveDiagramPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = 0;
    width = MediaQuery.sizeOf(context).width;
    if (width > 600) {
      return const DiagramPageDesktop();
    } else {
      return const DiagramPageMobile();
    }
  }
}
