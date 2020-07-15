import 'package:flutter/material.dart';
import 'package:crudfirebaseapp/model/blogarticle.dart';
import 'package:crudfirebaseapp/resources/sizes.dart';
import 'package:crudfirebaseapp/resources/text_styles.dart';
import 'package:crudfirebaseapp/widget/clipped_image.dart';
import 'package:crudfirebaseapp/widget/name_widget.dart';


class MemberDetailsPage extends StatelessWidget {
  final Article artile;
  //final PaletteGenerator palette;

  MemberDetailsPage({this.artile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            artile.imagePath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            //palette.darkMutedColor.color.withOpacity(0.8),
          ),
          Positioned(
            top: size_60,
            right: size_20,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: size_40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: size_40, right: size_20, bottom: size_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size_120,
                ),
                NameWidget(
                  name: artile.name,
                  style: nameBigStyle.copyWith(color:
                  //palette.lightMutedColor.color
                  Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: size_8),
                Text(artile.occupation,
                    style: descriptionBoldStyle.copyWith(color:
                    //palette.lightMutedColor.color
                    Colors.white.withOpacity(0.7),
                    )),
                SizedBox(height: size_20),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(artile.description, style: descriptionStyle),
                  ),
                ),
                SizedBox(height: size_20),
//                Text("Our Team Members".toUpperCase(), style: descriptionBoldStyle),
//                SizedBox(height: size_8),
 // Containner provide list of other article

//                Container(
//                  height: size_100,
//                  child: ListView.separated(
//                      scrollDirection: Axis.horizontal,
//                      itemBuilder: (context, index) {
//                        return ClippedImage(compactMode: true, imagePath: members[index].imagePath);
//                      },
//                      separatorBuilder: (context, index) {
//                        return SizedBox(width: size_12);
//                      },
//                      itemCount: members.length),
//                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
