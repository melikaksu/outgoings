import 'package:CWCFlutter/api/food_api.dart';
import 'package:CWCFlutter/model/food.dart';
import 'package:CWCFlutter/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_form.dart';

class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    bool isDone=false; 
    _onFoodDeleted(Food food) {
      Navigator.pop(context);
      foodNotifier.deleteFood(food);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(foodNotifier.currentFood.name),
      ),
      body:
      ListView.builder( 
           itemCount: foodNotifier.currentFood.subIngredients.length,
           itemBuilder: (BuildContext context, int index) {
    
      return

        ListTile(
          leading: GestureDetector(
            onTap: () {setState(()=> isDone = !isDone);},
              child: Icon(
              isDone
              ?Icons.check_box
              :Icons.check_box_outline_blank
              ),
          ), 
          trailing: Icon(Icons.clear),
          title: Text(foodNotifier.currentFood.subIngredients[index].toString()),
        );

         },)

        // Center(
        //   child: Container(
        // //     child: Column(
        //       children: <Widget>[
        //         Image.network(
        //           foodNotifier.currentFood.image != null
        //               ? foodNotifier.currentFood.image
        //               : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
        //           width: MediaQuery.of(context).size.width,
        //           height: 250,
        //           fit: BoxFit.fitWidth,
        //         ),
        //         SizedBox(height: 24),
        //         Text(
        //           foodNotifier.currentFood.name,
        //           style: TextStyle(
        //             fontSize: 40,
        //           ),
        //         ),
        //         Text(
        //           'Category: ${foodNotifier.currentFood.category}',
        //           style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        //         ),
        //         SizedBox(height: 20),
        //         Text(
        //           "Ingredients",
        //           style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
        //         ),
        //         SizedBox(height: 16),
        //         GridView.count(
        //           shrinkWrap: true,
        //           scrollDirection: Axis.vertical,
        //           padding: EdgeInsets.all(8),
        //           crossAxisCount: 3,
        //           crossAxisSpacing: 4,
        //           mainAxisSpacing: 4,
        //           children: foodNotifier.currentFood.subIngredients
        //               .map(
        //                 (ingredient) => Card(
        //                   color: Colors.black54,
        //                   child: Center(
        //                     child: Text(
        //                       ingredient,
        //                       style: TextStyle(color: Colors.white, fontSize: 16),
        //                     ),
        //                   ),
        //                 ),
        //               )
        //               .toList(),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return FoodForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            child: Icon(Icons.edit),
            foregroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () => deleteFood(foodNotifier.currentFood, _onFoodDeleted),
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
