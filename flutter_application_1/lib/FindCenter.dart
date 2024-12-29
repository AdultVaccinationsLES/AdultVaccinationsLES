import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'FindCenter.dart';
import 'FAQs.dart';
import 'main.dart';
import 'research.dart';
import 'package:url_launcher/url_launcher.dart'; // Needed for URL launch in attributions.

class FindCenterPage extends StatefulWidget {
  @override
  _FindCenterPageState createState() => _FindCenterPageState();
}

class _FindCenterPageState extends State<FindCenterPage> {
  // Controller for the text field input (zip code)
  TextEditingController _zipController = TextEditingController();

  // List of sample vaccination centers
  final List<Map<String, String>> centers = [
    {'name': 'Sample Vaccination Center', 'address': '123 Main St, 11111', 'zip': '11111'},
    {'name': 'Sample Pharmacy', 'address': '456 Elm St, 22222', 'zip': '22222'},
    {'name': 'Sample Vaccination Center', 'address': '789 Oak St, 22222', 'zip': '22222'},
    {'name': 'Sample Pharmacy', 'address': '101 Maple St, 22222', 'zip': '22222'},
    {'name': 'Sample Vaccination Center', 'address': '202 Pine St, 11111', 'zip': '11111'},
    {'name': 'Rite Aid Pharmacy', 'address': '1316 Mt. Hermon Rd, 21801', 'zip': '11111'},
    {'name': 'Walgreens Pharmacy', 'address': '909 Mt Hermon Rd, 21801', 'zip': '11111'},
    {'name': 'TidalHealth Peninsula Regional', 'address': '100 East Carroll St, 21801', 'zip': '11111'},
    {'name': 'Wicomico County Health Department', 'address': '300 W Carroll St, 21801', 'zip': '22222'},
    {'name': 'Your Docs In', 'address': '1135 S Salisbury Blvd, 21801', 'zip': '22222'},
  ];

  // This will hold the filtered list of centers based on the zip code
  List<Map<String, String>> filteredCenters = [];

  @override
  void initState() {
    super.initState();
    // Initially, display all centers
    filteredCenters = centers;
  }

  // Function to search vaccination centers based on zip code
  void _searchCenters() {
    String zipCode = _zipController.text;
    setState(() {
      // Filter centers based on the entered zip code
      filteredCenters = centers
          .where((center) => center['zip'] == zipCode)
          .toList();
    });
  }

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
                      // Home Button
                      TextButton.icon(
                        onPressed: () {
                          // Replace HomePage() with an actual widget or route if needed.
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FindCenterPage()),
                          );
                        },
                        icon: Icon(Icons.home, color: Colors.grey[800]),
                        label: Text(
                          'Home',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Banner image below the header
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                'assets/images/vacc_banner_3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Main content of the page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Text(
                    'Find a Vaccination Center',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your zip code to find nearby vaccination centers.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 550,
                    child: TextField(
                      controller: _zipController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Enter your zip code',
                        prefixIcon: Icon(Icons.search),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Search button
                  ElevatedButton(
                    onPressed: _searchCenters,
                    child: Text('Search'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Replaced primary with backgroundColor
                    ),
                  ),
                  SizedBox(height: 30),
                  // Row to display map and search results side by side
                  Row(
                    children: [
                      // Map widget (left side)
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 400, // Same height for both map and results
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(38.2297, -75.8547), // Somerset County, Maryland
                              initialZoom: 9.2,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              RichAttributionWidget(
                                attributions: [
                                  TextSourceAttribution(
                                    'OpenStreetMap contributors',
                                    onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox for some space between map and results
                      SizedBox(width: 20),
                      // Search results widget (right side)
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 400, // Same height for both map and results
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Display search results
                                if (filteredCenters.isNotEmpty)
                                  Column(
                                    children: filteredCenters.map((center) {
                                      return ListTile(
                                        leading: Icon(Icons.local_hospital),
                                        title: Text(center['name']!),
                                        subtitle: Text(center['address']!),
                                      );
                                    }).toList(),
                                  )
                                else
                                  Text(
                                    'No centers found for this zip code.',
                                    style: TextStyle(fontSize: 16, color: Colors.red),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Footer with EXCITE information
            SizedBox(height: 80), // Space above the footer
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
                                color: Colors.white,
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
            // Footer Section for Contact and Legal Info
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
