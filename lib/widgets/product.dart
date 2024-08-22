import 'package:dukaan/models/product_model.dart';
import 'package:dukaan/provider/cart_provider.dart';
import 'package:dukaan/provider/product_provider.dart';
import 'package:dukaan/screens/productscreen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  final ProductModel product;
  const Product({super.key, required this.product});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Add your product details navigation here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                    product: widget.product,
                                  )),
                        );
                      },
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.contain,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: widget.product.isAvailable
                      ? GestureDetector(
                          onTap: () {
                            // Add or remove from favorites
                            productProvider.toggleFavorite(widget.product);
                          },
                          child: Icon(
                            widget.product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: size.width * 0.05,
                            color: widget.product.isFavorite
                                ? Colors.redAccent
                                : Colors.black,
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.020),
            Text(
              widget.product.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.033,
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: widget.product.isAvailable
                      ? Color(0xFF03B680)
                      : Colors.redAccent,
                  radius: 4,
                ),
                SizedBox(width: size.width * 0.020),
                Text(
                  widget.product.isAvailable ? "Available" : "Out of Stock",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.033,
                    color: widget.product.isAvailable
                        ? Colors.black
                        : Colors.redAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.product.price.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.040,
                  ),
                ),
                widget.product.isAvailable
                    ? GestureDetector(
                        onTap: () {
                          context
                              .read<CartProvider>()
                              .addToCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Item Added!"),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: size.width * 0.05,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
