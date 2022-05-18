import 'package:baliza/screen/add_notes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../utils/show_snakbar.dart';
import '../widget/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';
  @override
  Widget build(BuildContext context) {
    // final prod = Provider.of<Notes>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Remainders',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('notes')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map(
                              (note) => noteCard(
                                () {},
                                note,
                              ),
                            )
                            .toList(),
                      );
                    }
                    return Text('please create some notes');
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddNotes.routeName);
        },
        child: const Icon(
          Icons.add,
          color: Colors.orangeAccent,
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
