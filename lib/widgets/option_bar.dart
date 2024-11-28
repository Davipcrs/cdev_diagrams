// Add widgets
// https://chatgpt.com/g/g-cZPwvslfA-flutter/c/6732d832-2d24-800b-b460-ba6b9e4ead7c

import 'package:cdev_diagrams/controller/node_connections_controller.dart';
import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/controller/selected_node_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/node_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

class OptionBar extends ConsumerStatefulWidget {
  const OptionBar({super.key});

  @override
  ConsumerState<OptionBar> createState() => _OptionBarState();
}

class _OptionBarState extends ConsumerState<OptionBar> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  Color auxiliarColor = Colors.blue;
  NodeData data = NodeData();

  @override
  Widget build(BuildContext context) {
    data = ref.watch(selectNodeDataProvider);
    if (data.title != null) {
      titleController.text = data.title!;
    }
    if (data.desc != null) {
      descController.text = data.desc!;
    }
    if (data.color != null) {
      auxiliarColor = data.color!;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300, minWidth: 300),
      child: PhysicalModel(
        color: Theme.of(context).colorScheme.surface,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      int counter = ref.watch(nodeCounterProvider);
                      data.title = titleController.text;
                      data.desc = descController.text;
                      data.color = auxiliarColor;
                      data.position = Offset.zero;
                      data.nodeId = counter + 1;
                      ref.read(nodeCounterProvider.notifier).state =
                          counter + 1;
                      ref.read(nodeList.notifier).state.add(
                            nodeContainer(
                                lockVariable: ref.watch(nodeGlobalLockProvider),
                                data: data,
                                ref: ref,
                                context: context),
                          );
                    },
                    child: Text("New Node"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        titleController.text = '';
                        descController.text = '';
                        auxiliarColor = Colors.blue;
                        ref.invalidate(selectNodeDataProvider);
                        ref.invalidate(isNodeSelected);
                      });
                    },
                    child: Text("Clear Selection"),
                  ),
                ],
              ),
              TextField(
                controller: titleController,
              ),
              TextField(
                controller: descController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 40,
                  ),
                  child: InkWell(
                    onTap: () async {
                      Color? auxiliar = await showColorPicker(context: context);

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
                children: [
                  Text("Lock: "),
                  Switch.adaptive(
                    value: ref.watch(nodeGlobalLockProvider),
                    onChanged: (value) =>
                        ref.read(nodeGlobalLockProvider.notifier).state = value,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Line Mode:"),
                  Switch.adaptive(
                      value: ref.watch(nodeConnectionsIsActive),
                      onChanged: ref.watch(isNodeSelected)
                          ? (value) => ref
                              .read(nodeConnectionsIsActive.notifier)
                              .state = value
                          : null),
                ],
              )
              // Implement this list view of all widgets (Nodes and Lines)
              //Container(child: ListView.builder(itemBuilder: itemBuilder))
            ],
          ),
        ),
      ),
    );
  }
}
