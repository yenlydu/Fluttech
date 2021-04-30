import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

//File Page Includ
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/Constants/C_Profile.dart';
import '../../Widget/app_icons_icons.dart';
import 'package:flutter2/Model/SocialAccount.dart' as localuser;
import '../../Tools/LocalTools.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  localuser.User user;

  _initUser(BuildContext context) async {
    user = await Localtools().getCurrentUser();
  }

  //Image && Profile Selection
  File imageFile;
  // check if local image exist and select it
  _initImage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('picked_image')) return;

    final filepath = (prefs.getString('picked_image'));

    final pickedFile = File(filepath);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //Open user gallery to select a profile picture
  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageCache.clear();
      Directory tempDir = await getApplicationDocumentsDirectory();
      String path = tempDir.path;

      final fileName = basename(pickedFile.path);
      final File file = await File(pickedFile.path).copy('$path/picked');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('picked_image', file.path);
    }

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  //Open Phone Camera to take a profile picture
  _openCamera(BuildContext context) async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  // Open choice dialog and select Camera or Gallery
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select an Option :"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _openGallery(context);
                    },
                    child: Text("Gallery"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _openCamera(context);
                    },
                    child: Text("Camera"),
                  )
                ],
              ),
            ),
          );
        });
  }

  //Display Image selected or default icon
  Widget _checkimageprofile() {
    if (imageFile == null) {
      return Container(
        width: 230,
        height: 230,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Container(
            color: Constants().app_color,
            child: Icon(
              Icons.person,
              size: 200,
              color: Constants().icon_photo_profile,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 230,
        height: 230,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.file(
            imageFile,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  //Display icon (Profile image bottom right)
  Widget _photoicon() {
    return Container(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Container(
          color: Constants().app_color,
          child: Icon(
            Icons.photo_camera,
            color: Constants().icon_photo_profile,
          ),
        ),
      ),
    );
  }

  //Profile Image
  Widget _imageprofile(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Constants().border_image,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _checkimageprofile(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 65,
              height: 65,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Constants().border_image,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _photoicon(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Social Networks Buttons
  Widget _socialcontainer(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(top: 25.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              child: Text(
                (user != null) ? user.fullName() : "user name".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            padding: new EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0),
            child: Container(
              padding: new EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Mail : " +
                          ((user != null)
                              ? user.fullName()
                              : "user.name@epitech.eu"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Credits : " + ((user != null) ? user.fullName() : "0"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "G.P.A : " + ((user != null) ? user.fullName() : "0"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Profile Page
  @override
  Widget build(BuildContext context) {
    _initImage(context);
    _initUser(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(top: 25),
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      padding: new EdgeInsets.all(25.0),
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      child: _imageprofile(context),
                    ),
                    _socialcontainer(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
