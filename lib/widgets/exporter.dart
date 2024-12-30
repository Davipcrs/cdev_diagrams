import 'package:cdev_diagrams/controller/export_to_json_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget exporter(BuildContext context, WidgetRef ref) {
  Uint8List? byteData;
  return Dialog(
    child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Export data: "),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  exportToJson(ref);
                },
                child: Text("Export in Json"),
              ),
              OutlinedButton(
                onPressed: () async {
                  byteData = await ref
                      .read(widgetToImageControllerProvider.notifier)
                      .state
                      .capture();

                  myPluginDownload(byteData!);
                },
                child: Text("Export To Image"),
              ),
            ],
          ),
          //Image.memory(byteData!),
        ],
      ),
    ),
  );
}

Widget imagePreview() {
  return Dialog();
}
