import 'package:flutter/material.dart';
import 'package:urbanharmony/Provider/favorite_provider.dart';
import 'package:urbanharmony/constants.dart';
import 'package:urbanharmony/screens/Details/detail_screen.dart';
import '../../../Models/product_model.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key ,required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(product: product),),);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: contentColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                              (index) => Container(
                                width: 18,
                                height: 18,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                            color: product.colors[index],
                            shape: BoxShape.circle,),)
                    ),
                   ),
                  ],
                ),
              ],
            ),
          ),
          // for favorite icon
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: GestureDetector(onTap: () {
                  provider.toggleFavorite(product);
                },
                  child: Icon(
                    provider.isExist(product)?
                    Icons.favorite:
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
