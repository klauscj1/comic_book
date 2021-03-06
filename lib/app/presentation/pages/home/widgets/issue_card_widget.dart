import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/domain/utils/date_to_string.dart';

import 'package:comic_book/app/presentation/pages/home/home_page.dart';
import 'package:comic_book/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final typeView = homeProvider.read.typeView;
    return InkWell(
      onTap: () {
        homeProvider.read.selectedIssue = issue;
        Navigator.pushNamed(context, Routes.detail);
      },
      child: typeView
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading_image.gif',
                    image: issue.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "${issue.name} ${issue.issueNumber}",
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(dateToStringFormat(issue.dateAdded))
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .5,
                    width: size.width * .4,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading_image.gif',
                      image: issue.image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${issue.name} ${issue.issueNumber}",
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                        Text(dateToStringFormat(issue.dateAdded))
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
