import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'Click.dart';
import 'DetailScreen.dart';
import 'Model.dart';
import 'main.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}
List<Model> bookmarks = [];

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).ChangeTheme();
            },
            icon: Provider.of<ThemeProvider>(context).isDrak
                ? Icon(Icons.dark_mode_outlined)
                : Icon(Icons.light_mode_outlined),
          ),
          IconButton(
            onPressed: () {
              _showBookmarks(context);
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(30),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: modelList.length,
          itemBuilder: (context, index) {
            Model model = modelList[index];
            bool isBookmarked = bookmarks.contains(model);
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 300),
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 2500),
                child: InkWell(
                  onTap: () {
                    print('Tapped on ${model.name}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(model: model),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                        Provider.of<ThemeProvider>(context).isDrak ? 0.1 : 0.90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: NetworkImage(model.image)),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isBookmarked) {
                                      bookmarks.remove(model);
                                    } else {
                                      bookmarks.add(model);
                                    }
                                  });
                                },
                                icon: Icon(
                                  isBookmarked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isBookmarked ? Colors.red : null,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _showBookmarks(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bookmarked Items'),
            content: Column(
              children: [
                for (Model bookmark in bookmarks)
                  ListTile(
                    title: Text(bookmark.name),

                  ),
              ],
            ),
          );
        }
    );
  }
}
