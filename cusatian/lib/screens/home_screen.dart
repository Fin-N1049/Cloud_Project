import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUSATIAN', // App name at the top
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFEC7063), // App bar color
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding for the content
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align the children to the left
            children: <Widget>[
              const SizedBox(height: 20), // Spacing below the app bar
              const Center(
                child: Text(
                  'Welcome to CUSATIAN!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20), // Spacing between the welcome text and the university description
              const Center(
                child: Text(
                  'Cochin University of Science and Technology (CUSAT) is a premier institution for higher education in India. '
                  'It is known for its excellence in teaching and research across various fields of science, engineering, and technology.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40), // Spacing between the description and the "Announcements" section

              // Announcements Header Row
              _buildSectionHeader(
                context, 
                title: 'Announcements', 
                onPressed: () {
                  print('See All pressed for Announcements');
                }
              ),

              // Horizontal Scrollable Announcements
              const SizedBox(height: 10), // Spacing before the announcement boxes
              SizedBox(
                height: 150, // Fixed height for the announcement boxes
                child: ListView(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                  children: <Widget>[
                    _customBox("Announcement 1", "Details about announcement 1"),
                    _customBox("Announcement 2", "Details about announcement 2"),
                    _customBox("Announcement 3", "Details about announcement 3"),
                  ],
                ),
              ),

              const SizedBox(height: 40), // Spacing between the "Announcements" and "Events" section

              // Events Header Row
              _buildSectionHeader(
                context, 
                title: 'Events', 
                onPressed: () {
                  print('See All pressed for Events');
                }
              ),

              // Horizontal Scrollable Events
              const SizedBox(height: 10), // Spacing before the event boxes
              SizedBox(
                height: 150, // Fixed height for the event boxes
                child: ListView(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                  children: <Widget>[
                    _customBox("Event 1", "Details about event 1"),
                    _customBox("Event 2", "Details about event 2"),
                    _customBox("Event 3", "Details about event 3"),
                  ],
                ),
              ),

              const SizedBox(height: 40), // Spacing between the "Events" and "Clubs" section

              // Clubs Header Row
              _buildSectionHeader(
                context, 
                title: 'Clubs', 
                onPressed: () {
                  print('See All pressed for Clubs');
                }
              ),

              // Horizontal Scrollable Clubs
              const SizedBox(height: 10), // Spacing before the club boxes
              SizedBox(
                height: 150, // Fixed height for the club boxes
                child: ListView(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                  children: <Widget>[
                    _customBox("Club 1", "Details about club 1"),
                    _customBox("Club 2", "Details about club 2"),
                    _customBox("Club 3", "Details about club 3"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Fixed group of icons at the bottom of the screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the current selected index (0 means Home)
        onTap: (index) {
          // Handle icon tap - you can add navigation logic here
          print("Icon $index tapped");
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home Icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Chat Icon
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile Icon
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFFEC7063), // Color when an icon is selected
        unselectedItemColor: Colors.grey, // Color when an icon is not selected
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }

  // Helper function to create a custom box for announcements, events, and clubs
  Widget _customBox(String title, String description) {
    return Container(
      width: 250, // Fixed width for the box
      margin: const EdgeInsets.only(right: 10), // Margin between boxes
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Box shadow color
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15), // Padding inside the box
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10), // Spacing between title and description
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create section headers with a title and "See All" button
  Widget _buildSectionHeader(BuildContext context, {required String title, required VoidCallback onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns items to opposite ends
      children: [
        Text(
          title, // Section title
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'See All', // Button on the right side
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEC7063), // Button color matching the app bar
            ),
          ),
        ),
      ],
    );
  }
}
