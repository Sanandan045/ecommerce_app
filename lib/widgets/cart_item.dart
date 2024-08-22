import 'package:dukaan/models/cart_model.dart';
import 'package:dukaan/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final CartModel cartItem;
  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.30,
          height: size.height * 0.13,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: Center(
            child: Image.asset(
              cartItem.product.image,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.product.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.035,
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                "\$ ${cartItem.product.price}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.035,
                ),
              ),
              SizedBox(
                height: size.height * 0.0035,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.incrementQty(cartItem.product.id);
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    cartItem.quantity.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.decrementQty(cartItem.product.id);
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            cartProvider.removeItem(cartItem.product.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  "Item Removed !!!!",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.red.withOpacity(0.07),
            radius: 18,
            child: Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
