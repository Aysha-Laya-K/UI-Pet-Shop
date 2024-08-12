import 'package:flutter/material.dart';
import 'changepassword_page.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());

  void _navigateToChangePasswordPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangePasswordPage(),
      ),
    );
  }
  Widget _buildCircularImage() {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFD0EFA6), Color(0xFFB5EAD7)],
        ),
        border: Border.all(
          width: 2.0,
          color: Color(0xFFF6FDFF),
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/lock1.png',
          width: 150.0, // Adjust the image size as needed
          height: 150.0,
        ),
      ),
    );
  }


  Widget _buildOTPBox(int position) {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFD0EFA6), Color(0xFFB5EAD7)],
        ),

        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 2.0,
          color: Color(0xFFF6FDFF),
        ),
      ),
      child: Center(
        child: TextField(
          controller: otpControllers[position],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: Color(0xFFF6FDFF)),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD0EFA6), Color(0xFFB5EAD7)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCircularImage(),
              SizedBox(height: 10.0),
              Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF44575B),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  Text(
                    'Please enter 4 digit code sent to',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF44575B),),
                  ),
                  Text(
                    'your Email',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF44575B),),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 11.0, left: 7),
                      child: _buildOTPBox(i),
                    ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "If you don't receive the code? ",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color:  Color(0xFF44575B),),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Resend OTP');
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF44575B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    String enteredOTP = '';
                    for (int i = 0; i < 4; i++) {
                      enteredOTP += otpControllers[i].text;
                    }
                    print('Entered OTP Code: $enteredOTP');
                    _navigateToChangePasswordPage(context); // Navigate to ChangePasswordPage
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(
                      color: Color(0xFFF6FDFF),
                      width: 3.0,
                    ),
                  ),
                  child: Text(
                    'submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
