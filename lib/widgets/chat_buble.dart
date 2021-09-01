import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/theme.dart';

class ChatBuble extends StatelessWidget {
  final String text;
  final bool isSender;
  final ProductModel product;

  ChatBuble({
    this.isSender = false,
    this.text = '',
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 231,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: isSender ? backgroundColor5 : backgroundColor4,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSender ? 12 : 0),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(isSender ? 0 : 12),
            )),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12, top: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/image_shoes.png",
                      width: 70,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        child: Text(
                          "COURT VISION 2.0 SHOES",
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$47,15",
                        style: priceTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, bottom: 12, right: 12),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Add to Cart",
                      style: purpleTextStyle,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Buy Now",
                      style: GoogleFonts.poppins(
                          color: backgroundColor5, fontWeight: medium),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
            Row(
              mainAxisAlignment:
                  isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: isSender ? backgroundColor5 : backgroundColor4,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(isSender ? 12 : 0),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(isSender ? 0 : 12),
                        )),
                    child: Text(
                      text,
                      style: primaryTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
