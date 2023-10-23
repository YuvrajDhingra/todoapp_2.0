import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_page.dart';
class Feature1 extends StatefulWidget {
  @override
  State<Feature1> createState() => _Feature1State();
}
class _Feature1State extends State<Feature1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  widget1(context),
                  photo(context),
                  widget4(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget widget1(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.055,
      top: MediaQuery.of(context).size.height * 0.11,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            RichText(
                text:TextSpan(
                  children: [
                    TextSpan(
                    text: 'ToDo List',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w800,
                      height: 1.0, // Adjust the line height as needed
                    ),
                  ),
                    TextSpan(
                      text: '  App',
                      style: TextStyle(
                        color: Color(0xFFE5BDF2),
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.w800,
                        height: 1.0, // Adjust the line height as needed
                      ),
                    ),
        ],
                ),
            ),
          ],
        ),
      ),
    );
  }
  Widget widget4(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.10,
      top: MediaQuery.of(context).size.height * 0.52,
      right: MediaQuery.of(context).size.width * 0.10,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        child: Text(
          'ToDo List App is a kind of app that generally used to maintain our day-to-day tasks or list everything that we have to do, with the most important tasks at the top of the list, and the least important tasks at the bottom.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: MediaQuery.of(context).size.width * 0.052,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    );
  }
  Widget photo(BuildContext context){
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.10,
      top: MediaQuery.of(context).size.height * 0.17,
      right: MediaQuery.of(context).size.width * 0.10,
      child: Container(
        width: 500,
        height: 300,
        decoration: ShapeDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("images/work-at-home-concept-illustration-freelance-man-working-on-computer-at-her-house-isolated-on-white-background-online-study-education-vector.jpg"),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class Feature2 extends StatefulWidget {
  @override
  State<Feature2> createState() => _Feature2State();
}
class _Feature2State extends State<Feature2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  widget1(context),
                  photo(context),
                  widget2(context),
                  widget4(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget widget1(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.055,
      top: MediaQuery.of(context).size.height * 0.11,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            RichText(
              text:TextSpan(
                children: [
                  TextSpan(
                    text: 'Priority ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w800,
                      height: 1.0, // Adjust the line height as needed
                    ),
                  ),
                  TextSpan(
                    text: 'Check',
                    style: TextStyle(
                      color: Color(0xFFE5BDF2),
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w800,
                      height: 1.0, // Adjust the line height as needed
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget widget4(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.height * 0.57,
      right: MediaQuery.of(context).size.width * 0.1,
      child: SizedBox(
        child: Text(
          'Use priority levels to make sure the most important things on your list stand out.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: MediaQuery.of(context).size.width * 0.058,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      ),
    );
  }
  Widget widget2(BuildContext context) {
  return Positioned(
    left: MediaQuery.of(context).size.width * 0.1,
    top: MediaQuery.of(context).size.height * 0.7,
    right: MediaQuery.of(context).size.width * 0.1,
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 25,
      child: Text(
        'You can give your tasks one of three priority levels – High being the most important and low being the least.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: MediaQuery.of(context).size.width * 0.040,
          fontFamily: 'Lora',
          fontWeight: FontWeight.w400,
          height: 1.5, // Adjust the line height as needed
        ),
      ),
    ),
  );
}
  Widget photo(BuildContext context){
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.10,
      top: MediaQuery.of(context).size.height * 0.18,
      right: MediaQuery.of(context).size.width * 0.10,
      child: Container(
        width: 500,
        height: 300,
        decoration: ShapeDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("images/priority.jpg"),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class Feature3 extends StatefulWidget {
  @override
  State<Feature3> createState() => _Feature3State();
}
class _Feature3State extends State<Feature3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  widget1(context),
                  widget2(context),
                  photo(context),
                  widget4(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget widget1(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.050,
      top: MediaQuery.of(context).size.height * 0.11,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            RichText(
              text:TextSpan(
                children: [
                  TextSpan(
                    text: 'Due',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w800,
                      height: 1.0, // Adjust the line height as needed
                    ),
                  ),
                  TextSpan(
                    text: ' Date',
                    style: TextStyle(
                      color: Color(0xFFE5BDF2),
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w800,
                      height: 1.0, // Adjust the line height as needed
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget widget4(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.10,
      top: MediaQuery.of(context).size.height * 0.55,
      right: MediaQuery.of(context).size.width * 0.10,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        child: Text(
          'Due dates! So important, yet so easy to forget.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      ),
    );
  }
  Widget widget2(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.height * 0.65,
      right: MediaQuery.of(context).size.width * 0.1,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        child: Text(
          'In Todoist, you can make sure you never miss a thing by adding due dates and/or times to your tasks.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: MediaQuery.of(context).size.width * 0.040,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w400,
            height: 1.5, // Adjust the line height as needed
          ),
        ),
      ),
    );
  }
  Widget photo(BuildContext context){
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.10,
      top: MediaQuery.of(context).size.height * 0.17,
      right: MediaQuery.of(context).size.width * 0.10,
      child: Container(
        width: 500,
        height: 300,
        decoration: ShapeDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("images/duedate.jpg"),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}


class Sliding_pages extends StatelessWidget {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  Feature1(),
                  Feature2(),
                  Feature3(),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.020),
                  ),
                  elevation: 8,
                  backgroundColor: Color(0xFF7851A9),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoList()));
                },
                child: Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: MediaQuery.of(context).size.height * 0.0015,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: JumpingDotEffect(
                activeDotColor: Color(0xFFE5BDF2),
                dotColor: Color(0xFFE5BDF2).withOpacity(0.5),
                dotHeight: 20,
                dotWidth: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}