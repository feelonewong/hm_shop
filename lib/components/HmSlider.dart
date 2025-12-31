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
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _carouselController, // 绑定controller对象
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
        onPageChanged: (int index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(left: 30, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(0, 0, 0, 0.5),
      ),
      child: Text("请搜索...", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _getSliderDot() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 主轴对齐方式
        spacing: 10,
        children: List.generate(widget.bannerList.length, (index) {
          return GestureDetector(
            onTap: () {
              _carouselController.jumpToPage(index);
            },
            // 属性发生变化的时候自动实现动画效果
            child: AnimatedContainer(
              // 整体加一个动画的效果 过渡时间为300ms
              duration: Duration(milliseconds: 300),
              width: _currentIndex == index ? 40 : 20,
              height: 6,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.white
                    : Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
        Positioned(left: 0, right: 0, top: 10, child: _getSearch()),
        Positioned(left: 0, right: 0, bottom: 10, child: _getSliderDot()),
      ],
    );
  }
}
