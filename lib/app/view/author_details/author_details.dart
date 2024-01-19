import 'package:flutter/material.dart';
import 'package:js_guru/app/providers/posts_provider/posts_provider.dart';
import 'package:provider/provider.dart';

import '../../../theme/color_helper.dart';
import '../../../widgets/app_bars/common_app_bar.dart';
import '../../utils/language/language_strings.dart';

class AuthorDetailsPage extends StatelessWidget {
  const AuthorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody(context));
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) => commonAppBar(
      context,
      color: ColorHelper.black.color,
      icon: Icons.arrow_back_ios,
      leadingIconColor: ColorHelper.white.color,
      preferredSizeForBottom: const Size(100, 20),
      title: context.read<PostsProvider>().post.user!.name,
    );

Widget _buildBody(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    shrinkWrap: true,
    children: <Widget>[
      const SizedBox(height: 25),
      _buildHeadline(context),
      const SizedBox(height: 25),
      _buildAuthorDetailsItem(context, title: Language.author_username, content: context.watch<PostsProvider>().post.user!.username),
      const SizedBox(height: 15),
      _buildAuthorDetailsItem(context, title: Language.author_email, content: context.watch<PostsProvider>().post.user!.email),
      const SizedBox(height: 15),
      _buildAuthorDetailsItem(context, title: Language.author_phone, content: context.watch<PostsProvider>().post.user!.phone),
      const SizedBox(height: 15),
      _buildAuthorDetailsItem(context, title: Language.author_website, content: context.watch<PostsProvider>().post.user!.website),
      const SizedBox(height: 15),
      _buildAuthorDetailsItem(context, title: Language.author_company, content: context.watch<PostsProvider>().post.user!.company!.name),
      const SizedBox(height: 15),
      _buildAuthorDetailsItem(context,
          title: Language.author_address,
          content:
              '${context.watch<PostsProvider>().post.user!.address!.city}, ${context.watch<PostsProvider>().post.user!.address!.street} ${context.watch<PostsProvider>().post.user!.address!.zipcode}'),
    ],
  );
}

Widget _buildHeadline(BuildContext context) => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(Language.author_headline,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Text(Language.author_subtitle,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
          const Divider(),
        ],
      ),
    );

Widget _buildAuthorDetailsItem(BuildContext context, {String title = '', String content = ''}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
      const Divider(),
      Text(content),
    ],
  );
}
