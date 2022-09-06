// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fresp/constants/global_variables.dart';

enum UserOptions { my_orders, delivery_address, logout }

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi! User'),
        backgroundColor: const Color.fromARGB(255, 248, 0, 0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  color: Color.fromARGB(255, 248, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Column(),
                  ),
                ),
              ),
            ),
          ),
          const ListTile(
            tileColor: Color.fromARGB(255, 248, 0, 0),
            title: Text('Option 1'),
          )
        ],
      ),
    );
  }
}
