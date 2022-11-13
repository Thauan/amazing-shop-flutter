import 'package:flutter/material.dart';
import 'package:amazing_shop_flutter/models/Product.dart';
import 'package:amazing_shop_flutter/screens/product_details/product_details.dart';
import 'package:amazing_shop_flutter/screens/product/components/product_card.dart';
import '../../../theme/size.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize!;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () {
              // print(products[index]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ));
            }),
      ),
    );
  }
}
