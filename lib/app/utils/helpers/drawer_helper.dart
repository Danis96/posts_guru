import 'package:js_guru/app/utils/language/language_strings.dart';
import 'package:js_guru/routing/route_arguments.dart';
import 'package:js_guru/widgets/drawer_list_item/custom_drawer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routing/routes.dart';
import '../../../theme/color_helper.dart';

class DrawerHelper {
  List<DrawerListItem> drawerListItems(BuildContext context) {
    return <DrawerListItem>[
      DrawerListItem(
        title: Language.dr_item_home,
        routeName: Home,
        iconData: Icons.home,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorHelper.white.color),
      ),
    ];
  }
}
