import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xFF44575B),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'User Profile',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF44575B),
                          ),
                        ),
                        SizedBox(width: 10), // Add some spacing between text and icon
                        Icon(
                          Icons.person_pin,
                          color: Color(0xFF44575B),
                          size: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    // Add spacing between name and phone number container
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Name ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44575B),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFCCD7DA),
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            initialValue: 'Aysha',
                            style: TextStyle(
                              color: Color(0xFF44575B),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none, // Remove the bottom line
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    // Add spacing between name and phone number container
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Email ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44575B),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFCCD7DA),
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            initialValue: 'aysha@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF44575B),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none, // Remove the bottom line
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    // Add spacing between name and phone number container
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Mobile Number ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44575B),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFCCD7DA),
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            initialValue: '123456789',
                            style: TextStyle(
                              color: Color(0xFF44575B),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none, // Remove the bottom line
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),
                    // Add spacing between name and phone number container
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Address ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44575B),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          height: 90,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFCCD7DA),
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            initialValue: 'abcd.......',
                            style: TextStyle(
                              color: Color(0xFF44575B),
                            ),
                            maxLines: null, // Allow multiple lines for address
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: InputBorder.none, // Remove the bottom line
                            ),
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 25),
                    // Add spacing between name and phone number container
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Nearest Landmark ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44575B),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFCCD7DA),
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            initialValue: 'abc',
                            style: TextStyle(
                              color: Color(0xFF44575B),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none, // Remove the bottom line
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    Container(
                      width: 310,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF8DC377), Color(0xFFB5EAD7)], // Pista green gradient colors
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your logic to send feedback here
                          print('Saving...');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.transparent, backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.all(0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 60,
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF6FDFF),
    );
  }
}