import 'package:cdev_diagrams/controller/export_to_json_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget exporter(BuildContext context, WidgetRef ref) {
  Future<Uint8List?> byteData;
  return Dialog(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Export data: "),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    String jsonString = exportToJson(ref);
                    myPluginJsonDownload(jsonString);
                  },
                  child: const Text("Export in Json"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    byteData = ref
                        .read(widgetToImageControllerProvider.notifier)
                        .state
                        .capture();

                    await myPluginDownload(byteData);
                  },
                  child: const Text("Export To Image"),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: const Text(
                    "A Download will start soon, after choosing the type of export"),
              ),
            ],
          )
          //Image.memory(byteData!),
        ],
      ),
    ),
  );
}

Widget imagePreview() {
  return const Dialog();
}
