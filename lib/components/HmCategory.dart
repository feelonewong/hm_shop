import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  const HmCategory({super.key, required this.categoryList});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    // 注意这里不能直接用ListView, 因为ListView不能设置宽高
    return SizedBox(
      height: 72,
      child: ListView.builder(
        // 设置滚动方式 水平滚动还是垂直滚动
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          final category = widget.categoryList[index];
          return Container(
            width: 70,
            height: 72,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(category.picture, width: 32, height: 32),
                  Text(
                    category.name,
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
