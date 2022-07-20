import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/core/constants/asset_constants.dart';
import 'package:meal_recipe_flutter/core/constants/design_constants.dart';
import 'package:meal_recipe_flutter/core/constants/local_constants.dart';
import 'package:meal_recipe_flutter/model/meal/meal_model.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
            buildSliverAppBar(context),
            SliverList(
                delegate: SliverChildListDelegate([
              const MealInfoWidget(),
              IngredientsWidget(
                ingredients: context.watch<ModelProvider>().ingList,
                measures: context.watch<ModelProvider>().measureList,
              ),
              const InstructionsWidget()
            ]))
          ]),
        ));
      },
      value: ModelProvider(MealService(ProjectNetworkManager.instance.service),
          FetchType.meal.value, widget._id),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      flexibleSpace: FlexibleSpaceBar(
          background: TopImageWidget(
        imageUrl: context.watch<ModelProvider>().resourcesMeal,
      )),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            _onShare(
                context,
                Provider.of<ModelProvider>(context, listen: false)
                    .resourcesMeal[0]
                    .getShareText(),
                Provider.of<ModelProvider>(context, listen: false)
                    .resourcesMeal[0]
                    .strMeal!);
          },
        ),
      ],
    );
  }

  void _onShare(BuildContext context, String text, String subject) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(text,
        subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(
          LocalConstants.detailInstructions,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Padding(
          padding: DesignConstants.largePaddingAll,
          child: Text(
              '${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strInstructions : ""}',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
      ],
    ));
  }
}

class MealInfoWidget extends StatelessWidget {
  const MealInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      Center(
        child: Text(
          '${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strMeal : ""}',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      Padding(
        padding: DesignConstants.mediumPaddingVertical,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: DesignConstants.largePaddingLeft,
            child: Text(
                "${LocalConstants.detailCategory}: ${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strCategory : ""}",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Padding(
            padding: DesignConstants.largePaddingRight,
            child: Row(
              children: [
                context.watch<ModelProvider>().resourcesMeal.isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Image.network(countryFlagMap[
                                '${context.watch<ModelProvider>().resourcesMeal[0].strArea}'] ??
                            ""))
                    : Container(),
                Text(
                    " ${context.watch<ModelProvider>().resourcesMeal.isNotEmpty ? context.watch<ModelProvider>().resourcesMeal[0].strArea : ""}",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ]),
      )
    ]));
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
            placeholder: AssetConstants.placeholderPath,
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
          LocalConstants.detailIngredients,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Padding(
            padding: DesignConstants.mediumPaddingBottom,
            child: Column(children: [
              for (int i = 0; i < _ingredients.length; i++)
                Padding(
                  padding: DesignConstants.mediumPaddingBottom,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: DesignConstants.largePaddingLeft,
                          child: Text(_ingredients[i],
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Padding(
                          padding: DesignConstants.largePaddingRight,
                          child: Text(_measures[i],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
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
