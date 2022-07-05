import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';
import 'package:meal_recipe_flutter/model/ingredient/ingredient_model.dart';
import 'package:meal_recipe_flutter/service/meal_service.dart';
import 'package:provider/provider.dart';

import '../../model/area/area_model.dart';
import '../../service/network_manager.dart';
import '../../viewModel/model_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    return ChangeNotifierProvider<ModelProvider>(
        create: (context) => ModelProvider(
            MealService(ProjectNetworkManager.instance.service),
            FetchType.all.value),
        builder: (context, child) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: buildAppBar(textEditingController),
              body: Column(
                children: [
                  HorizontalList(
                    title: "Categories",
                    items:
                        context.watch<ModelProvider>().resourcesCategory,
                  ),
                  HorizontalList(
                    title: "Area",
                    items:
                        context.watch<ModelProvider>().resourcesArea,
                  ),
                  HomeSmallList(
                    title: "Ingredients",
                    items: context.watch<ModelProvider>().resourcesIngredient,
                  )
                ],
              ));
        });
  }

  AppBar buildAppBar(TextEditingController textEditingController) {
    return AppBar(
        title: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  textEditingController.clear();
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
        ),
      ),
    ));
  }
}

class HomeSmallList extends StatefulWidget {
  const HomeSmallList({
    required String title,
    required List<dynamic> items,
    Key? key,
  })  : _title = title,
        _items = items,
        super(
          key: key,
        );
  final String _title;
  final List<dynamic> _items;
  @override
  State<HomeSmallList> createState() => _HomeSmallListState();
}

class _HomeSmallListState extends State<HomeSmallList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        children: [
          HomeTitle(title: widget._title),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget._items.length,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(children: [
                  Card(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.grey)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget._items[index].strIngredient ?? "",
                        ),
                      ),
                    ),
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    required String title,
    required List<dynamic> items,
    Key? key,
  })  : _title = title,
        itemList = items,
        super(
          key: key,
        );
  final String _title;
  final List<dynamic> itemList;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Column(
        children: [
          HomeTitle(title: widget._title),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            widget.itemList[index] is Categories
                                ? widget.itemList[index].strCategoryThumb : "http://via.placeholder.com/700x700",
                            fit: BoxFit.fitWidth,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Center(
                                child: AutoSizeText(
                                  widget.itemList[index] is Categories
                                      ? widget.itemList[index].strCategory
                                      : widget.itemList[index] is MealsA
                                          ? widget.itemList[index].strArea ?? ""
                                          : "",
                                  style: Theme.of(context).textTheme.labelSmall,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          _title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

enum FetchType {
  all,
  category,
  area,
  ingredient,
  searchItem,
}

extension FetchTypeExtension on FetchType {
  int get value {
    switch (this) {
      case FetchType.all:
        return 0;
      case FetchType.category:
        return 1;
      case FetchType.area:
        return 2;
      case FetchType.ingredient:
        return 3;
      case FetchType.searchItem:
        return 4;
    }
  }
}
