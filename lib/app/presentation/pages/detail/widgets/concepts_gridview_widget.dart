import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../detail_page.dart';

class ConceptsGridView extends StatelessWidget {
  const ConceptsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (_, ref, __) {
        final concepts =
            ref.watch(detailProvider.ids(() => ['concepts'])).concepts;
        return concepts.isNotEmpty
            ? SizedBox(
                height: size.height * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Concepts",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: concepts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                          childAspectRatio: 8 / 2,
                        ),
                        itemBuilder: (_, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: size.width * .1,
                                height: size.width * .1,
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/images/loading_image.gif',
                                  image: concepts[index].image!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                concepts[index].name!,
                                maxLines: 4,
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
