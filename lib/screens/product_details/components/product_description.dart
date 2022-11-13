import 'package:flutter/material.dart';
import 'package:amazing_shop_flutter/models/Product.dart';
import 'package:amazing_shop_flutter/theme/size.dart';
import 'package:amazing_shop_flutter/theme/constants.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9, //90
        left: defaultSize * 2, //20
        right: defaultSize * 2,
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            Text(
              product.description,
              style: TextStyle(
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size.fromWidth(100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.all(defaultSize * 1.5),
                  ),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 1.6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    press;
                  },
                )),
          ],
        ),
      ),
    );
  }
}
