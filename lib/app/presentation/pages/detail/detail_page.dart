import 'package:comic_book/app/domain/models/issue_model.dart';
import 'package:comic_book/app/presentation/pages/detail/controller/detail_controller.dart';
import 'package:comic_book/app/presentation/pages/detail/widgets/charaters_gridview_widget.dart';
import 'package:comic_book/app/presentation/pages/detail/widgets/concepts_gridview_widget.dart';
import 'package:comic_book/app/presentation/pages/detail/widgets/locations_gridview_widget.dart';
import 'package:comic_book/app/presentation/pages/detail/widgets/teams_gridview_widget.dart';
import 'package:comic_book/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

final detailProvider = SimpleProvider(
  (ref) => DetailController(ref.arguments ?? ''),
);

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithArguments(
      onReady: (RouteSettings settings) {
        final issue = homeProvider.read.selectedIssue;
        detailProvider.setArguments(issue.apiDetailUrl);
      },
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return LayoutBuilder(
          builder: (context, constrains) {
            print("${constrains.maxWidth}, ${constrains.maxHeight}");
            return Scaffold(
              backgroundColor: Colors.grey[100],
              body: constrains.maxWidth < 680
                  ? ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: size.width * .3,
                          height: size.height * .3,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading_image.gif',
                            image: homeProvider.read.selectedIssue.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer(
                          builder: (_, ref, __) {
                            final fetching = ref
                                .watch(detailProvider.ids(() => ['fetching']))
                                .fetching;
                            return Center(
                              child: fetching
                                  ? const CircularProgressIndicator()
                                  : Container(),
                            );
                          },
                        ),
                        const CharactersGridView(),
                        const TeamsGridView(),
                        const LocationsGridView(),
                        const ConceptsGridView(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: constrains.maxWidth * .6,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              Consumer(
                                builder: (_, ref, __) {
                                  final fetching = ref
                                      .watch(detailProvider
                                          .ids(() => ['fetching']))
                                      .fetching;
                                  return Center(
                                    child: fetching
                                        ? const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: CircularProgressIndicator(),
                                          )
                                        : Container(),
                                  );
                                },
                              ),
                              const CharactersGridView(),
                              const TeamsGridView(),
                              const LocationsGridView(),
                              const ConceptsGridView(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          width: constrains.maxWidth * .4,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Expanded(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading_image.gif',
                                image: homeProvider.read.selectedIssue.image!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
