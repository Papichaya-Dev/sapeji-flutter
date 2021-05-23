import 'package:flutter/material.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userEmail, userProfileImage, username;

  getUserdata() async {
    userEmail = await SharedPreferenceHelper().getUserEmail();
    username = await SharedPreferenceHelper().getUserDisplayName();
    userProfileImage = await SharedPreferenceHelper().getUserProfileUrl();
    setState(() {});
  }

  onScreenLoaded() async {
    await getUserdata();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userProfileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: (Image.network(
                        userProfileImage,
                        width: 80,
                        alignment: Alignment.center,
                      )),
                    )
                  : CircularProgressIndicator(),
              Text('${username} \n ${userEmail}',
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(color: Colors.black, fontSize: 16))),
              Padding(
                padding: EdgeInsets.all(40),
              ),
              Divider(
                height: 120,
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
            indent: 40,
            endIndent: 40,
            color: Colors.grey[450],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                padding: EdgeInsets.only(right: 15.0),
                disabledColor: Colors.transparent,
                onPressed: () {
                  Get.toNamed('/myPlaylist');
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/playlist.png",
                      width: 80,
                      height: 80,
                    ),
                    new Text(' เพลย์ลิสต์ของฉัน',
                        style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
