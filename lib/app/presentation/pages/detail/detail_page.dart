import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/presentation/pages/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

final detailProvider = SimpleProvider(
  (ref) => DetailController(ref.arguments ?? ''),
);

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.issue}) : super(key: key);
  final Issue issue;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    print(widget.issue.toJson());
    detailProvider.setArguments(widget.issue.apiDetailUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (_, ref, __) {
          final fetching =
              ref.watch(detailProvider.ids(() => ['fetching'])).fetching;
          return Text(fetching ? "Loading..." : "Ready");
        },
      ),
    );
  }
}
