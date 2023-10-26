import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnish_ar/models/catalog.dart';
import 'package:furnish_ar/widgets/home-widgets/add_to_cart.dart';
import 'package:furnish_ar/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.theme.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              AddToCart(
                catalog: catalog,
              ).wh(100, 50),
              ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.highlightColor),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          )),
                      child: Icon(CupertinoIcons.cube_fill))
                  .wh(100, 50),
            ],
          ).p32(),
        ),
        body: SafeArea(
            child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.asset(catalog.image),
          ).h32(context),
          Expanded(
              child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.theme.highlightColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                        ],
                      ).py64()))),
        ]).p16()));
  }
}
