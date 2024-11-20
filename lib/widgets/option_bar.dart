// Add widgets
// https://chatgpt.com/g/g-cZPwvslfA-flutter/c/6732d832-2d24-800b-b460-ba6b9e4ead7c

import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget {
  const OptionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300, minWidth: 300),
      child: Container(
        // Creating Elevation
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text("Add Widget"),
              ),
              OutlinedButton(
                  onPressed: () {}, child: Text("Create Node Connection")),
            ],
          ),
        ),
      ),
    );
  }
}
