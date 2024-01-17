import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../theme/color_helper.dart';
import '../../../widgets/drawer/custom_drawer.dart';
import '../../utils/helpers/drawer_helper.dart';

Widget buildDrawer(BuildContext context) {
  final DrawerHelper _drawerHelper = DrawerHelper();

  return CustomDrawer(
    widgetKey: const Key('home_page_drawer_key'),
    actionKey: const Key('drawer_action_home_page_key'),
    onDrawerItemPressed: (String value) {},
    onDrawerOpened: (String value) {},
    wrapWithMaterial: true,
    headerHeight: 200,
    backgroundColor: ColorHelper.white.color,
    listItems: _drawerHelper.drawerListItems(context),
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorHelper.black.color),
    logoutStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: ColorHelper.black.color),
    customHeader:
        Container(color: ColorHelper.black.color, child: Image.asset(Assets.assetsJsGuru, width: double.infinity, fit: BoxFit.contain)),
  );
}
