import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Details Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FoodPage(),
    );
  }
}

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ // Lighter shade of green (pista)
                Color(0xFFD0EFA6),
                Color(0xFFB5EAD7),// Darker shade of green (pista)
              ],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB5EAD7), // Lighter shade of green (pista)
              Color(0xFFD0EFA6), // Darker shade of green (pista)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pet Foods',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 10, // Replace this with the actual number of food items
                itemBuilder: (BuildContext context, int index) {
                  return buildProductItem(index, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductItem(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailsPage(index),
            ),
          );
        },
        child: Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/food.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food Name $index',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Price: \$25',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget buildBulletPoint(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.fiber_manual_record,
          size: 10,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

class FoodDetailsPage extends StatefulWidget {
  final int foodIndex; // Index of the selected food

  FoodDetailsPage(this.foodIndex);

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 0;
  double totalPrice = 0.0;
  final double unitPrice = 287.49; // Update with actual unit price

  void incrementQuantity() {
    setState(() {
      quantity++;
      totalPrice = unitPrice * quantity;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
        totalPrice = unitPrice * quantity;
      }
    });
  }

  void addToCart() {
    // Implement logic to add item to cart
    // You can use the 'quantity' and 'widget.foodIndex' to identify the selected item
    // This could involve adding the item to a cart list or performing other actions
    print('Added $quantity item(s) of index ${widget.foodIndex} to cart.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/food.jpg'), // Replace with your food image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Pedigree Puppy Dry Dog Food', // Update with actual food name
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹$unitPrice', // Update with actual price
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Text(
                  '-18%', // Update with actual discount
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(width: 90),
                GestureDetector(
                  onTap: addToCart,
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            // Display star ratings widget (e.g., stars, ratings number)
            // Replace this SizedBox with the ratings widget

            SizedBox(height: 0),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBulletPoint('Complete and balanced dog food for puppy'),
                  buildBulletPoint('Provides strong muscles, bones & teeth and healthy skin & coat'),
                  buildBulletPoint('Ensures optimal digestion of nutrients and supports Natural Defences'),
                  buildBulletPoint('Puppies need 4x Protein, 9.5x Calcium & 53x Iron than human babies'),
                  buildBulletPoint('Developed by experts at the Waltham Centre for Pet Nutrition'),
                ],
              ),
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementQuantity,
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: incrementQuantity,
                ),
              ],
            ),
            SizedBox(height: 0),
            Text(
              'Total Amount: ₹$totalPrice',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0),
            ElevatedButton(
              onPressed: addToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change button color here
              ),
              child: Text(
                'place order',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold,
                  fontSize: 20// Make text bold
                ),
              ),
            ),


            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
