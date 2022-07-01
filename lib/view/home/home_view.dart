import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    return Scaffold(
      appBar: buildAppBar(textEditingController),
      body: Column(
        // create a large headline, horizontal slideble cards
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Categories',
              style: Theme.of(context).textTheme.labelLarge,

            ),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width *0.3,
                  child: Card(
                    child: Center(
                      child: Text('$index'),
                    ),
                  ),
                );
              },
            ),
          ),
          Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height * 0.6,
          ),
        ],
      )
    );
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
