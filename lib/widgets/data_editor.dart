import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

Widget dataEditor(BuildContext context, WidgetRef ref) {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
  Color? auxiliarColor = Colors.blue;
  int id = 0;

  id = ref.watch(nodeIdSelected);
  late NodeData data;
  if (id == 0) {
    data = NodeData();
  } else {
    List nodes = ref.watch(nodesProvider);
    for (final NodeData item in nodes) {
      if (item.nodeId == id) {
        data = item;
      }
    }
  }

  titleController.text = data.title.toString();
  descController.text = data.desc.toString();
  xController.text = data.position.dx.toString();
  yController.text = data.position.dy.toString();
  auxiliarColor = data.color;
  return StatefulBuilder(
    builder: (context, setState) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 0.5),
                      ),
                    ),
                    controller: titleController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Desc",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 0.5),
                      ),
                    ),
                    controller: descController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 250,
                      maxHeight: 40,
                    ),
                    child: InkWell(
                      onTap: () async {
                        Color? auxiliar =
                            await showColorPicker(context: context);

                        if (auxiliar != null) {
                          setState(() {
                            auxiliarColor = auxiliar;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: auxiliarColor,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 125, maxHeight: 40),
                        child: TextField(
                          controller: xController,
                          decoration: InputDecoration(
                            labelText: "Pos: X",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 125, maxHeight: 40),
                        child: TextField(
                          controller: yController,
                          decoration: InputDecoration(
                            labelText: "Pos: Y",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 0.5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          NodeData newData = NodeData(
                            nodeId: data.nodeId,
                            title: titleController.text,
                            desc: descController.text,
                            color: auxiliarColor,
                            position: Offset(
                              double.parse(xController.text),
                              double.parse(yController.text),
                            ),
                          );

                          ref
                              .read(nodesProvider.notifier)
                              .removeNode(nodeId: data.nodeId!);
                          ref
                              .read(nodesProvider.notifier)
                              .addNode(node: newData);
                          Navigator.pop(context);
                        },
                        child: Text("Confirm Edit"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
