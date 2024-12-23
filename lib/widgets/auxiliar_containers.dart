import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';

Widget nodeDataAuxiliarContainer(
    {required BuildContext context, required NodeData data}) {
  return Container(
    decoration: BoxDecoration(color: data.color),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Id: ${data.nodeId.toString()}",
              style: TextStyle(),
            ),
            Text("Position: ${data.position.toString()}", style: TextStyle())
          ],
        ),
        Row(
          children: [
            Text("Title: ${data.title}", style: TextStyle()),
          ],
        ),
        Row(
          children: [
            Text("Desc: ${data.desc}", style: TextStyle()),
          ],
        ),
      ],
    ),
  );
}

Widget nodeConnectionsAuxiliarContainer(
    {required BuildContext context, required NodeConnections data}) {
  return Container(
    decoration:
        BoxDecoration(color: Theme.of(context).colorScheme.onSurfaceVariant),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(children: [
          Text("Connection ID:  ${data.connectionId.toString()}")
        ]),
        Row(children: [
          Text("Origin ID: ${data.originId.toString()}"),
          Text("End ID: ${data.destinationId.toString()}")
        ]),
      ],
    ),
  );
}
