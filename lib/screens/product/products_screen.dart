import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';
import '../../theme/constants.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(expand: _expanded),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Amazing'),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/notification.svg")),
        IconButton(
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            icon: SvgPicture.asset("assets/icons/search.svg"))
      ],
    );
  }
}
