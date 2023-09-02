import 'package:flutter/material.dart';
import 'package:furniture_app_ui/components/title_text.dart';
import 'package:furniture_app_ui/services/fetchCategories.dart';
import 'package:furniture_app_ui/services/fetchProducts.dart';
import 'package:furniture_app_ui/size_config.dart';
import 'categories.dart';
import 'recommond_products.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: const TitleText(title: "Browse by Categories"),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data ?? [])
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            const Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: const TitleText(title: "Recommands For You"),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: snapshot.data ?? [])
                    : Center(child: Image.asset('assets/ripple.gif'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
