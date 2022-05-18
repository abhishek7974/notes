import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

List<Color> noteColors = [
  Colors.red.shade300,
  Colors.pink.shade300,
  Colors.orange.shade300,
  Colors.green.shade300,
  Colors.blue.shade300,
];

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: noteColors[doc['color_id']],
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                doc['note_title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              doc['content'],
              overflow: TextOverflow.visible,
            ),
            Theme(
              data: ThemeData(canvasColor: Colors.transparent),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Chip(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    doc['date'],
                  ),

                  backgroundColor: Colors.transparent, // or any other color
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

