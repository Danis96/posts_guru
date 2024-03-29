import 'package:flutter/material.dart';
import 'package:js_guru/app/models/comments_model.dart';
import 'package:js_guru/app/utils/constants/constants.dart';
import 'package:js_guru/app/utils/language/language_strings.dart';
import 'package:js_guru/theme/color_helper.dart';
import 'package:js_guru/widgets/buttons/common_button.dart';
import 'package:js_guru/widgets/comment_card/comment_card.dart';
import 'package:js_guru/widgets/tappable_texts/custom_tappable_text.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    this.title = '',
    this.body = '',
    this.user = '',
    this.dotColor = Colors.white,
    this.onCardPressed,
    this.onCardOpened,
    this.comments = const <CommentsModel>[],
  });

  final Color dotColor;
  final String title;
  final String body;
  final String user;
  final Function? onCardPressed;
  final Function? onCardOpened;
  final List<CommentsModel>? comments;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool opened) {
        if (opened && onCardOpened != null) {
          onCardOpened!();
        }
      },
      initiallyExpanded: false,
      maintainState: false,
      title: _buildTitle(context),
      children: _buildCommentCards(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: ColorHelper.black.color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTitleRow(context),
          _buildBody(context),
          Align(alignment: Alignment.centerRight, child: _styledText(context, user, maxLines: 1, fontSize: 12)),
          _buildDetailsTappable(context),
        ],
      ),
    );
  }

  Widget _buildDetailsTappable(BuildContext context) {
    return CustomTappableText(
        text: Language.post_details,
        links: Language.post_details,
        onPressed: (int i) {
          if (onCardPressed != null) {
            onCardPressed!();
          }
        });
  }

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 10, height: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor)),
        const SizedBox(width: 15),
        Container(width: MediaQuery.of(context).size.width / 1.6, child: _styledText(context, title, maxLines: 1, fontSize: 16)),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: _styledText(context, body, maxLines: 3, fontSize: 12, fontWeight: FontWeight.w200),
    );
  }

  List<Widget> _buildCommentCards() {
    return comments != null && comments!.isNotEmpty
        ? comments!
            .map((CommentsModel e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44), child: CommentCard(user: e.email, body: e.body, title: e.name)))
            .toList()
        : <Widget>[];
  }

  Widget _styledText(BuildContext context, String text,
      {double fontSize = 14, int maxLines = 1, FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontFamily: FontConstants.POPPINS_FONT,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: ColorHelper.white.color.withOpacity(0.7),
          ),
    );
  }
}
