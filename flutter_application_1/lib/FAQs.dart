import 'package:flutter/material.dart';
import 'main.dart';
import 'FindCenter.dart';
import 'GenInfo.dart'; // Import GenInfo.dart for the header

class FAQsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header with navigation bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Adjust height as needed
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Logo image
              Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/UMES_LOGO.png',
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(width: 10),
              // Added efnep.jpg image
              Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/efnep.jpg',
                  width: 80,
                  height: 80,
                ),
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
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
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
                      // Handle selection here based on the value
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: 'EXCITE Bridge Access Project',
                          child: Text('EXCITE Bridge Access Project'),
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
                        //Navigator.push(
                        //context,
                        //MaterialPageRoute(builder: (context) => ResearchPage()),
                        //);
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

                  // Find a Vaccination Center Button
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

                  // FAQs Button
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
        ),
      ),
      // End of Header

      // Body with Banner
      body: Column(
        children: [
          // Banner image below the header
          Container(
            width: double.infinity,
            height: 300, // Adjust height as needed
            child: Image.asset(
              'assets/images/vacc_banner_FAQ.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // (Body content remains unchanged)
              ],
            ),
          ),
        ],
      ),
      // End of Body

      // Footer
      bottomNavigationBar: 
      
      Container(
        width: double.infinity,
        color: Colors.blueGrey,
        padding: EdgeInsets.all(16.0),
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
      // End of Footer
    );
  }
}
