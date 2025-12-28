import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    // 注意这里不能直接用ListView, 因为ListView不能设置宽高
    return SizedBox(
      height: 60,
      child: ListView.builder(
        // 设置滚动方式 水平滚动还是垂直滚动
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            height: 60,
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "分类${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
