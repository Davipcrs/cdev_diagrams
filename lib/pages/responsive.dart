import 'package:cdev_diagrams/pages/homepage_desktop.dart';
import 'package:cdev_diagrams/pages/homepage_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Responsive extends ConsumerWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = 0;
    width = MediaQuery.sizeOf(context).width;
    if (width > 600) {
      return const HomepageDesktop();
    } else {
      return const HomepageMobile();
    }
  }
}
