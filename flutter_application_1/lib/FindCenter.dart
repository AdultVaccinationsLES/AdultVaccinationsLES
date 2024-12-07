import 'package:flutter/material.dart';
import 'FAQs.dart';
import 'main.dart';
import 'GenInfo.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart'; // Needed for URL launch in attributions.

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
                      SizedBox(width: 20),
                      // About Us dropdown
                      PopupMenuButton<String>(
                        onSelected: (value) {},
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
                      SizedBox(width: 20),
                      // Learn More dropdown
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Learn About Vaccines') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GenInfoPage()),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'Learn About Vaccines',
                              child: Text('Learn About Vaccines'),
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
                      SizedBox(width: 20),
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
                    'Enter your zip code or address to find nearby vaccination centers.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 550,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Enter your zip code or address',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Map with FlutterMap
                  SizedBox(
                    height: 400,








child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Flutter Map widget (Keep this part intact for map)
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: FlutterMap(
                              options: MapOptions(
                        initialCenter: LatLng(51.509364, -0.128928), // Example coordinates
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
                      ],
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
}



