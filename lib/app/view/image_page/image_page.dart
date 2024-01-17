import 'package:flutter/material.dart';
import 'package:js_guru/app/models/image_model.dart';
import 'package:js_guru/app/providers/images_provider/images_provider.dart';
import 'package:js_guru/app/view/text_fields/custom_text_form_field.dart';
import 'package:js_guru/widgets/buttons/common_button.dart';
import 'package:js_guru/widgets/dialogs/simple_dialog.dart';
import 'package:js_guru/widgets/loaders/loader_app_dialog.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../theme/color_helper.dart';
import '../../../widgets/app_bars/common_app_bar.dart';
import '../../utils/language/language_strings.dart';
import '../home_page/home_page_drawer.dart';

class ImagePage extends StatefulWidget {
  ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _getInitialData();
    super.initState();
  }

  Future<void> _getInitialData() async {
    await context.read<ImagesProvider>().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(context),
      backgroundColor: ColorHelper.white.color,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => commonAppBar(
        context,
        color: ColorHelper.black.color,
        icon: Icons.menu_rounded,
        leadingIconColor: ColorHelper.white.color,
        onLeadingTap: () => _scaffoldKey.currentState!.openDrawer(),
        preferredSizeForBottom: const Size(100, 20),
      );

  Widget _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 25),
        _buildHeadline(context),
        const SizedBox(height: 25),
        if (context.watch<ImagesProvider>().imagesNotEmptyOrNull()) _listOfImages(context) else _buildEmptyState(context),
      ],
    );
  }

  Widget _buildHeadline(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(Language.img_headline,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Text(Language.img_subtitle,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
            const Divider(),
            _buildLimitTextField(context),
            Center(child: _buildSearchButton(context)),
          ],
        ),
      );

  Widget _buildSearchButton(BuildContext context) {
    return CommonButton(
      onPressed: () async {
        await context.read<ImagesProvider>().updateLimit();
      },
      buttonTitle: 'Update limit & search',
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(Assets.assetsEmpty, height: 160),
        const SizedBox(height: 15),
        const Text(Language.img_empty),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildLimitTextField(BuildContext context) {
    return CustomTextFormField(
      controller: context.watch<ImagesProvider>().limitController,
      hintText: Language.img_enter_hint,
      keyboardType: TextInputType.number,
    );
  }

  Widget _listOfImages(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: context.watch<ImagesProvider>().images!.length,
      itemBuilder: (BuildContext context, int index) {
        final ImageModel _p = context.read<ImagesProvider>().images![index];
        return Image.network(_p.url);
      },
    );
  }
}

// input copilot
//write me an example where we use _limit in jsonplaceholder.typicode.com/photos in flutter and how to create pagination where limit will be give by user which he will enter in text form field