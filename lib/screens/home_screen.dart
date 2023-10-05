import 'package:flutter/material.dart';
import 'package:like_cat/provider/cat_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);
    final likeNotifier = ValueNotifier<bool>(catProvider.catList[index].isLiked);


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber[600],
              width: 300,
              height: 100,
              child: Center(
                child: Text(
                  (index < catProvider.catList.length)
                      ? catProvider.catList[index].name
                      : 'No more cats',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(40),
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: likeNotifier,
                      builder: (context, isLiked, child) {
                        return IconButton(
                          onPressed: () {
                            catProvider.toggleLike(index);
                            likeNotifier.value = !isLiked;
                          },
                          icon: Icon(
                            (isLiked) ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                            size: 60,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          index = (index + 1) % catProvider.catList.length;
                          likeNotifier.value = catProvider.catList[index].isLiked;
                        });
                      },
                      icon: const Icon(Icons.chevron_right, size: 60,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}