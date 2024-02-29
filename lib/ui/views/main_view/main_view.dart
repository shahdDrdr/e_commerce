
import 'package:e_commerc/ui/views/catrs/carts_view.dart';

import 'package:e_commerc/ui/views/main_view/main_view_widg/bottom_navigation_bar.dart';
import 'package:e_commerc/ui/views/main_view/main_view_widg/side_item/side_menu.dart';

import 'package:e_commerc/ui/views/store_challenge/all_product/all_product_view.dart';
import 'package:e_commerc/ui/views/store_challenge/home_view/home_view.dart';
import 'package:flutter/material.dart';



class MainView extends StatefulWidget {
  
  const MainView({super.key, });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController();
  BottomNavigationEnum selecte = BottomNavigationEnum.HOME;
  GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scafolldKey,
        drawer: SideMenu(),
        bottomNavigationBar: CustomBottmNavigation(
          onTap: (selectedView, index) {
            selecte = selectedView;
            setState(() {});
            controller.jumpToPage(index);
            //! here notify onTap in navitem
          },
          selectedView: selecte,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeViewChallenge(),
            AllProductChallenge(),
            CartsView(),
          ],
        ),
      ),
    );
  }
}
