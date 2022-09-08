import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fresp/features/auth/widgets/utils.dart';
import 'package:fresp/features/auth/widgets/sale_widget.dart';
import 'package:fresp/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> assetImages = [
    'assets/images/home1.jpg',
    'assets/images/home2.jpg',
    'assets/images/home3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getscreenSize;

    return Scaffold(
        body: Column(children: [
      SizedBox(
          height: size.height * 0.33,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                assetImages[index],
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            itemCount: assetImages.length,
            // ignore: prefer_const_constructors
            pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                // ignore: prefer_const_constructors
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Color.fromARGB(255, 12, 230, 19))),
          )),
      Text(
        "Fruits",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      SizedBox(
        height: size.height * 0.16,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return SaleWidget();
          }),
        ),
      ),
      Text(
        "Vegetables",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: size.height * 0.16,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return SaleWidget();
          }),
        ),
      ),
      Text(
        "Groceries",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: size.height * 0.17,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return SaleWidget();
          }),
        ),
      ),
    ]));
  }
}
