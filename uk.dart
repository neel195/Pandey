import 'package:flutter/material.dart';
import '../../models/food.dart';

class MealDetail extends StatefulWidget {
  final Food mealfood;
  final String name;
  MealDetail({this.mealfood, this.name});

  @override
  _MealDetailState createState() => _MealDetailState();
}

  handleQuantity(mul) {
    if (mul != null) {
      setState(() {
        value = value * mul;
      });
    } else {
      setState(() {
        value = value;
      });
    }
  }

  buildInfo(nutrient) {
    // value = nutrient.value;
    if (value == null) {
      value = nutrient.value;
    }
    // if (multiplier != null) {
    //   setState(() {
    //     value = value * multiplier;
    //   });
    // } else {
    //   setState(() {
    //     value = nutrient.value;
    //   });
    // }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(nutrient.name),
          SizedBox(
            width: 50,
          ),
          Text('${value.toStringAsFixed(2)} ${nutrient.unit}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /****  PRINT ALL THE NUTRIENT OF FOOD */

    //  widget.mealfood.nutrients.forEach((element) {
    //   print(element.name);
    // });

    print('ran build again');

    final protein = (widget.mealfood.nutrients[8]);
    final fats = (widget.mealfood.nutrients[0]);
    final carbohydrate = (widget.mealfood.nutrients[9]);
    final fiber = (widget.mealfood.nutrients[10]);
    final sugar = (widget.mealfood.nutrients[11]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nutritional Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: Column(
          children: [
            Text('Pick the quantity of Food'),
            buildQuantity(),
            SizedBox(
              height: 20,
            ),
            Text('Nutritional Information'),
            buildInfo(protein),
            buildInfo(fats),
            buildInfo(carbohydrate),
            buildInfo(sugar),
            buildInfo(fiber),
          ],
        ),
      ),
    );
  }
}
