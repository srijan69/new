import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'buttons.dart';

class Addbox extends StatelessWidget {
  final controller;

  //method for the Saving and Canceling

  VoidCallback onSave;
  VoidCallback onCancel;
  Addbox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink,
      content: Container(
        height: 300,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Add your new work here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                SizedBox(
                  width: 14,
                ),
                MyButton(text: 'Cancel', onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
