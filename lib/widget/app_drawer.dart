import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String text = 'Plaz App';
  String subject = 'Link of App';

  @override
  Widget build(BuildContext context) {
    // final ProdCart = Provider.of<Products>(context);
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          top: 32,
        ),
        child: Column(
          children: <Widget>[
            //Divider(color: Colors.redAccent,),

            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // use Navigation in this locale classes or Widget Help
              },
            ),
            // Divider(color: Colors.redAccent,),
            SizedBox(
              height: 16,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                // use Navigation in this locale classes or Widget About Us
              },
            ),

            //Divider(color: Colors.redAccent,),
            SizedBox(
              height: 16,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                // use Navigation in this locale classes or Widget Share

                final RenderBox box = context.findRenderObject();
                Share.share(text,
                    subject: subject,
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
            ),

            //Divider(color: Colors.redAccent,),
          ],
        ),
      ),
    );
  }
}
