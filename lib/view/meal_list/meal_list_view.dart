import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/model/searchItem/search_item_model.dart';
import 'package:provider/provider.dart';

import '../../service/meal_service.dart';
import '../../service/network_manager.dart';
import '../../viewModel/model_provider.dart';
import '../home/home_view.dart';

class MealListView extends StatefulWidget {
  const MealListView({Key? key}) : super(key: key);

  @override
  State<MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelProvider>(
        create: (context) => ModelProvider(
            MealService(ProjectNetworkManager.instance.service),
            FetchType.searchItem.value,"c","Seafood"),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Meal List'),
              centerTitle: true,
            ),
            body: GridWidgetList(
              items: context.watch<ModelProvider>().resourcesSearchItem ?? [],
            ),
          );
        });
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
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 5 / 6.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: _items.length,
              itemBuilder: (BuildContext ctx, index) {
                return SizedBox(
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          _items[index].strMealThumb ?? "",
                          fit: BoxFit.fitWidth,
                        ),
                        Expanded(
                            child: Center(
                                child: AutoSizeText(
                          _items[index].strMeal ?? "",
                          maxLines: 2,
                          style: ThemeData.light().textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ))),
                      ],
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
