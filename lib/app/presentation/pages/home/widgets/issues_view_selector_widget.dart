import 'package:comic_book/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class IssuesViewSelector extends StatelessWidget {
  const IssuesViewSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final typeView = ref.watch(homeProvider.ids(() => ['typeView'])).typeView;
      return Row(
        children: [
          TextButton.icon(
            onPressed: homeProvider.read.changeTypeView,
            icon: Icon(
              Icons.list,
              color: typeView ? Colors.grey : Colors.black,
            ),
            label: Text(
              'List',
              style: TextStyle(
                color: typeView ? Colors.grey : Colors.black,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: homeProvider.read.changeTypeView,
            icon: Icon(
              Icons.grid_3x3,
              color: typeView ? Colors.black : Colors.grey,
            ),
            label: Text(
              'Grid',
              style: TextStyle(
                color: typeView ? Colors.black : Colors.grey,
              ),
            ),
          )
        ],
      );
    });
  }
}
