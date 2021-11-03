import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../detail_page.dart';

class LocationsGridView extends StatelessWidget {
  const LocationsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (_, ref, __) {
        final locations =
            ref.watch(detailProvider.ids(() => ['locations'])).locations;
        return locations.isNotEmpty
            ? SizedBox(
                height: size.height * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Locations",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: locations.length,
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
                                  image: locations[index].image!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                locations[index].name!,
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
