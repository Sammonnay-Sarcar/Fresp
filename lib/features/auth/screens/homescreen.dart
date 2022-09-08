import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fresp/features/auth/widgets/utils.dart';
import 'package:fresp/features/auth/widgets/sale_widget.dart';


import 'package:fresp/features/auth/widgets/text_widget.dart';

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
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }
   late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
        });
      });
      super. initState();
  }
       @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getscreenSize;

    return Scaffold(
      appBar: AppBar(
        elevation:0,
        title: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            _scrollToTop();
          },
          child: TextWidget(text:'Fresp.',color: Colors.white,
          textSize: 30,),
        ),
        
        backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(child: Column(children: [
      SizedBox(
          height: size.height * 0.30,
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
      const Text(
        "Fruits",
        style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      SizedBox(
        height: size.height * 0.18,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return const SaleWidget();
          }),
        ),
      ),
      const Text(
        "Vegetables",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: size.height * 0.18,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return SaleWidget();
          }),
        ),
      ),
      const Text(
        "Groceries",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: size.height * 0.18,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return const SaleWidget();
          }),
        ),
      ),
    ]),
    ));
  }
}

 
