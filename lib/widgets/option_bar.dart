// Add widgets
// https://chatgpt.com/g/g-cZPwvslfA-flutter/c/6732d832-2d24-800b-b460-ba6b9e4ead7c

import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/connection_dialog.dart';
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
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
  Color auxiliarColor = Colors.blue;
  NodeData data = NodeData();
  int id = 0;

  setData() {
    id = ref.watch(nodeIdSelected);
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
  }

  @override
  Widget build(BuildContext context) {
    setData();
    if (data.title != null) {
      titleController.text = data.title!;
    }
    if (data.desc != null) {
      descController.text = data.desc!;
    }
    if (data.color != null) {
      auxiliarColor = data.color!;
    }
    xController.text = data.position.dx.toString();
    yController.text = data.position.dy.toString();
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
                      NodeData newData = NodeData();
                      newData.nodeId = ref.watch(nodeIdCreationController) + 1;

                      newData.title = titleController.text;
                      newData.desc = descController.text;
                      newData.color = auxiliarColor;
                      newData.position = Offset(double.parse(xController.text),
                          double.parse(yController.text));
                      ref.read(nodesProvider.notifier).addNode(node: newData);
                      ref
                          .read(nodeIdCreationController.notifier)
                          .update((state) => state + 1);
                      ref.invalidate(nodeIdSelected);
                      /*
                      ref.read(nodeList.notifier).state.add(
                            nodeContainer(
                                lockVariable: ref.watch(nodeGlobalLockProvider),
                                data: newData,
                                ref: ref,
                                context: context),
                          );
                      */
                    },
                    child: const Text("New Node"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        titleController.text = '';
                        descController.text = '';
                        auxiliarColor = Colors.blue;
                        ref.invalidate(nodeIdSelected);
                      });
                    },
                    child: const Text("Clear Selection"),
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
                  constraints: const BoxConstraints(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 125, maxHeight: 40),
                    child: TextField(
                      controller: xController,
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 125, maxHeight: 40),
                    child: TextField(
                      controller: yController,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Text("Lock: "),
                  Switch.adaptive(
                    value: ref.watch(nodeGlobalLockProvider),
                    onChanged: (value) =>
                        ref.read(nodeGlobalLockProvider.notifier).state = value,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        if (ref.watch(nodeIdSelected) == 0) {
                          return;
                        } else {
                          showAdaptiveDialog(
                              context: context,
                              builder: createConnectionDialog);
                        }
                      },
                      child: const Text("Add Node Connection"))
                  //Text("Line Mode:"),
                  /*
                  Switch.adaptive(
                      value: ref.watch(nodeConnectionsIsActive),
                      onChanged: ref.watch(isNodeSelected)
                          ? (value) => ref
                              .read(nodeConnectionsIsActive.notifier)
                              .state = value
                          : null),
                          */
                ],
              ),

              // Implement this list view of all widgets (Nodes and Lines)
              //Container(child: ListView.builder(itemBuilder: itemBuilder))
            ],
          ),
        ),
      ),
    );
  }
}
