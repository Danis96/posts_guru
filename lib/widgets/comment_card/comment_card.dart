import 'package:flutter/material.dart';
import 'package:js_guru/app/models/comments_model.dart';
import 'package:js_guru/app/utils/constants/constants.dart';
import 'package:js_guru/theme/color_helper.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    this.title = '',
    this.body = '',
    this.user = '',
    this.dotColor = Colors.white,
    this.commentOpened = false,
    this.onCardPressed,
    this.comments = const <Widget>[],
  });

  final Color dotColor;
  final String title;
  final String body;
  final String user;
  final bool commentOpened;
  final Function? onCardPressed;
  final List<Widget> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(color: ColorHelper.black.color.withOpacity(0.75), borderRadius: BorderRadius.circular(20)),
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
          Align(alignment: Alignment.centerRight, child: _buildUser(context)),
        ],
      ),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 10, height: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor)),
        const SizedBox(width: 15),
        Container(width: MediaQuery.of(context).size.width / 2.2, child: _buildStyledText(context, title, maxLines: 1, fontSize: 16)),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: _buildStyledText(context, body, maxLines: 3, fontSize: 12, fontWeight: FontWeight.w200),
    );
  }

  Widget _buildUser(BuildContext context) {
    return _buildStyledText(context, user, maxLines: 1, fontSize: 12);
  }

  Widget _buildStyledText(BuildContext context, String text,
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
