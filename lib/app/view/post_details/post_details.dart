import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:js_guru/app/models/comments_model.dart';
import 'package:js_guru/app/providers/posts_provider/posts_provider.dart';
import 'package:js_guru/app/utils/extensions/int_extensions.dart';
import 'package:js_guru/routing/routes.dart';
import 'package:js_guru/widgets/comment_card/comment_card.dart';
import 'package:provider/provider.dart';

import '../../../theme/color_helper.dart';
import '../../../widgets/app_bars/common_app_bar.dart';
import '../../../widgets/tappable_texts/custom_tappable_text.dart';
import '../../utils/language/language_strings.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) => commonAppBar(
      context,
      color: ColorHelper.black.color,
      icon: Icons.arrow_back_ios,
      leadingIconColor: ColorHelper.white.color,
      preferredSizeForBottom: const Size(100, 20),
      title: context.read<PostsProvider>().post.title,
    );

Widget _buildBody(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    shrinkWrap: true,
    children: <Widget>[
      const SizedBox(height: 25),
      _buildHeadline(context),
      const SizedBox(height: 25),
      _buildPostDetailsItem(context, title: Language.detail_title, content: context.watch<PostsProvider>().post.title),
      const SizedBox(height: 15),
      _buildPostDetailsItem(context, title: Language.detail_author, content: context.watch<PostsProvider>().post.user!.name),
      const SizedBox(height: 15),
      _buildPostDetailsItem(context, title: Language.detail_content, content: context.watch<PostsProvider>().post.body),
      const SizedBox(height: 25),
      _buildPostDetailsItem(context, title: Language.detail_comment),
      _listOfComments(context),
    ],
  );
}

Widget _buildDetailsAuthorTappable(BuildContext context) {
  return CustomTappableText(
    text: Language.detail_check_author,
    links: Language.detail_check_author_link,
    onPressed: (int i) => context.push('$Home$AuthorDetails'),
    linkStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
  );
}

Widget _buildHeadline(BuildContext context) => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(Language.detail_headline,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Text(Language.detail_subtitle,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
          _buildDetailsAuthorTappable(context),
          const Divider(),
        ],
      ),
    );

Widget _buildPostDetailsItem(BuildContext context, {String title = '', String content = ''}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
      const Divider(),
      Text(content),
    ],
  );
}

Widget _listOfComments(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: context.watch<PostsProvider>().post.comments!.length,
    itemBuilder: (BuildContext context, int index) {
      final CommentsModel _p = context.watch<PostsProvider>().post.comments![index];
      return CommentCard(dotColor: index.getRandomColor(), body: _p.body, title: _p.email, user: _p.email);
    },
  );
}
