import 'dart:ffi';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/show_snakbar.dart';

class AddNotes extends StatefulWidget {
  static const routeName = '/add_notes';
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  int color_id = Random().nextInt(noteColors.length);
  String date = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    print(date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dashboard_outlined),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Title',
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Note',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () async {
            FirebaseFirestore.instance.collection('notes').add({
              "note_title": title.text,
              "date": date,
              "content": content.text,
              "color_id": color_id,
            }).then((value) {
              print(value.id);
              Navigator.of(context).pop();
            }).catchError(
                (error) => print("faoled to add new note due to $error"));
          },
          child: const Icon(
            Icons.check,
            color: Colors.orangeAccent,
          ),
          backgroundColor: Colors.white,
          elevation: 10,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
