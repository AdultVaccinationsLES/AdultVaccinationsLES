import 'package:flutter/material.dart';


Widget imageButton(BuildContext context, String imagePath, Widget page) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.blue.withOpacity(0.3),
      child: Ink(
        height: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    ),
  );
}

Widget textButton(BuildContext context, String label, Widget page) {
  return TextButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Text(label, style: TextStyle(color: Colors.grey[800])),
  );
}

Widget navButton(BuildContext context, IconData icon, String label, Widget page) {
  return TextButton.icon(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    icon: Icon(icon, color: Colors.grey[800]),
    label: Text(label, style: TextStyle(color: Colors.grey[800])),
  );
}

