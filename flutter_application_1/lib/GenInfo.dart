import 'package:flutter/material.dart';
import 'FindCenter.dart';
import 'FAQs.dart';
import 'main.dart'; // Importing main for the navigation to home
import 'research.dart'; // Importing for potential future use

class GenInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Header with navigation bar copied from HomePage
            Container(
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
            // Banner at the top of the body
            Container(
              width: double.infinity,
              height: 300, // Adjusted height for the banner
              child: Image.asset(
                'assets/images/vacc_banner_2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Main body of the page with larger margins
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 128.0, vertical: 16.0), // Much larger horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 80.0),
                  // Center-align the title "What are Vaccines?"
                  Center(
                    child: Text(
                      'What are Vaccines?',
                      style: TextStyle(
                        fontSize: 30, // Matching font size from HomePage
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], // Matching color from HomePage
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SectionWithImage(
                    title: '',
                    content:
                        'Vaccines are substances that help your immune system recognize and defend against specific diseases. They work by introducing a small, '
                        'harmless part of a virus or bacteria into your body. This triggers your immune system to create antibodies, which are proteins that can '
                        'fight off the actual disease if you’re exposed to it later. By getting vaccinated, you build up immunity without having to go through the '
                        'illness itself, reducing the risk of serious health issues.',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Image next to the "Are Vaccines Safe?" section
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/vacc_3.jpg',
                            fit: BoxFit.contain, // Changed to contain the entire image
                            height: 300, // Adjusted height to ensure the entire image is shown
                          ),
                        ),
                      ),
                      // Column for "Are Vaccines Safe?" and "Why Should I Get Vaccinated?"
                      Expanded(
                        child: Column(
                          children: [
                            // Center-align the title "Are Vaccines Safe?"
                            Center(
                              child: SectionWithoutImage(
                                title: 'Are Vaccines Safe?',
                                content:
                                    'Vaccines undergo extensive testing before they are approved for public use. '
                                    'The safety and effectiveness of vaccines are monitored continually by organizations like the CDC and WHO. '
                                    'Most side effects are mild and temporary, such as a sore arm or a slight fever. Serious side effects are rare.',
                              ),
                            ),
                            SizedBox(height: 20), // Space between the two sections
                            // Center-align the title "Why Should I Get Vaccinated?"
                            Center(
                              child: SectionWithoutImage(
                                title: 'Why Should I Get Vaccinated?',
                                content:
                                    'Vaccination not only protects you but also helps protect those around you, particularly vulnerable populations like infants, '
                                    'the elderly, and those with weakened immune systems. Widespread vaccination can lead to herd immunity, reducing the spread of diseases. '
                                    'History shows that vaccines are the safest, most effective way to protect yourself and your family from many preventable diseases.',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0), // Increased spacing to fully display the image

                  // Title 
                  Center(
                    child: Text(
                      'Getting Vaccinated is Safer than Getting Sick.',
                      style: TextStyle(
                        fontSize: 20, // Matching font size from HomePage
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], // Matching color from HomePage
                      ),
                    ),
                  ),
                  SectionWithoutImage(
                    title: '',
                    content:
                        'Vaccines help the body learn how to defend itself from disease without the dangers of a full-blown infection.' 
                        'The immune response to a vaccine might cause tiredness and discomfort for a day or two, but the resulting protection can last a lifetime.'
                        ''
                        'Infections are unpredictable and can have long-term consequences. Even mild or symptom-less infections can be deadly.',
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      'How the CDC is Supporting the Vaccination Effort',
                      style: TextStyle(
                        fontSize: 20, // Matching font size from HomePage
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], // Matching color from HomePage
                      ),
                    ),
                  ),
                  SectionWithoutImage(
                    title: '',
                    content:
                        'The CDC works to prevent disease through immunization, helps develop vaccination programs, and monitors vaccine safety.',
                  ),
                  SizedBox(height: 20.0),

                  SizedBox(height: 40.0),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Discover more Vaccine, Nutrition, and Health Information!',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 500, // Set height for carousel
                          width: double.infinity, // Allow full width for scrolling
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: 4, // Number of images
                            itemBuilder: (context, index) {
                              List<String> images = [
                                'assets/images/PopeyePowerSmoothi.jpg',
                                'assets/images/Vaccine_FS.jpg',
                                'assets/images/AppleSoda.jpg',
                                'assets/images/YogurtRanch.jpg',
                              ];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  images[index],
                                  height: 400,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    'Contact Us: charribrooks@gmail.com',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Additional Information | Terms of Service | Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display sections with or without images
class SectionWithImage extends StatelessWidget {
  final String title;
  final String content;

  SectionWithImage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title.isNotEmpty
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}

// Widget to display sections without images
class SectionWithoutImage extends StatelessWidget {
  final String title;
  final String content;

  SectionWithoutImage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title.isNotEmpty
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
