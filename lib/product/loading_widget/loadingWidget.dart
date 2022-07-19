import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_recipe_flutter/core/constants/asset_constants.dart';

abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AssetConstants.loadingAssetPath),
    );
  }
}

void openLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const LoadingWidget();
    },
  );
}

void closeLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}
