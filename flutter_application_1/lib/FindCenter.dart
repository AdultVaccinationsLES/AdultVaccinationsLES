import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'FindCenter.dart';
import 'FAQs.dart';
import 'GenInfo.dart';
import 'main.dart';
import 'research.dart';
import 'package:url_launcher/url_launcher.dart'; // Needed for URL launch in attributions.

class FindCenterPage extends StatefulWidget {
  @override
  _FindCenterPageState createState() => _FindCenterPageState();
}

class _FindCenterPageState extends State<FindCenterPage> {
  TextEditingController _zipController = TextEditingController();

  final List<Map<String, String>> centers = [


// Wicomico  

{'name': 'CVS Pharmacy', 'address': '125 East North Pointe Drive, 21801', 'zip': '21801'},
{'name': 'Omnicare Pharmacy', 'address': '119 W Naylor Mill, 21801', 'zip': '21801'},
{'name': 'Rite Aid Pharmacy', 'address': '1316 Mt Hermon Road, 21804', 'zip': '21804'},
{'name': 'Walgreens Pharmacy', 'address': '909 Mt Hermon Rd, 21804', 'zip': '21804'},
{'name': 'Rite Aid Pharmacy', 'address': '1208 Parsons Rd, 21801', 'zip': '21801'},
{'name': 'TidalHealth Peninsula Regional', 'address': '100 East Carroll St, 21801', 'zip': '21801'},
{'name': 'Wicomico County Health Department', 'address': '300 W Carroll St, 21801', 'zip': '21801'},
{'name': 'Your Docs In', 'address': '1135 S Salisbury Blvd, 21801', 'zip': '21801'},
{'name': 'CVS Pharmacy', 'address': '1016 S Salisbury Blvd, 21801', 'zip': '21801'},
{'name': 'Walgreens Pharmacy', 'address': '735 S Salisbury Blvd, 21801', 'zip': '21801'},
{'name': 'CVS Pharmacy', 'address': '125 E N Pointe Drive, 21804', 'zip': '21804'},
{'name': 'Mt Hermon Discount Pharmacy', 'address': '1207 Mt Hermon Rd, 21804', 'zip': '21804'},
{'name': 'Acme Markets Pharmacy', 'address': '751 S Salisbury Blvd, 21801', 'zip': '21801'},
{'name': 'Delmarva Pharmacy', 'address': '1615 Tree Sap Ct, 21804', 'zip': '21804'},
{'name': 'Apple Discount Drugs', 'address': '404A N Fruitland Blvd, 21801', 'zip': '21801'},	
{'name': 'Apple Discount Drugs', 'address': '1210 Nanticoke Rd, 21801', 'zip': '21801'},	
{'name': 'Riverside Pharmacy', 'address': '540 Riverside Dr, 21801', 'zip': '21801'},
{'name': 'Karemore Pharmacy', 'address': '817 Snow Hill Rd Unit 2, 21804', 'zip': '21804'},
{'name': 'TidalHealth Peninsula Regional', 'address': '100 E Carroll St, 21801', 'zip': '21801'},
{'name': 'Hebron Pharmacy', 'address': '100 S Main St, 21830', 'zip': '21830'},
{'name': 'Milford Street Pharmacy', 'address': '106 Milford Street STE 401, 21804', 'zip': '21804'},
{'name': 'Walmart Pharmacy', 'address': '409 N Fruitland Blvd, 21801', 'zip': '21801'},
{'name': 'Pittsville Pharmacy', 'address': '34205 Old Ocean City Rd, 21850', 'zip': '21850'},
{'name': 'Delmarva Pharmacy', 'address': '1615 Tree Sap Ct, 21804', 'zip': '21804'},
	
// Somerset

{'name': 'Rite Aid Pharmacy', 'address': '12154 Brittingham Ln, 21853', 'zip': '21853'},
{'name': 'Karemore Pharmacy', 'address': '12085 Somerset Ave, 21853', 'zip': '21853'},
{'name': 'TLC Pharmacy', 'address': '12145 Elm St, 21853', 'zip': '21853'},
{'name': 'Rite Aid Pharmacy', 'address': '505 Linden Avenue, 21851', 'zip': '21851'},
{'name': 'Delmarva Pharmacy', 'address': '12137 Elm St, 21853', 'zip': '21853'},
{'name': 'Rite Aid Pharmacy', 'address': '12154 Brittingham Ln, 21853', 'zip': '21853'},
{'name': 'Crisfield Discount Pharmacy', 'address': '390 W Main Street Unit A, 21817', 'zip': '21817'},
{'name': 'Marion Pharmacy', 'address': '26427 Burton Ave, 21817', 'zip': '21817'},
{'name': 'Apple Discount Drugs', 'address': '404A N Fruitland Blvd, 21801', 'zip': '21801'},	


// Worcester

    {'name': 'Apple Discount Drugs - Berlin', 'address': '314 Franklin Ave, Berlin, MD', 'zip': '21811'},
    {'name': 'Coastal Drug Pharmacy', 'address': '11005 Manklin Creek Rd Unit 1, Ocean Pines, MD', 'zip': '21811'},
    {'name': 'Rite Aid Pharmacy', 'address': '10135 Old Ocean City Blvd, Berlin, MD', 'zip': '21811'},
    {'name': 'Walgreens Pharmacy', 'address': '11310 Manklin Creek Rd, Berlin, MD', 'zip': '21811'},
    {'name': 'Walmart Pharmacy', 'address': '11416 Ocean Gateway, Berlin, MD', 'zip': '21811'},
    {'name': 'CVS Pharmacy', 'address': '12849 Ocean Gateway, Ocean City, MD', 'zip': '21842'},
    {'name': 'CVS Pharmacy', 'address': '6400 Coastal Hwy, Ocean City, MD', 'zip': '21842'},
    {'name': 'CVS Pharmacy', 'address': '209 N Philadelphia Ave, Ocean City, MD', 'zip': '21842'},
    {'name': 'Snow Hill Pharmacy', 'address': '536 Worcester Hwy, Snow Hill, MD', 'zip': '21863'},
    {'name': 'Pocomoke Pharmacy', 'address': '2 Bel Air St, Pocomoke City, MD', 'zip': '21851'},

  ];

  List<Map<String, String>> filteredCenters = [];

  @override
  void initState() {
    super.initState();
    filteredCenters = centers;
  }

  void _searchCenters() {
    String zipCode = _zipController.text;
    setState(() {
      filteredCenters = centers.where((center) => center['zip'] == zipCode).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Updated Navigation Menu
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
            // Banner image below the header
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                'assets/images/vacc_banner_3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Text(
                    'Find a Vaccination Center in Your Area.',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your zip code to find nearby vaccination centers. New locations will be updated regularly.',
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
                  ElevatedButton(
                    onPressed: _searchCenters,
                    child: Text('Search'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 400,
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(38.2297, -75.8547),
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
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
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
            SizedBox(height: 80),
            Container(
              color: Color.fromARGB(255, 157, 182, 196),
              padding: const EdgeInsets.all(16.0),
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
                              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
