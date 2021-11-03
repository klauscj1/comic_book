import 'package:comic_book/app/presentation/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import 'widgets/issues_gridview_widget.dart';
import 'widgets/issues_listview_widget.dart';
import 'widgets/issues_loading_widget.dart';
import 'widgets/issues_view_selector_widget.dart';

final homeProvider = SimpleProvider(
  (ref) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("ComicBook"),
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final fetching =
              ref.watch(homeProvider.ids(() => ['fetching'])).fetching;
          return fetching
              ? const IssueLoadinData()
              : Consumer(
                  builder: (_, ref, __) {
                    final homeController = ref
                        .watch(homeProvider.ids(() => ['issues', 'typeView']));
                    final typeView = homeController.typeView;
                    return Column(
                      children: [
                        Column(
                          children: [
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Last Issues"),
                                  IssuesViewSelector()
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                        Expanded(
                          child: typeView
                              ? const IssuesGridView()
                              : const IssueListView(),
                        )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
