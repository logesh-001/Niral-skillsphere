import 'package:flutter/material.dart';
import 'package:skillsphere/pages/Login.dart';
import 'package:skillsphere/pages/Signup.dart';
import 'lib/Data/Onboarddata.dart'; // Import the onboard_data.dart file

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      _finishOnboarding();
    }
  }

  void _skip() {
    _finishOnboarding();
  }

  void _finishOnboarding() {
    // Navigate to the main screen or home screen
    print("Onboarding Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: onboardingPages[index]['image']!,
                  title: onboardingPages[index]['title']!,
                  description: onboardingPages[index]['description']!,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingPages.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage != onboardingPages.length - 1
                    ? SizedBox():
                     ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));},
                  child: Text( "Sign Up" ,style: TextStyle(color: Colors.white),),
                  
                  style: ElevatedButton.styleFrom(maximumSize: Size(400, 60),padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all( Radius.circular(10)),

    ),
    
    backgroundColor: Colors.green),
                ),
                ElevatedButton(onPressed: () {
  if (_currentPage == onboardingPages.length - 1) {
    // Navigate to the LoginPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  } else {
    // Go to the next page
    _nextPage;
  }
},
                  child: Text(_currentPage == onboardingPages.length - 1 ? "Login" : "Next"),
                  style: ElevatedButton.styleFrom(maximumSize: Size(400, 60),padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all( Radius.circular(10)), 

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

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300), // Ensure you have the images in assets
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}