import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/core/constants/local_constants.dart';
import 'package:meal_recipe_flutter/model/searchItem/search_item_model.dart';
import 'package:meal_recipe_flutter/product/navigator/app_router.dart';
import 'package:provider/provider.dart';

import '../../core/constants/asset_constants.dart';
import '../../core/constants/design_constants.dart';
import '../../service/meal_service.dart';
import '../../service/network_manager.dart';
import '../../viewModel/model_provider.dart';
import '../home/home_view.dart';

class MealListView extends StatefulWidget {
  const MealListView({required String type, required String query, Key? key})
      : _type = type,
        _query = query,
        super(key: key);
  final String _type;
  final String _query;

  @override
  State<MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelProvider>.value(
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: widget._type != LetterType.typeS.value
                ? Text(renameNormal(widget._query))
                : const Text(LocalConstants.listSearch),
            centerTitle: true,
          ),
          body: GridWidgetList(
            items: context.watch<ModelProvider>().resourcesSearchItem ?? [],
          ),
        );
      },
      value: ModelProvider(MealService(ProjectNetworkManager.instance.service),
          FetchType.searchItem.value, widget._type, widget._query),
    );
  }
}

class GridWidgetList extends StatelessWidget {
  const GridWidgetList({
    required List<ItemS> items,
    Key? key,
  })  : _items = items,
        super(key: key);
  final _items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: DesignConstants.mediumPaddingAll,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 5 / 6.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: _items.length,
              itemBuilder: (BuildContext ctx, index) {

                return SizedBox(
                  child: InkWell(
                    onTap: () {
                      context.router
                          .push(DetailRoute(id: _items[index].idMeal));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: DesignConstants.listCardBorderRadius,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: AssetConstants.placeholderPinkPath,
                              image: _items[index].strMealThumb ?? "",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                              child: Center(
                                  child: AutoSizeText(
                            _items[index].strMeal ?? "",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelSmall,
                            textAlign: TextAlign.center,
                          ))),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

String renameNormal(String lower) {
  // return replace underscores with spaces and capitalize first letters
  return lower.replaceAll('_', ' ').split(' ').map((word) {
    return word.substring(0, 1).toUpperCase() + word.substring(1);
  }).join(' ');
}
