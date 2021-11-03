import 'package:flutter/material.dart';

class IssueLoadinData extends StatelessWidget {
  const IssueLoadinData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Loading data..."),
            ],
          ),
        )
      ],
    );
  }
}
