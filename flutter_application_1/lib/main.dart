import 'package:flutter/material.dart';
import 'GenInfo.dart';
import 'FAQs.dart';
import 'FindCenter.dart';
import 'research.dart'; 

void main() => runApp(VaccineApp());

class VaccineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
// Header with navigation bar
            Flexible(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Matches the body color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header content
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      SizedBox(width: 10),
                      Spacer(), // Pushes navigation bar to the end



// Navigation bar aligned to the right
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
// Home Button 
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            },
                            icon: Icon(Icons.home, color: Colors.grey[800]),
                            label: Text(
                              'Home',
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),

                          SizedBox(width: 20), // Space

// About Vaccinations

                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GenInfoPage()),
                              );
                            },
                            label: Text(
                              'About Vaccinations',
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),

                          SizedBox(width: 20), // Space
// Find A Center 
                          
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FindCenterPage()),
                              );
                            },
                            child: Text('Find a Vaccination Center', style: TextStyle(color: Colors.grey[800])),
                          ),
                          SizedBox(width: 20), // Space
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Navigation bar adjusted to the bottom
                ],
              ),
            ),
          ),

            Container(
              width: double.infinity,
              height: 300, // Adjusted height for the banner
              child: Image.asset(
                'assets/images/MainBanner.jpg',
                fit: BoxFit.cover,
              ),
            ),
// Main content
            Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adjusted padding for better responsiveness
              child: Column(
                children: <Widget>[


                  SizedBox(height: 80.0),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Flexible(
                      child:SizedBox(width: 200.0),
                      ),
                      
                      // Learn About Vaccinations //
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GenInfoPage()),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          splashColor: Colors.blue.withOpacity(0.3),
                          child: Ink(
                            height: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/button_1.jpeg',
                                fit: BoxFit.cover, // Ensure the image covers its area
                                height: 300, // Set the height as per original button height
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40), // Space between button and text

                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              'Why Should I Get Vaccinated?',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Discover vital information about vaccines and COVID-19. Learn how getting vaccinated can protect you and your loved ones, and find out why it’s crucial for our community’s health.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 200.0),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 200.0),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Find Covid-19 and Adult Vaccinations',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'If you are without health insurance or your insurance does not fully cover a vaccine, find the nearest participating vaccination center easily with our intuitive search tool. Enter your zip code to quickly locate a site where you can get vaccinated and take a step towards better health.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40), // Space between button and text
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        width: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FindCenterPage()),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          splashColor: Colors.blue.withOpacity(0.3),
                          child: Ink(
                            height: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/button_2.jpeg',
                                fit: BoxFit.cover,
                                height: 300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 200.0),
                    ],
                  ),







                  SizedBox(height: 80), // Space above the footer
                ],
              ),
            ),
            ),
            Container(
              color: Color.fromARGB(255, 157, 182, 196),
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/EXCITE_logo.png',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EXCITE Bridge Access Adult Vaccination Program',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'The EXCITE Bridge Access program is part of a CDC initiative to provide more accessible vaccinations at various pharmacies and health clinics across the USA. '
                              'The program aims to make vaccines accessible to everyone, regardless of their financial situation. By participating in these programs, we can help you understand and receive adult vaccinations for a healthier community. '
                              'The EXCITE Bridge Access program is dedicated to ensuring that vaccines are within reach for all, helping to protect individuals and families from preventable diseases.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              width: double.infinity,
              color: Colors.blueGrey,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '© 2024 AdultVaccinationLES',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Contact Us: AdultVaccinationLES@gmail.com',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center, 
                  
                  ),
                  SizedBox(height: 10),

                ],
              ),
            ),
            // End of Footer
          ],
        ),
      ),
    );
  }
}
