import 'package:flutter/material.dart';
import 'FindCenter.dart';
import 'FAQs.dart';
import 'GenInfo.dart';
import 'main.dart';

class ResearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Header with navigation bar copied from GenInfoPage
          Container(
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
                    // Logo image
                    Container(
                      alignment: Alignment.bottomLeft,
                      /*child: Image.asset(
                        'assets/images/UMES_LOGO.png',
                        width: 80,
                        height: 80,
                      ), */
                    ),
                    SizedBox(width: 10),
                    // New EFNEP image
                    Container(
                      alignment: Alignment.bottomLeft,
                      /*child: Image.asset(
                        'assets/images/efnep.jpg',
                        width: 80,
                        height: 80,
                      ), */
                    ),
                    SizedBox(width: 10),
                    Spacer(), // Pushes navigation bar to the end

                    // Navigation bar aligned to the right
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Home Button with Home Icon and "Home" Text
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
                        SizedBox(width: 20),

                        // About Us dropdown
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            // Handle selection
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'EXCITE Bridge Access Project',
                                child: Text('EXCITE Bridge Access Project'),
                              ),
                              PopupMenuItem<String>(
                                value: 'Extension Foundation',
                                child: Text('UMES Extension'),
                              ),
                              PopupMenuItem<String>(
                                value: 'CDC',
                                child: Text('CDC'),
                              ),
                              PopupMenuItem<String>(
                                value: 'EFNEP',
                                child: Text('EFNEP'),
                              ),
                            ];
                          },
                          child: Row(
                            children: [
                              Text('About Us', style: TextStyle(color: Colors.grey[800])),
                              Icon(Icons.arrow_drop_down, color: Colors.grey[800]),
                            ],
                          ),
                        ),
                        SizedBox(width: 20), // Space between buttons

                        // Learn More dropdown
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'Learn About Vaccines') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GenInfoPage()),
                              );
                            } else if (value == 'Read Our Research') {
                              // Already on the Research page
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'Learn About Vaccines',
                                child: Text('Learn About Vaccines'),
                              ),
                              PopupMenuItem<String>(
                                value: 'Read Our Research',
                                child: Text('Read Our Research'),
                              ),
                            ];
                          },
                          child: Row(
                            children: [
                              Text('Learn More', style: TextStyle(color: Colors.grey[800])),
                              Icon(Icons.arrow_drop_down, color: Colors.grey[800]),
                            ],
                          ),
                        ),

                        SizedBox(width: 20), // Space between buttons
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FindCenterPage()),
                            );
                          },
                          child: Text('Find a Vaccination Center', style: TextStyle(color: Colors.grey[800])),
                        ),
                        SizedBox(width: 20), // Space between buttons
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FAQsPage()),
                            );
                          },
                          child: Text('FAQs', style: TextStyle(color: Colors.grey[800])),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          // Main body of the page with larger margins
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 128.0, vertical: 16.0), // Same padding as GenInfoPage
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Content of the Research page goes here
                  Center(
                    child: Text(
                      'Research Information',
                      style: TextStyle(
                        fontSize: 30, // Example font size
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], // Example color
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Add additional content as needed
                ],
              ),
            ),
          ),
          // Footer (same as GenInfoPage) and fixed at the bottom
          Container(
            width: double.infinity,
            color: Colors.blueGrey,
            padding: EdgeInsets.all(16.0), // Adjusted padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '© 2024 Vaccine Info App',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Contact Us: info@vaccineapp.com | 123-456-7890',
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
    );
  }
}
