import 'package:flutter/material.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text("Checkout Success"),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon_empty_cart.png",
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "You made a transaction",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Stay at home while we\nprepare your dream shoes",
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),

            // NOTE BUTTON
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                      (route) => false);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: primaryColor,
                ),
                child: Text(
                  "Order Other Shoes",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Color(0xff39374B),
                ),
                child: Text(
                  "View My Order",
                  style: TextStyle(
                      color: Color(0xffB7B6BF),
                      fontSize: 16,
                      fontWeight: medium),
                ),
              ),
            )
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
