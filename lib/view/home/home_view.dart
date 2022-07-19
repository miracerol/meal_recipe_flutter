import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_recipe_flutter/core/constants/app_constants.dart';
import 'package:meal_recipe_flutter/core/constants/asset_constants.dart';
import 'package:meal_recipe_flutter/core/constants/design_constants.dart';
import 'package:meal_recipe_flutter/core/constants/local_constants.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';
import 'package:meal_recipe_flutter/product/loading_widget/loadingWidget.dart';
import 'package:meal_recipe_flutter/product/navigator/app_router.dart';
import 'package:meal_recipe_flutter/product/theme_notifier/theme_notifier.dart';
import 'package:meal_recipe_flutter/service/meal_service.dart';
import 'package:meal_recipe_flutter/service/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../core/constants/country_flag_constants.dart';
import '../../model/area/area_model.dart';
import '../../service/meal_service.dart';
import '../../service/network_manager.dart';
import '../../viewModel/model_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: DesignConstants.themeDuration,
    );
    animationController.animateTo(SharedPrefs.instance.prefs.getBool(AppConstants.themeSP)! ? 0.5 : 0);
  }

  @override
  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    return ChangeNotifierProvider<ModelProvider>.value(
      builder: (context, child) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: buildAppBar(textEditingController),
            body: context.watch<ModelProvider>().isLoading
                ? const LoadingWidget()
                : Column(
                    children: [
                      HorizontalList(
                        title: LocalConstants.categories,
                        items: context.watch<ModelProvider>().resourcesCategory,
                      ),
                      HorizontalList(
                        title: LocalConstants.area,
                        items: context.watch<ModelProvider>().resourcesArea,
                      ),
                      HomeSmallList(
                        title: LocalConstants.ingredients,
                        items:
                            context.watch<ModelProvider>().resourcesIngredient,
                      )
                    ],
                  ));
      },
      value: ModelProvider(MealService(ProjectNetworkManager.instance.service),
          FetchType.all.value),
    );
  }

  AppBar buildAppBar(TextEditingController textEditingController) {
    return AppBar(
      title: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: DesignConstants.searchRadius),
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
                hintText: LocalConstants.search,
                border: InputBorder.none),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: (){
            var isLight = SharedPrefs.instance.prefs.getBool(AppConstants.themeSP);
            animationController.animateTo(isLight! ? 0: 0.5);
            context.read<ThemeNotifier>().changeTheme();
          },
          child: LottieBuilder.asset(AssetConstants.themeSwitchPath,
              repeat: false, controller: animationController),
        ),
      ],
    );
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
                  InkWell(
                    onTap: () {
                      context.router.push(MealListRoute(
                          type: LetterType.typeI.value,
                          query:
                              renameIng(widget._items[index].strIngredient)));
                    },
                    child: Card(
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.outline)),
                      child: Center(
                        child: Padding(
                          padding: DesignConstants.mediumPaddingAll,
                          child: Text(
                            widget._items[index].strIngredient ?? "",
                          ),
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
                  child: InkWell(
                    onTap: () {
                      context.router.push(MealListRoute(
                          type: widget.itemList[index] is Categories
                              ? LetterType.typeC.value
                              : LetterType.typeA.value,
                          query: widget.itemList[index] is Categories
                              ? widget.itemList[index].strCategory
                              : widget.itemList[index].strArea));
                    },
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: DesignConstants.homeCardBorderRadius,
                        ),
                        child: Column(
                          children: [
                            FadeInImage.assetNetwork(
                              placeholder: AssetConstants.placeholderPinkPath,
                              image: widget.itemList[index] is Categories
                                  ? widget.itemList[index].strCategoryThumb
                                  : countryFlagMap[
                                      widget.itemList[index].strArea],
                              fit: BoxFit.fitWidth,
                            ),
                            Expanded(
                              child: Padding(
                                padding: DesignConstants.verySmallPaddingAll,
                                child: Center(
                                  child: AutoSizeText(
                                    widget.itemList[index] is Categories
                                        ? widget.itemList[index].strCategory
                                        : widget.itemList[index] is MealsA
                                            ? widget.itemList[index].strArea ??
                                                ""
                                            : "",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
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
      padding: DesignConstants.mediumPaddingAll,
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
  meal,
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
      case FetchType.meal:
        return 5;
    }
  }
}

enum LetterType {
  typeI,
  typeA,
  typeC,
  typeS,
}

extension LetterTypeExtension on LetterType {
  String get value {
    switch (this) {
      case LetterType.typeI:
        return "i";
      case LetterType.typeA:
        return "a";
      case LetterType.typeC:
        return "c";
      case LetterType.typeS:
        return "s";
    }
  }
}

String renameIng(String fullName) {
  // return lowercase full name and replace spaces with underscores
  return fullName.toLowerCase().replaceAll(" ", "_");
}
