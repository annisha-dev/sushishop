import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/themes/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // Quantity
  int quantityCount = 0;

  // Decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // Increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // Add to cart
  void addToCart() {
    //only add if there's something in the cart
    if (quantityCount > 0){
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      // let user know it was succesful 
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Ho gaya add cart mei",
            style: TextStyle(color: Colors.limeAccent),
            textAlign: TextAlign.center,
            ),
          actions: [
            //okay button
            IconButton(onPressed: (){
              //pop once to remove dialogue box 
              Navigator.pop(context);
              //  //pop once to remove dialogue box 
              Navigator.pop(context);

            }, 
            icon: const Icon(
              Icons.done,
              color:Colors.black ,
              ),
          )

            
          ],
        ),
        );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // ListView of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // Image
                  Image.asset(
                    widget.food.imagepath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),

                  // Rating
                  Row(
                    children: [
                      // Star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),

                      // Rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),

                  // Description title
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Food description
                  Text(
                    "Delicate sliced, fresh salmon drapes elegantly. Indulge in a delicate fusion of flavors with our signature sushi. Fresh, tender fish is expertly rolled with perfectly seasoned rice, creating a harmonious bite that's both light and satisfying.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Price + Quantity + Add to Cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // Quantity selector
                    Row(
                      children: [
                        // Minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Quantity count
                        Text(
                          quantityCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Plus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Add to cart button
                MyButton(text: "Add to cart", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
