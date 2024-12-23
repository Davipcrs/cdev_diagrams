// Add widgets
// https://chatgpt.com/g/g-cZPwvslfA-flutter/c/6732d832-2d24-800b-b460-ba6b9e4ead7c

import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/connection_dialog.dart';
import 'package:cdev_diagrams/widgets/data_editor.dart';
import 'package:cdev_diagrams/widgets/list_all_connections.dart';
import 'package:cdev_diagrams/widgets/list_all_nodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

// @DOCSTART
// ### option_bar.dart (OptionBar)
// File Responsible to the left Option bar in the application @NL
// Contains the Definition of the ConsumerStatefulWidget OptionsBar @NL
// @CBS dart
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
// @CBE
// @NL
// @DOCEND

// @ID This file recieves data from this function: @NL
// @DOCSTART
// @CBS dart
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

// @CBE
// @NL
// @DOCEND

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
    // @DOCSTART
    // The Width and Heights of this widget: @NL
    // @CBS dart
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300, minWidth: 300),
      child: PhysicalModel(
        // @CBE
        // @NL
        // @DOCEND
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
              TextField(
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
                  ConstrainedBox(
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    const Text("Lock: "),
                    Switch.adaptive(
                      value: ref.watch(nodeGlobalLockProvider),
                      onChanged: (value) => ref
                          .read(nodeGlobalLockProvider.notifier)
                          .state = value,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  // Add Here the edit dialog
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        child: const Text("Add Node Connection")),

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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        if (ref.watch(nodeIdSelected) == 0) {
                          return;
                        } else {
                          showAdaptiveDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  dataEditor(context, ref));
                        }
                      },
                      child: const Text("Edit Node"),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 280,
                  minWidth: 280,
                  maxHeight: 400,
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Theme.of(context).colorScheme.primary,
                        unselectedLabelColor:
                            Theme.of(context).colorScheme.onSurface,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        tabs: const [
                          Tab(text: "Nodes"),
                          Tab(text: "Connections"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Center(
                              child: listAllNodes(
                                context: context,
                                dataList: ref.watch(nodesProvider),
                              ),
                            ),
                            Center(
                              child: listAllConnections(
                                context: context,
                                dataList: ref.watch(connectionsProvider),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("Export"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
