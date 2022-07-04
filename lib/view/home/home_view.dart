import 'package:auto_size_text/auto_size_text.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(textEditingController),
        body: Column(
          children: const [
            HorizontalList(title: "Categories"),
            HorizontalList(title: "Area"),
            HomeSmallList(title: "Ingredients",)
          ],
        ));
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

class HomeSmallList extends StatelessWidget {
  const HomeSmallList({
    Key? key,
    required String title,
  })  : _title = title,
        super(
          key: key,
        );
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        children: [
          HomeTitle(title: _title),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(children: [
                  Card(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.grey)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Ingredient $index"),
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

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    required String title,
    Key? key,
  })  : _title = title,
        super(
          key: key,
        );
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Column(
        children: [
          HomeTitle(title: _title),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
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
                            'https://tahititourisme.com/wp-content/uploads/2020/05/Featured-Image-700-x-700-px-1-1.png',
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Center(
                              child: AutoSizeText(
                                '$_title $index',
                                style: Theme.of(context).textTheme.labelSmall,
                                maxLines: 2,
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
