import 'package:flutter/material.dart';

class MealListView extends StatefulWidget {
  const MealListView({Key? key}) : super(key: key);

  @override
  State<MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal List'),
        centerTitle: true,
      ),

    );
  }
}
