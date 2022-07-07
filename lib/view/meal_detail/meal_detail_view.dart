import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/model/meal/meal_model.dart';
import 'package:provider/provider.dart';

import '../../core/constants/country_flag_constants.dart';
import '../../service/meal_service.dart';
import '../../service/network_manager.dart';
import '../../viewModel/model_provider.dart';
import '../home/home_view.dart';

class DetailView extends StatefulWidget {
  const DetailView({required String id, Key? key})
      : _id = id,
        super(key: key);
  final String _id;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelProvider>.value(
      builder: (context, child) {
        return Scaffold(
            body: Center(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              backgroundColor: Color(0xffef0086),
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                  background: TopImageWidget(
                imageUrl: context.watch<ModelProvider>().resourcesMeal ?? [],
              )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Card(
                  child: Column(children: [
                Text(
                  '${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strMeal : ""}',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Color(0xffef0086)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                              "Category: ${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strCategory : ""}",
                              style: ThemeData.light()
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontSize: 18.0,
                                  )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Row(
                            children: [
                              context
                                      .watch<ModelProvider>()
                                      .resourcesMeal
                                      .isNotEmpty
                                  ? SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.04,
                                      child: Image.network(countryFlagMap[
                                              '${context.watch<ModelProvider>().resourcesMeal[0].strArea}'] ??
                                          ""))
                                  : Container(),
                              Text(
                                  " ${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strArea : ""}",
                                  style: ThemeData.light()
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        fontSize: 18.0,
                                      )),
                            ],
                          ),
                        ),
                      ]),
                )
              ])),
              IngredientsWidget(
                ingredients: context.watch<ModelProvider>().ingList,
                measures: context.watch<ModelProvider>().measureList,
              ),
              Card(
                  child: Column(
                children: [
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        '${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strInstructions : ""}',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                )),
                  ),
                ],
              ))
            ]))
          ]),
        ));
      },
      value: ModelProvider(MealService(ProjectNetworkManager.instance.service),
          FetchType.meal.value, widget._id),
    );
  }
}

class TopImageWidget extends StatelessWidget {
  const TopImageWidget({
    required List<Meals> imageUrl,
    Key? key,
  })  : _imageUrl = imageUrl,
        super(key: key);
  final List<Meals> _imageUrl;

  @override
  Widget build(BuildContext context) {
    return _imageUrl.isNotEmpty
        ? FadeInImage.assetNetwork(
            placeholder: 'assets/image/png/img_placeholder.png',
            image: _imageUrl[0].strMealThumb ?? '',
          )
        : Container();
  }
}

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    required List<String> ingredients,
    required List<String> measures,
    Key? key,
  })  : _ingredients = ingredients,
        _measures = measures,
        super(key: key);
  final List<String> _ingredients;
  final List<String> _measures;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(children: [
              for (int i = 0; i < _ingredients.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('${_ingredients[i]}',
                              style: ThemeData.light()
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontSize: 18.0,
                                  )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text('${_measures[i]}',
                              style: ThemeData.light()
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                      ]),
                )
            ]))
      ]),
    );
  }
}
