import 'dart:convert';

// import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = json.encode({
      'address': 'Mayanggi',
      'items': carts
          .map(
            (cart) => {'id': cart.product.id, 'quantity': cart.quantity},
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    });
    var response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('GAGAL FETCH CHECKOUT');
    }
  }
}
