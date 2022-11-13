import 'package:amazing_shop_flutter/theme/constants.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List categories = ['Todos', 'Cama', 'Mesa', 'Banho', 'Confecçao'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => {
            setState(() {
              selectedIndex = index;
            })
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: kDefaultPadding,
                right: index == categories.length - 1 ? kDefaultPadding : 0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent),
              child: Text(
                categories[index],
                style: const TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
