import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SystemPlayList extends StatefulWidget {
  @override
  _SystemPlayListState createState() => _SystemPlayListState();
}

class _SystemPlayListState extends State<SystemPlayList> {
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(data['list-Name']);
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -5,
          backgroundColor: Colors.white,
          title: Text('fungji',
              style:
                  GoogleFonts.kanit(textStyle: TextStyle(color: Colors.black))),
          actions: <Widget>[
            IconButton(
              icon: Image.asset("assets/images/logout.png"),
              onPressed: () {
                print('Click for logout');
              },
            ),
          ],
          leading: IconButton(
            icon: Image.asset("assets/images/logo.png"),
            onPressed: () {
              // print('Click start');
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text('เพลย์ลิสท์${data['list-Name']}',
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(color: Colors.black, fontSize: 24))),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // print(data['list'][3]['title']);
                    var ds = data['list'][index];
                    print(ds['chanelname']);
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FlatButton(
                              onPressed: () {
                                Get.toNamed(
                                  "/musicScreen",
                                  arguments: {
                                    "image": ds['image'],
                                    "title": ds['title'],
                                    "channelName": ds['chanelname'],
                                    "videoID": ds['videoID'],
                                    "suggestion": ds['suggestion'],
                                    "lyrics": ds['lyrics']
                                  },
                                );
                              },
                              child: Container(
                                  width: 160,
                                  height: 100,
                                  child: Image.network(
                                    ds['image'],
                                    fit: BoxFit.cover,
                                  ))),
                          Divider(
                            height: 105,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                "/musicScreen",
                                arguments: {
                                  "image": ds['image'],
                                  "title": ds['title'],
                                  "channelName": ds['channelName'],
                                  "videoID": ds['videoID'],
                                  "suggestion": ds['suggestion'],
                                  "lyrics": ds['lyrics']
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.1),
                              child: Column(
                                children: [
                                  Text(ds['title'],
                                      style: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14))),
                                  Text(ds['chanelname'],
                                      style: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14))),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
