import 'package:flutter/material.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/layouts/skeletons.dart';
import 'package:fungji/services/app_localizations.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/background-sapeji.JPG?alt=media&token=a775ffdd-236d-4cd6-8095-1406c67c4454"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userProfileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: (Image.network(
                          userProfileImage,
                          width: 80,
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : Skeleton().profileImage(),
                          alignment: Alignment.center,
                        )),
                      )
                    : CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${username} \n${userEmail}',
                      style: GoogleFonts.kanit(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 17))),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                ),
                Divider(
                  height: 120,
                ),
              ],
            ),
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
                    new Text(
                        AppLocalizations.of(context).translate('my_playlist'),
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
