import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  const HmMoreList({super.key});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      sliver: SliverGrid.builder(
        // 每列显示几个 还可以设置mainAxisSpacing 上下间距  crossAxisSpacing 左右间距 childAspectRatio 宽高比
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        // 最大宽度不能超过多少
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: maxCrossAxisExtent,),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("商品", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
