import 'dart:io';

import 'package:bands_names_sample_app/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "1", name: "Metallica", votes: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Band Names",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) {
          return _bandTile(bands[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewBand();
        },
        elevation: 1,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Delete band", style: TextStyle(color: Colors.white)),
        ),
      ),
      child: ListTile(
        onTap: () {
          print(band.name);
        },
        title: Text(band.name),
        trailing:
            Text(band.votes.toString(), style: const TextStyle(fontSize: 20)),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2)),
        ),
      ),
    );
  }

  _addNewBand() {
    final TextEditingController textController = TextEditingController();

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New band name"),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  _addBandToList(textController.text);
                },
                textColor: Colors.blue,
                elevation: 5,
                child: const Text("Add"),
              )
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("New band name"),
            content: CupertinoTextField(controller: textController),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  _addBandToList(textController.text);
                },
                child: const Text("Add"),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Dismiss"),
              )
            ],
          );
        },
      );
    }
  }

  _addBandToList(String name) {
    if (name.length > 1) {
      bands.add(
        Band(
          id: DateTime.now().toString(),
          name: name,
          votes: 1,
        ),
      );
      setState(() {});
    }

    Navigator.pop(context);
  }
}
