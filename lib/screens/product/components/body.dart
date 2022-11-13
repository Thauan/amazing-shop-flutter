import 'package:flutter/material.dart';
import 'package:amazing_shop_flutter/components/search_box.dart';
import 'package:amazing_shop_flutter/components/expanded_section.dart';
import 'package:amazing_shop_flutter/screens/product/components/category_list.dart';
import 'package:amazing_shop_flutter/services/fetchProducts.dart';
import 'package:amazing_shop_flutter/screens/product/components/products_list.dart';
import 'package:amazing_shop_flutter/theme/constants.dart';
import '../../../models/Product.dart';

class Body extends StatefulWidget {
  final bool expand;
  const Body({super.key, this.expand = false});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List<Product>> _fetch;
  @override
  void initState() {
    super.initState();
    _fetch = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Column(
        children: <Widget>[
          ExpandedSection(
            expand: widget.expand,
            child: SearchBox(onChanged: (value) {}),
          ),
          const CategoryList(),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: FutureBuilder(
                    future: _fetch,
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.done
                          ? ProductsList(products: snapshot.data!)
                          : const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
