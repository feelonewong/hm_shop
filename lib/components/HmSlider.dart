import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  const HmSlider({super.key});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

// 首页轮播图组件
class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blue),
      child: Text("轮播图组件", style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
