import 'package:flutter/material.dart';
import 'package:js_guru/app/models/post_model.dart';
import 'package:js_guru/app/providers/posts_provider/posts_provider.dart';
import 'package:js_guru/app/utils/extensions/int_extensions.dart';
import 'package:js_guru/widgets/dialogs/simple_dialog.dart';
import 'package:js_guru/widgets/post_card/post_card.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../theme/color_helper.dart';
import '../../../widgets/app_bars/common_app_bar.dart';
import '../../../widgets/loaders/loader_app_dialog.dart';
import '../../models/comments_model.dart';
import '../../utils/language/language_strings.dart';
import 'home_page_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _getInitialData();
    super.initState();
  }

  Future<void> _getInitialData() async {
    await context.read<PostsProvider>().fetchPosts();
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
  );

  Widget _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 25),
        _buildHeadline(context),
        if (context.watch<PostsProvider>().postsNotEmptyOrNull()) _listOfPosts(context) else _buildEmptyState(context),
      ],
    );
  }

  Widget _buildHeadline(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(Language.home_headline,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Text(Language.home_subtitle,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
        const Divider(),
      ],
    ),
  );

  Widget _listOfPosts(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: context.watch<PostsProvider>().posts!.length,
      itemBuilder: (BuildContext context, int index) {
        final Post _p = context.read<PostsProvider>().posts![index];
        return PostCard(
          dotColor: index.getRandomColor(),
          onCardPressed: () async {
            customFutureBuilderLoader(context: context);
            await context.read<PostsProvider>().fetchPostComments(_p.id).then((String? error) {
              Navigator.of(context).pop();
              if (error != null) {
                customSimpleDialog(context, title: Language.common_error, content: error, buttonText: Language.common_ok);
              }
            });
          },
          body: _p.body,
          commentOpened: false,
          title: _p.title,
          comments: _p.comments ?? <CommentsModel>[],
          user: 'User',
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(Assets.assetsEmpty, height: 160),
        const SizedBox(height: 15),
        const Text(Language.home_empty),
        const SizedBox(height: 15),
      ],
    );
  }
}
