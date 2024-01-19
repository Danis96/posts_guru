import 'package:flutter/material.dart';
import 'package:js_guru/app/view/image_page/image_page.dart';
import '../../../widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../view/bottom_navigation_bar/bottom_navigation_page.dart';
import '../../view/home_page/home_page.dart';

class BottomNavigationHelper {
  List<CustomBottomNavigationItem> bottomNavigationItems() => <CustomBottomNavigationItem>[
        CustomBottomNavigationItem(title: 'Posts', icon: Icons.format_list_bulleted_rounded, page: const Homepage()),
        CustomBottomNavigationItem(title: 'Images', icon: Icons.image, page: ImagePage()),
      ];

  void selectNavigationItem(BuildContext context, int item) {
    final BottomNavigationBar navigationBar = bottomWidgetKey.currentWidget as BottomNavigationBar;
    navigationBar.onTap!(item);
  }
}
