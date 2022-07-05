import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            Image.network("https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
            fit: BoxFit.fitWidth),

          ],
        ),
      ),
    );
  }
}
