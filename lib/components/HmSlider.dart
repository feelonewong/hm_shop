import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  final bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

// 首页轮播图组件
class _HmSliderState extends State<HmSlider> {
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        height: 240,
        viewportFraction: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
