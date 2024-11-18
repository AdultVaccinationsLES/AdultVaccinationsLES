import 'package:flutter/material.dart';
import 'FAQs.dart';
import 'main.dart'; // Importing main for the navigation to home
import 'FindCenter.dart'; // Importing FindCenter for potential future use
import 'GenInfo.dart';

class FindCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Custom header
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
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
                  // New EFNEP image
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
            ),
            // Banner image below the header
            Container(
              width: double.infinity,
              height: 300, // Adjust height as needed
              child: Image.asset(
                'assets/images/vacc_banner_3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Main content of the page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0), // Wider margins
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Centered "About" section
                  SizedBox(height: 80.0),
                  Text(
                    'About Finding a Vaccination Center',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  // Text explaining how to find a vaccination center
                  Text(
                    'Here you can find vaccination centers near you by entering your zip code or address.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  // Container to match width of the image
                  Container(
                    width: 550, // Adjust this width to fit your content
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0), // Rounded edges
                        ),
                        labelText: 'Enter your zip code or address',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(height: 30), 

                  // Map Sample Image and Scrollable Query Results space
                  SizedBox(
                    height: 350, // Increased the height of the map box
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Map Sample Image
                        SizedBox(),
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: AspectRatio(
                              aspectRatio: 1.0, // Make it a square
                              child: Image.asset(
                                'assets/images/map_sample.png', // Path to your sample map image
                                fit: BoxFit.contain, // Ensure the whole image is visible
                              ),
                            ),
                          ),
                        ),


                        // Scrollable Query Results space
                        Expanded(
                          flex: 3, // Adjusted to match the size of the map
                          child: Container(
                            color: Colors.grey[200], // Placeholder color
                            child: ListView(
                              padding: EdgeInsets.all(8.0),
                              children: [
                                ListTile(
                                  leading: Icon(Icons.local_hospital),
                                  title: Text('Vaccination Center 1'),
                                  subtitle: Text('123 Main St, Your City, ST 12345'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.local_hospital),
                                  title: Text('Vaccination Center 2'),
                                  subtitle: Text('456 Elm St, Your City, ST 12345'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.local_hospital),
                                  title: Text('Vaccination Center 3'),
                                  subtitle: Text('789 Oak St, Your City, ST 12345'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.local_hospital),
                                  title: Text('Vaccination Center 4'),
                                  subtitle: Text('101 Maple St, Your City, ST 12345'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.local_hospital),
                                  title: Text('Vaccination Center 5'),
                                  subtitle: Text('202 Pine St, Your City, ST 12345'),
                                ),
                              ],
                            ),
                          ),
                          
                        ),
                        SizedBox(width:115),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

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
      ),
    );
  }
}
