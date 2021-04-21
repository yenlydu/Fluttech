import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Model/Constants.dart';

class RecentPage extends StatefulWidget {
  RecentPage({Key key}) : super(key: key);
  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  // Post Owner Profile Picture
  Widget build_posts_profile_image(Text imagelink) {
    return Container(
      width: 30,
      height: 30,
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Constants().border_image,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 25,
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  imagelink.data,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // LIKES, COMMENTS & SHARE
  Widget build_postsdetails(Text itemtext, Icon icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              //User Name
              padding: EdgeInsets.only(left: 5.0),
              child: Row(
                children: <Widget>[
                  icon,
                ],
              ),
            ),
            Container(
              //User Name
              padding: EdgeInsets.only(left: 5.0),
              child: Text(itemtext.data),
            ),
          ],
        ),
      ),
    );
  }

  // INFORMATION OF POST
  Widget build_posts_info(Text nameuser, Text userimage, Text postdesc,
      List<Text> postimages, Text likes, Text comments, Text shares) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              build_posts_profile_image(
                  //User Profile Image
                  Text(userimage.data)),
              Container(
                //User Name
                padding: EdgeInsets.only(left: 5.0),
                child: Text(nameuser.data),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(postdesc.data),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                  ),
                  items: postimages
                      .map((item) => Container(
                            child: Center(
                                child:
                                    Image.network(item.data, fit: BoxFit.fill)),
                          ))
                      .toList(),
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                build_postsdetails(
                  likes,
                  Icon(Icons.favorite,
                      size: 25, color: Constants().icon_photo_profile),
                ),
                build_postsdetails(
                  shares,
                  Icon(Icons.comment,
                      size: 25, color: Constants().icon_photo_profile),
                ),
                build_postsdetails(
                  comments,
                  Icon(Icons.share,
                      size: 25, color: Constants().icon_photo_profile),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
