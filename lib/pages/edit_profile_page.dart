import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {},
          )
        ],
      );
    }

    Widget nameInput({String title = 'Default', String textInput = 'No Name'}) {
      return Container(
        padding: EdgeInsets.only(left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: textInput,
                  hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor))),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin:
                  EdgeInsets.only(top: defaultMargin, bottom: defaultMargin),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: user.profilePhotoUrl != null
                          ? NetworkImage(user.profilePhotoUrl)
                          : AssetImage("assets/image_profile.png"))),
            ),
            nameInput(title: 'Name', textInput: '${user.name}'),
            SizedBox(
              height: 24,
            ),
            nameInput(title: 'Username', textInput: '@${user.username}'),
            SizedBox(
              height: 24,
            ),
            nameInput(title: 'Email Address', textInput: '${user.email}'),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
