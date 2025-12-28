import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  // 配置底部导航栏的数据，之所以用final是因为注册以后就不太会改了
  final List<Map<String, String>> _tabList = [
    {
      'icon': "lib/assets/ic_public_home_normal.png",
      'active_icon': "lib/assets/ic_public_home_active.png",
      'text': "首页",
    },
    {
      'icon': "lib/assets/ic_public_pro_normal.png",
      'active_icon': "lib/assets/ic_public_pro_active.png",
      'text': "分类",
    },
    {
      'icon': "lib/assets/ic_public_cart_normal.png",
      'active_icon': "lib/assets/ic_public_cart_active.png",
      'text': "购物车",
    },
    {
      'icon': "lib/assets/ic_public_my_normal.png",
      'active_icon': "lib/assets/ic_public_my_active.png",
      'text': "我的",
    },
  ];
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        label: _tabList[index]['text'],
        icon: Image.asset(_tabList[index]['icon']!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]['active_icon']!,
          width: 30,
          height: 30,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("主页")),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _getTabBarWidget(),
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
      ),
    );
  }
}
