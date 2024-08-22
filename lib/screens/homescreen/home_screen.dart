import 'package:dukaan/provider/product_provider.dart';
import 'package:dukaan/widgets/category_header.dart';
import 'package:dukaan/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.045),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop Now",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Your Favorite Products",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: size.width * 0.060,
                    foregroundImage: AssetImage("assets/images/profile3.jpg"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/cover.jpg",
                  height: size.height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.030),
              CategoryHeader(
                title: "T-shirts",
                count: '${Provider.of<ProductProvider>(context).shirts.length}',
              ),
              SizedBox(height: size.height * 0.030),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return SizedBox(
                    height: size.height * 0.35, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.shirts.length,
                      itemBuilder: (context, index) {
                        return Product(product: productProvider.shirts[index]);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.030),
              CategoryHeader(
                title: "Nike Shoes",
                count: '${Provider.of<ProductProvider>(context).shoes.length}',
              ),
              SizedBox(height: size.height * 0.030),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return SizedBox(
                    height: size.height * 0.35, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.shoes.length,
                      itemBuilder: (context, index) {
                        return Product(product: productProvider.shoes[index]);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.030),
              CategoryHeader(
                title: " Cotton Pants",
                count: '${Provider.of<ProductProvider>(context).pants.length}',
              ),
              SizedBox(height: size.height * 0.030),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return SizedBox(
                    height: size.height * 0.35, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.pants.length,
                      itemBuilder: (context, index) {
                        return Product(product: productProvider.pants[index]);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
