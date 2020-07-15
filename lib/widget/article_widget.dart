import 'package:flutter/material.dart';
import 'package:crudfirebaseapp/model/blogarticle.dart';
import 'package:crudfirebaseapp/blogpages/bloge_details_page.dart';
import 'package:crudfirebaseapp/resources/sizes.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';


import 'clipped_image.dart';
import 'name_widget.dart';

class MemberWidget extends StatelessWidget {
  final Article article;
  final bool compactMode;

  MemberWidget({this.article, this.compactMode = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: <Widget>[
          ClippedImage(imagePath: article.imagePath, compactMode: compactMode),
          SizedBox(width: size_4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NameWidget(name: article.name, style: nameStyle),
              SizedBox(height: size_8),
              Text(article.occupation, style: occupationStyle),
            ],
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MemberDetailsPage(
                  artile : article,
                )));
      },
    );
  }

}
