import 'package:dukaan/models/product_model.dart';
import 'package:dukaan/provider/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Color slectedColor = Colors.redAccent;
  int slectedSize = 6;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                widget.product.isAvailable
                    ? GestureDetector(
                        onTap: () {
                          // Add or remove from favorites
                          productProvider.toggleFavorite(widget.product);
                        },
                        child: Icon(
                          widget.product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: size.width * 0.07,
                          color: widget.product.isFavorite
                              ? Colors.redAccent
                              : Colors.black,
                        ),
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  widget.product.image,
                  height: size.height / 3,
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Text(
                "New Arrival",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: size.width * 0.05,
                ),
              ),
              Text(
                widget.product.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.07,
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width / 4,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Save 20%",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 23,
                      ),
                      Text(
                        "4.8",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      Text(
                        " 232(Reviews)",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.04,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Text("Information",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.050,
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(widget.product.desc,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: size.width * 0.04,
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Colors",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.050,
                      )),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.product.colors!.length,
                            itemBuilder: (context, index) {
                              Color color = widget.product.colors![index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slectedColor = color;
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color,
                                      border: Border.all(
                                          color: slectedColor == color
                                              ? Colors.black54
                                              : Colors.transparent,
                                          width: 2)),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Size",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.050,
                      )),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.product.colors!.length,
                            itemBuilder: (context, index) {
                              int sizee = widget.product.sizes![index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    slectedSize = sizee;
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: slectedSize == sizee
                                              ? Colors.black54
                                              : Colors.transparent,
                                          width: 2)),
                                  child: Center(child: Text(sizee.toString())),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("Price",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: size.width * 0.060,
                    )),
                Text("\$ ${widget.product.price}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.055,
                    ))
              ],
            ),
            widget.product.isAvailable
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                    child: Text("Add to Cart",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: size.width * 0.040,
                        )))
                : Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 4,
                      ),
                      SizedBox(width: size.width * 0.020),
                      Text(
                        "Out of Stock",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.050,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
