import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: product.galleries[0].url != null
                    ? Image.network(product.galleries[0].url)
                    : Image.asset(
                        "assets/image_shoes5.png",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.category.name}",
                      style: secondaryTextStyle,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${product.name}",
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "\$${product.price}",
                      style: priceTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
