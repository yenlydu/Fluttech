import 'dart:convert';
import 'package:http/http.dart' as http;

//File Page Includ
import '../../Model/SocialAccount.dart' as localuser;
import '../../Tools/LocalTools.dart';

// Create User with Facebook login or Sync Existing User With Facebook Data
/*class FluffyFacebooklogin {
  // Create a new User with Facebook credidentials & User Info
  static Future<localuser.User> createUserFacebook(
      FacebookLoginResult result, String userID) async {
    final token = result.accessToken.token;
    final graphResponse = await http.get('https://graph.facebook.com/v2'
        '.12/me?fields=name,first_name,last_name,email,picture.type(large)&access_token=$token');
    final profile = json.decode(graphResponse.body);
    localuser.User user = localuser.User(
        firstName: profile['first_name'],
        lastName: profile['last_name'],
        email: profile['email'],
        facebookaccesstoken: token,
        profilePictureURL: profile['picture']['data']['url'],
        active: true,
        userID: userID);
    return await Localtools().setCurrentUser(user);
  }

  // Sync existing User with Facebook credidentials & User Info
  static Future<localuser.User> syncUserWithFacebook(
      FacebookLoginResult result, localuser.User user) async {
    final token = result.accessToken.token;
    final graphResponse = await http.get('https://graph.facebook.com/v2'
        '.12/me?fields=name,first_name,last_name,email,picture.type(large)&access_token=$token');
    final profile = json.decode(graphResponse.body);
    user.facebookprofilePictureURL = profile['picture']['data']['url'];
    user.firstName = profile['first_name'];
    user.lastName = profile['last_name'];
    user.facebookaccesstoken = token;
    user.email = profile['email'];
    user.active = true;

    return await Localtools().setCurrentUser(user);
  }
}*/
