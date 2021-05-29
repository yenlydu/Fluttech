import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireauth;

//File Page Include
import 'package:flutter2/Model/Constants.dart';
import '../../Tools/Image/ImagePickerManager.dart';
import '../../Tools/Image/ImageProfileFireManager.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Manager
  ImagePickerManager imagePickerManager;
  ImageProfileFireManager fireimagemanager;
  final fireauth.FirebaseAuth auth = fireauth.FirebaseAuth.instance;
  //End Manager

  fireauth.User user;
  UserModel currentuser;

  _initUser(BuildContext context) async {
    user = auth.currentUser;
    currentuser = locator<FireStoreUser>().currentUser;
    fireimagemanager = new ImageProfileFireManager();
  }

  //Image && Profile Selection
  NetworkImage imageFile = null;
  // check if local image exist and select it
  _initImage(BuildContext context) async {
    String image = await fireimagemanager.getUserPhoto();

    setState(() {
      if (image != "") {
        imageFile = NetworkImage(image);
      } else {
        print('No image selected.');
      }
    });
  }

  //Open user gallery to select a profile picture
  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    //File pickedFile = await imagePickerManager.pickImageFromGallery(context);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Directory tempDir = await getApplicationDocumentsDirectory();
      String path = tempDir.path;
      var res = await fireimagemanager.uploadPhoto(File(pickedFile.path));

      setState(() {
        imageCache.clear();
        imageFile = NetworkImage(res);
      });
    } else {
      print('No image selected.');
    }
    Navigator.of(context).pop();
  }

  //Open Phone Camera to take a profile picture
  _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final fireStore = ImageProfileFireManager();

    PickedFile pickedFile = await picker.getImage(source: ImageSource.camera);

    var file = File(pickedFile.path);
    var res = await fireimagemanager.uploadPhoto(file);
    setState(() {
      if (pickedFile != null) {
        imageFile = NetworkImage(res);
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
          child: Image.network(
            imageFile.url,
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
                (currentuser != null &&
                        currentuser.firstName != null &&
                        currentuser.lastName != null)
                    ? currentuser.firstName + "" + currentuser.lastName
                    : "user name".toUpperCase(),
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
                          ((user != null && user.email != null)
                              ? user.email
                              : "your.email@epitech.eu"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Credits : " +
                          ((currentuser != null &&
                                  currentuser.currentCredits != null)
                              ? currentuser.currentCredits.toString()
                              : "0"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "G.P.A : " +
                          ((user != null && currentuser.gpa != null)
                              ? currentuser.gpa.toDouble().toString()
                              : "2.0"),
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
    _initUser(context);
    _initImage(context);
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
