import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'issue_card_widget.dart';

class IssueListView extends StatelessWidget {
  const IssueListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Issue> issues = homeProvider.read.issues;
    return ListView.separated(
      separatorBuilder: (_, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        );
      },
      itemCount: issues.length,
      itemBuilder: (_, index) {
        return IssueCard(issue: issues[index]);
      },
    );
  }
}
