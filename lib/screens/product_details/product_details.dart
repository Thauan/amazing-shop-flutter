import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amazing_shop_flutter/models/Product.dart';
import 'package:amazing_shop_flutter/theme/size.dart';
import 'package:amazing_shop_flutter/theme/constants.dart';
import 'package:amazing_shop_flutter/screens/product_details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
// Thats means we have to  pass it
  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/bag.svg"),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
