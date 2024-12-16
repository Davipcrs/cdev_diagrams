// Quando selecionado um dos Nodes, option_bar vai liberar um botão que irá abrir um Widget para escolher
// em uma lista o widget de destino da connection;

import 'package:flutter/material.dart';

Widget createConnectionDialog(BuildContext context) {
  return Dialog(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Text("Select a Node to create the conection"),
          //Listview
        ],
      ),
    ),
  );
}
