import 'package:flutter/material.dart';

//File Page Includ
import '../../Model/Constants.dart';
import '../../Widget/app_icons_icons.dart';

// Login Page (Serve as first Page for the first session)
class LoginPage extends StatelessWidget {
  BuildContext _context;

  // Show Message in case of error (Not Use)
  Future<void> _showMessage(String message) {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Column(
        children: <Widget>[
          //Main Icon
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.85,
              child: Container(
                color: Color.fromRGBO(86, 0, 232, 1),
                child:
                    Image.asset('assets/images/icon.png', fit: BoxFit.contain),
              ),
            ),
          ),
          Container(
            child: Text("Hello on the login Page"),
            height: 40,
          ),
        ],
      ),
    );
  }
}
