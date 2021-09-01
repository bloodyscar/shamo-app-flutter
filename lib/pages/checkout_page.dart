import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shamo/models/cart_model.dart';
import 'package:shamo/pages/checkout_success_page.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';
import 'package:shamo/widgets/loading_button.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });
      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CheckoutSuccessPage()),
            (route) => false);
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text("Checkout Details"),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              "List Items",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              children:
                  cartProvider.carts.map((cart) => CheckoutCard(cart)).toList(),
            ),

            // NOTE ADDRESS
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address Details",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/icon_store_location.png",
                            width: 40,
                          ),
                          Image.asset(
                            "assets/icon_line.png",
                            height: 30,
                          ),
                          Image.asset(
                            "assets/icon_your_address.png",
                            width: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Store Location",
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
                            ),
                            Text(
                              "Adidas Core",
                              style:
                                  primaryTextStyle.copyWith(fontWeight: medium),
                            ),
                            SizedBox(
                              height: defaultMargin,
                            ),
                            Text(
                              "Your Address",
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
                            ),
                            Text(
                              "Rawalumbu Rawalumbu Rawalumbu ",
                              style:
                                  primaryTextStyle.copyWith(fontWeight: medium),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            // NOTE PAYMENT
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Summary",
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Quantity",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "${cartProvider.totalItems()} Items",
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Price",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "\$${cartProvider.totalPrice()}",
                        style: priceTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "FREE",
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xff2E3141),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: priceTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      Text(
                        "\$${cartProvider.totalPrice()}",
                        style: priceTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Divider(
              thickness: 0.5,
              color: Color(0xff2E3141),
            ),
            SizedBox(
              height: defaultMargin,
            ),

            // NOTE CHECKOUT BUTTON
            isLoading
                ? LoadingButton()
                : TextButton(
                    onPressed: handleCheckout,
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      "Checkout Now",
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ),
            SizedBox(
              height: defaultMargin,
            ),
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
