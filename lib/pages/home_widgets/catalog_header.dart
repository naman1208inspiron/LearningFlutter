import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
      "Treding Products".text.xl2.color(MyTheme.darkBluishColor).make(),
    ]);
  }
}