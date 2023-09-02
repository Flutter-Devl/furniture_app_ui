import 'package:flutter/material.dart';
import 'package:furniture_app_ui/models/Product.dart';
import 'package:furniture_app_ui/screens/details/details_screen.dart';
import '../../../size_config.dart';
import 'product_card.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: products[index]),
                  ));
            }),
      ),
    );
  }
}
