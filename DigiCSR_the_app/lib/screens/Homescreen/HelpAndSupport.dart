import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the device orientation
    var orientation = MediaQuery.of(context).orientation;
    // Get the device size
    var size = MediaQuery.of(context).size;
    // Get the device pixel ratio
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // Use LayoutBuilder to get the parent constraints
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use a variable to store the list widget
        var listWidget = ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'If you have any questions or issues with the app, please check the following FAQs or contact us via email.',
              style: TextStyle(fontSize: 18.0 ),
            ),
            SizedBox(height: 16.0 * pixelRatio),
            ExpansionTile(
              title: Text('How do I create an account?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0 * pixelRatio),
                  child: Text(
                    'To create an account, tap on the sign up button on the login screen and enter your email and password. You will receive a confirmation email with a link to activate your account.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How do I reset my password?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0 * pixelRatio),
                  child: Text(
                    'To reset your password, tap on the forgot password link on the login screen and enter your email. You will receive an email with a link to reset your password.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How do I change my profile settings?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0 * pixelRatio),
                  child: Text(
                    'To change your profile settings, tap on the menu icon on the top left corner of the home screen and select profile. You can edit your name, photo, bio and preferences.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How do I report a bug or give feedback?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0 * pixelRatio),
                  child: Text(
                    'To report a bug or give feedback, tap on the menu icon on the top left corner of the home screen and select feedback. You can write a message and attach a screenshot if needed.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0 ),
            Text(
              'If you need further assistance, please email us at support@flutterapp.com',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        );
        // Return a Scaffold with different layouts based on the parent constraints
        return Scaffold(
          appBar: AppBar(
            title: Text('Help and Support'),
          ),
          body: constraints.maxWidth > 600
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: listWidget,
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.asset('assets/images/help.png'),
                      ),
                    ),
                  ],
                )
              : listWidget,
          // Add a drawer widget for navigation
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Text('Flutter App'),
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    // Navigate to home screen
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Navigate to settings screen
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.help_outline), // Use an outline icon for help
                  title:
                      Text('Help and Support'), // Use bold text for current screen
                  onTap: () {
                    // Close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
