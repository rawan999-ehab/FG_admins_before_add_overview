import 'package:flutter/material.dart';
import '../details/internship_details_screen.dart';
import '../Add_screens/Add_Internship.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> jobList = [
    {
      "company": "JUMIA",
      "title": "Java Developer (Full Time)",
      "location": "Cairo, Egypt - 1 month ago • Over 100 people clicked apply",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Google",
      "title": "Software Engineer Intern (Remote)",
      "location": "San Francisco, USA - 2 weeks ago • 200+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
    {
      "company": "JUMIA",
      "title": "Java Developer (Full Time)",
      "location": "Cairo, Egypt - 1 month ago • Over 100 people clicked apply",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Google",
      "title": "Software Engineer Intern (Remote)",
      "location": "San Francisco, USA - 2 weeks ago • 200+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
    {
      "company": "JUMIA",
      "title": "Java Developer (Full Time)",
      "location": "Cairo, Egypt - 1 month ago • Over 100 people clicked apply",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Google",
      "title": "Software Engineer Intern (Remote)",
      "location": "San Francisco, USA - 2 weeks ago • 200+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
    {
      "company": "JUMIA",
      "title": "Java Developer (Full Time)",
      "location": "Cairo, Egypt - 1 month ago • Over 100 people clicked apply",
      "type1": "On-site",
      "type2": "Internship",
    },
    {
      "company": "Google",
      "title": "Software Engineer Intern (Remote)",
      "location": "San Francisco, USA - 2 weeks ago • 200+ applicants",
      "type1": "Remote",
      "type2": "Internship",
    },
  ];

  void _deleteCompany(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this company?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                jobList.removeAt(index);
              });
              Navigator.pop(context);
              _showMessage();
            },
            child: Text("Confirm", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Internship deleted successfully"),
        backgroundColor: Color(0xFF196AB3),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06),
            Text(
              "Welcome Admins!",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Color(0xFF196AB3),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.06,
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                  prefixIcon: Icon(Icons.search, color: Colors.white, size: screenWidth * 0.06),
                  filled: true,
                  fillColor: Color(0xFF2252A1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  var job = jobList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: _buildJobCard(job, index, screenWidth, screenHeight),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddInternship()));
        },
        backgroundColor: Color(0xFF196AB3),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildJobCard(Map<String, String> job, int index, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 1.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.049),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  job["company"]!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Text(
                  job["title"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.green),
                onPressed: () {
                  print("Edit ${job["title"]}");
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteCompany(index),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            job["location"]!,
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.033),
          ),
          SizedBox(height: screenHeight * 0.015),
          Row(
            children: [
              _buildTag(job["type1"]!, Icons.check),
              SizedBox(width: screenWidth * 0.02),
              _buildTag(job["type2"]!, Icons.check),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InternshipDetailsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF196AB3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              icon: Icon(Icons.trending_up, color: Colors.white, size: screenWidth * 0.09),
              label: Text("See More", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue, size: 16),
          SizedBox(width: 4),
          Text(text, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
