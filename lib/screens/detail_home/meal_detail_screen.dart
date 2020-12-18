import 'package:flutter/material.dart';
import 'package:tess/screens/components/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: Colors.greenAccent,
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
                child: Image.asset(
                  meal.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    meal.mealTime.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Kanit',
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  subtitle: Text(
                    meal.name,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    //     children: <Widget>[
                    //       for (int i = 0; i < meal.ingredients.length; i++)
                    //         Padding(
                    //           padding: const EdgeInsets.only(bottom: 6),
                    //           child: Text(
                    //             meal.ingredients[i],
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //            ),
                    //         ),
                    //      ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 18, bottom: 32),
                  child: Text(
                    meal.preparation,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      color: Colors.green[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
