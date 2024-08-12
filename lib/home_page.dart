

import 'package:flutter/material.dart';
import 'notification_page.dart';
import 'profile.dart';
import 'feedback.dart';
import 'food.dart';
import 'acc.dart';
import 'clo.dart';
import 'med.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        '',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        '',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        '',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'PetKart',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'pet foods') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodPage()), // Replace FoodPage() with the correct route/page widget
          );
        }
        else if (label == 'accessories') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccPage()), // Replace FoodPage() with the correct route/page widget
          );
        }
        else if (label == 'clothes') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CloPage()), // Replace FoodPage() with the correct route/page widget
          );
        }
        else if  (label == 'others') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedPage()), // Replace FoodPage() with the correct route/page widget
          );
        }
        // Perform action when the category image is tapped
        print('Category $label tapped!');
        // Navigate or perform any action here
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
  Widget _buildPopularItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Items',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the "See All" action here
                    print('See All tapped');
                    // Navigate to the "See All" page or perform related action
                  },
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // Change the color as needed
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.blue, // Change the color as needed
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _buildPopularItem(
                'assets/images/food.jpg',
                'PEDIGREE',
                'Price: \$20',
                5, // Rating out of 5
              ),
              _buildPopularItem(
                'assets/images/dxb.jpg',
                'DOG TSHIRT',
                'Price: \$50',
                4, // Rating out of 5
              ),
              _buildPopularItem(
                'assets/images/cat2.jpg',
                'CAT HARNESSES',
                'Price: \$18',
                5, // Rating out of 5
              ),
              _buildPopularItem(
                'assets/images/bird1.jpg',
                'BIRD SEED',
                'Price: \$30',
                4, // Rating out of 5
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildPopularItem(String imagePath, String itemName, String price, int rating) {
    return GestureDetector(
      onTap: () {
        // Handle tapping the popular item
        print('Tapped on $itemName');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          height: 500, // Increased height for the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 0), // Adjusted space between image and content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 0), // Adjusted space between item name and price
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 0), // Adjusted space between price and rating
                    Row(
                      children: List.generate(
                        5,
                            (index) => Icon(
                          Icons.star,
                          size: 12,
                          color: index < rating ? Colors.green : Colors.grey,
                        ),
                      ),
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 1000),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFB5EAD7), Color(0xFF8DC377)],
            ),
          ),
          child: Column(
            children: [
              buildAppBar(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for Products',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.mic,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // Perform microphone action
                        },
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.category,
                          size: 24,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryButton('assets/images/food.jpg', 'pet foods'),
                        _buildCategoryButton('assets/images/acc.jpg', 'accessories'),
                        _buildCategoryButton('assets/images/clo.jpg', 'clothes'),
                        _buildCategoryButton('assets/images/med.jpg', 'others'),
                      ],
                    ),
                  ],

                ),
              ),
              _buildPopularItems(),
              Expanded(
                child: Container(
                  // Replace with your content
                  child: Center(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ),
              ),

            ],
          ),
        ),
      )

          : null,
      drawer: _selectedIndex == 0
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF8DC377), Color(0xFFB5EAD7)],
                ),
              ),
              child: Container(
                height: 120, // Set your desired height here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome User!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8), // Add some space between text and icon
                    Icon(
                      Icons.person_pin,
                      size: 60,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),


            ListTile(
              leading: Icon(
                Icons.person,
                size: 25,
              ),
              title: Text(
                'Your Profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfilePage()),
                ); // Navigate to My Profile screen or perform related action
              },
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                size: 25,
              ),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                ); // Navigate to Feedback screen or perform related action
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                size: 25,
              ),
              title: Text(
                'Share',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Perform share action
              },
            ),
            ListTile(
              leading: Icon(
                Icons.library_books,
                size: 25,
              ),
              title: Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigate to Terms and Conditions screen or perform related action
              },
            ),
            ListTile(
              leading: Icon(
                Icons.security,
                size: 25,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigate to Privacy Policy screen or perform related action
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail,
                size: 25,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigate to Contact Us screen or perform related action
              },
            ),
          ],
        ),
      )
          : null,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8DC377), Color(0xFFB5EAD7)],
          ),
        ),
        child: _widgetOptions.elementAt(_selectedIndex),

      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'my account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}



