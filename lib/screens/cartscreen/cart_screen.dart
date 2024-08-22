import 'package:dukaan/provider/cart_provider.dart';
import 'package:dukaan/screens/cartscreen/checkout_bottomsheet.dart';
import 'package:dukaan/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MY CART",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.05,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: cartProvider.shoppingCart.isNotEmpty
                    ? ListView.builder(
                        itemCount: cartProvider.shoppingCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartProvider.shoppingCart[index];
                          return CartItem(cartItem: cartItem);
                        },
                      )
                    : Center(
                        child: Text(
                          "Your cart is empty.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              cartProvider
                      .shoppingCart.isNotEmpty // Check if the cart is not empty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Info",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.06,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            Text(
                              "\$${cartProvider.cartSubTotal.toStringAsFixed(2)}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping Charge",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            Text(
                              "\$${cartProvider.shippingCharge.toStringAsFixed(2)}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.06,
                              ),
                            ),
                            Text(
                              "\$${cartProvider.cartTotal.toStringAsFixed(2)}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.06,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(320, 60),
                                visualDensity: VisualDensity.compact,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              showBottomSheet(context);
                            },
                            child: Text("Checkout",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.05,
                                )))
                      ],
                    )
                  : SizedBox(), // If the cart is empty, show nothing here
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return CheckoutBottomSheet();
        });
  }
}
