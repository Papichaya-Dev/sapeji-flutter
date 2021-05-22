import 'package:flutter/material.dart';

class MusicTile extends StatefulWidget {
  final String channelName;
  final String image;
  final String videoId;
  final String title;

  MusicTile(this.channelName, this.image, this.videoId, this.title);
  @override
  _MusicTileState createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          // child: ClipRRect(
          //   child: Image.network(
          //     widget.image,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Text(widget.title),
        )
      ],
    );
  }
}
