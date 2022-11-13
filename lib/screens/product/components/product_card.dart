import 'package:flutter/material.dart';
import 'package:amazing_shop_flutter/components/title_text.dart';
import 'package:amazing_shop_flutter/models/Product.dart';
import '../../../theme/constants.dart';
import '../../../theme/size.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5, //145
        decoration: BoxDecoration(
          color: kBackgroundGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/icons/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(
                  title: product.title,
                ),
              ),
              SizedBox(height: defaultSize / 2),
              Text("\$${product.price}"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
