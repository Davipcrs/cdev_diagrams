### option_bar.dart (OptionBar) 
 File Responsible to the left Option bar in the application 
 Contains the Definition of the ConsumerStatefulWidget OptionsBar 
 
``` dart
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
// 
```
 This file recieves data from this function: 
 
``` dart
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
// 
```
 The Width and Heights of this widget: 
 
``` dart
return ConstrainedBox(
     constraints: const BoxConstraints(maxWidth: 300, minWidth: 300),
     child: PhysicalModel(
       // 
```
### node_container.dart (nodeContainer) 
 File Responsible to the nodeContainer (The nodes in the UI) 
### import_from_json.dart (import Function) 
 File Responsible to the load option in the application 
 
``` dart
void importFromJson(Uint8List bytes, WidgetRef ref) {
 String utf8String = utf8.decode(bytes);
 Map<String, dynamic> jsonAsMap = jsonDecode(utf8String);
 Map<String, dynamic> nodesJson = jsonAsMap["nodes"];
 Map<String, dynamic> connectionJson = jsonAsMap["connections"];
  for (final data in nodesJson.entries) {
   NodeData auxiliar = NodeData.fromJson(data.value);
   ref.read(nodesProvider.notifier).addNode(node: auxiliar);
   if (ref.read(nodeIdCreationController) < auxiliar.nodeId!) {
     ref.read(nodeIdCreationController.notifier).state = auxiliar.nodeId!;
   }
 }
  for (final data in connectionJson.entries) {
   NodeConnections auxiliar = NodeConnections.fromJson(data.value);
   ref.read(connectionsProvider.notifier).addConnection(connection: auxiliar);
   if (ref.read(nodeConnectionIdCreationController) < auxiliar.connectionId!) {
     ref.read(nodeConnectionIdCreationController.notifier).state =
         auxiliar.connectionId!;
   }
 }
}
// 
```
### export_to_json_image.dart (Export Options file) 
 File Responsible to the Export options in the program 
 Contains the Definition of the Functions 
 
 - exportToJson 
 - myPluginDownload 
 - myPluginJsonDownload 
 
 Also contains the StateProvider for the widgetToImageControllerProvider 
 
``` dart
String exportToJson(WidgetRef ref) {
 List nodeConnections = ref.read(connectionsProvider);
 List nodesList = ref.read(nodesProvider);
  Map<String, dynamic> json = {};
 json["nodes"] = {};
 json["connections"] = {};
 for (NodeData node in nodesList) {
   json["nodes"][node.nodeId.toString()] = node.toJson();
   //json.update('nodes', json['nodes'].addAll(node.toJson()));
 }
 for (NodeConnections conn in nodeConnections) {
   json["connections"][conn.connectionId.toString()] = conn.toJson();
 }
  return jsonEncode(json);
}
// 
```
 
``` dart
Future<void> myPluginDownload(Future<Uint8List?> promisseByteData) async {
 Uint8List? byteData = await promisseByteData;
 final blob = web.Blob([byteData as JSUint8Array] as JSArray<web.BlobPart>);
 final url = web.URL.createObjectURL(blob);
 final anchor = web.HTMLAnchorElement()
   ..href = url
   ..target = 'blank'
   ..download = 'cdev_diagram_exported.png';
 anchor.click();
 web.URL.revokeObjectURL(url);
 // print(encoded);
}
// 
```
### data_repository_auxiliar.dart (Data repository Auxiliar) 
 File Responsible to hold some StateProviders for some helper functionality 
 
``` dart
final nodeConnectionIdCreationController = StateProvider((_) => 0);
final nodeIdCreationController = StateProvider((_) => 0);
final nodeIdSelected = StateProvider((_) => 0);
final nodeGlobalLockProvider = StateProvider((_) => false);
// 
```
### data_repository.dart (ModelManagers) 
 File Responsible to hold the Providers that save the data of the application 
 Contains the Definition of the: 
 - NodeModelManager 
 - NodeConnectionManager 
 - nodesProvider (Instance of NodeModelManger) 
 - connectionsProvider (Instace of NodeConnectionsManager) 
 
``` dart
class NodeModelManager extends Notifier<List<NodeData>> {
 @override
 build() => [];
  void addNode({required NodeData node}) {
   state = [...state, node];
 }
  void updatePosition({required int nodeId, required Offset newPos}) {
   state = [
     for (final NodeData data in state)
       if (data.nodeId == nodeId) data.updatePos(newPos) else data
   ];
 }
  void updateNode({required NodeData updatedNode}) {
   state = [
     for (final NodeData data in state)
       if (data.nodeId == updatedNode.nodeId) updatedNode else data
   ];
 }
  void removeNode({required int nodeId}) {
   List auxliarList = [];
   for (final NodeData item in state) {
     if (item.nodeId != nodeId) {
       auxliarList.add(item);
     }
   }
   state = [...auxliarList];
 }
}
class NodeConnectionsManager extends Notifier<List<NodeConnections>> {
 @override
 build() => [];
  void addConnection({required NodeConnections connection}) {
   state = [...state, connection];
 }
  void updateConnectionsUsingNode({required nodeId}) {
   List<NodeData> nodes = ref.read(nodesProvider);
   int index = nodes.indexWhere((element) => element.nodeId == nodeId);
   for (final NodeConnections conn in state) {
     if (conn.originId == nodeId) {
       conn.line = Tuple2(nodes[index].position, conn.line!.item2);
     } else if (conn.destinationId == nodeId) {
       conn.line = Tuple2(conn.line!.item1, nodes[index].position);
     }
   }
 }
  void removeConnection({required connId}) {
   state = [
     for (final NodeConnections conn in state)
       if (conn.connectionId != connId) conn
   ];
 }
}
// 
```
### node_connections.dart (NodeConnections) 
 ##### This is a Model File 
 This file is responsible to guard the Model of the connections of the nodes inside the application 
``` dart
class NodeConnections {
 NodeConnections(
     {this.line, this.connectionId, this.originId, this.destinationId});
 Tuple2<Offset, Offset>? line;
 int? connectionId;
 int? originId;
 int? destinationId;
// 
```
 JSON operations (NodeConnections) 
 
``` dart
factory NodeConnections.fromJson(Map<String, dynamic> json) {
   return NodeConnections(
       line: json["line"] != null
           ? Tuple2(
               Offset(
                 double.parse(json["line"]["start"][0]),
                 double.parse(json["line"]["start"][1]),
               ),
               Offset(
                 double.parse(json["line"]["end"][0]),
                 double.parse(json["line"]["end"][1]),
               ),
             )
           : Tuple2(Offset.zero, Offset.zero),
       connectionId: json["connectionId"] as int?,
       originId: json["originId"] as int?,
       destinationId: json["destinationId"] as int?);
 }
// To JSON
 Map<String, dynamic> toJson() {
   return {
     "line": {
       "start": [line?.item1.dx.toString(), line?.item1.dy.toString()],
       "end": [line?.item2.dx.toString(), line?.item2.dy.toString()]
     },
     "connectionId": connectionId,
     "originId": originId,
     "destinationId": destinationId
   };
 }
// 
```
### node_data.dart (NodeData) 
 ##### This is a Model File 
 File Responsible to the NodeData (Title, desc...) in the application 
 
``` dart
class NodeData {
 NodeData(
     {this.nodeId,
     this.title,
     this.color,
     this.desc,
     this.position = Offset.zero});
 int? nodeId;
 String? title;
 Color? color;
 String? desc;
 Offset position;
// 
```
