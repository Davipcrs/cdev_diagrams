// Add widgets
// https://chatgpt.com/g/g-cZPwvslfA-flutter/c/6732d832-2d24-800b-b460-ba6b9e4ead7c

import 'package:flutter/material.dart';

Widget optionBar() {
  return ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 300),
    child: Column(
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text("Add Widget"),
        ),
        OutlinedButton(onPressed: () {}, child: Text("Create Node Connection")),
      ],
    ),
  );
}

Dialog insertDataDialog() {
  return Dialog();
}
