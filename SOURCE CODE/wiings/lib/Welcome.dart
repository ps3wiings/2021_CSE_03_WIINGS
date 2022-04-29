import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.image),
                    text: 'Search with image',
                  ),
                  Tab(
                    icon: Icon(Icons.text_format),
                    text: 'Search with text',
                  ),
                  Tab(
                    icon: Icon(Icons.map),
                    text: 'Search with hotspots',
                  ),
                  Tab(
                    icon: Icon(Icons.account_box),
                    text: 'Profile',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.upload_file,
                    size: 350,
                  ), // Text('This page is to search using Image'),
                ),
                Icon(
                  Icons.text_fields,
                  size: 350,
                ),
                Icon(
                  Icons.map, size: 350,
                  // Text('This page is to search using Hotspots'),
                ),
                Icon(
                  Icons.account_box,
                  size: 350,
                  // Text('This page is to view profile'),
                ),
              ],
            ),
          )),
    );
  }
}
