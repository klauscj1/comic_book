import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'issue_card_widget.dart';

class IssuesGridView extends StatelessWidget {
  const IssuesGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Issue> issues = homeProvider.read.issues;
    return GridView.builder(
      itemCount: issues.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, index) {
        return IssueCard(issue: issues[index]);
      },
    );
  }
}
