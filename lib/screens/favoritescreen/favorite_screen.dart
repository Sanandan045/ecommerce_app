import 'package:dukaan/models/product_model.dart';
import 'package:dukaan/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    final List<ProductModel> allProducts = [
      ...productProvider.shirts,
      ...productProvider.pants,
      ...productProvider.shoes,
    ];

    final List<ProductModel> favoriteProducts =
        allProducts.where((product) => product.isFavorite).toList();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Favorite Products",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.05,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: favoriteProducts.isNotEmpty
                    ? ListView.builder(
                        itemCount: favoriteProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = favoriteProducts[index];
                          return Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(14),
                              leading: Image.asset(
                                product.image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                              title: Text(
                                product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                "\$ ${product.price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  productProvider.toggleFavorite(product);
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.black45,
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          "No favorite products yet.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
