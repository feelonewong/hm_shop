import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  const HmHot({super.key});

  @override
  State<HmHot> createState() => _HmHotState();
}

// 爆款推荐
class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(color: Colors.blue),
      child: Text("爆款推荐", style: TextStyle(color: Colors.white)),
    );
  }
}
