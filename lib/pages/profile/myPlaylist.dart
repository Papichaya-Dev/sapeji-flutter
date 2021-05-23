import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlayList extends StatefulWidget {
  @override
  _MyPlayListState createState() => _MyPlayListState();
}

class _MyPlayListState extends State<MyPlayList> {
  Stream myPlaylistStream;

  onLoadingScreen() async {
    String username = await SharedPreferenceHelper().getUserName();
    myPlaylistStream = await DatabaseMethods().getMyPlaylist(username);
    setState(() {});
  }

  @override
  void initState() {
    onLoadingScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 14),
                child: Text('เพลย์ลิสต์ของฉัน',
                    style: GoogleFonts.kanit(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 24))),
              ),
              StreamBuilder(
                  stream: myPlaylistStream,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return Dismissible(
                                  key: UniqueKey(),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    color: Colors.red,
                                    child:
                                        Icon(Icons.delete, color: Colors.white),
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 20.0),
                                  ),
                                  onDismissed: (direction) {
                                    print(direction);
                                    DatabaseMethods()
                                        .deleteMusicInPlaylist(ds.id);
                                  },
                                  child: Row(
                                    children: [
                                      FlatButton(
                                          onPressed: () {
                                            Get.toNamed(
                                              "/musicScreen",
                                              arguments: ds['videoID'],
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
                                          Get.toNamed("/musicScreen",
                                              arguments: ds['videoID']);
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
                                              Text(ds['channelName'],
                                                  style: GoogleFonts.kanit(
                                                      textStyle: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 14))),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ));
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}