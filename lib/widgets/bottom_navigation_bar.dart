import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  CustomBottomNavigationBarState createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    String routeName;

    switch (index) {
      case 0: // Assuming index 0 is for the Home screen
        routeName = '/home';
        break;
      case 1: // Courses screen
        routeName = '/courses';
        break;
      case 2: // Assuming index 2 is for a Special Features screen
        routeName = '/chat'; // Update this with the actual route name
        break;
      case 3: // Schedule screen
        routeName = '/schedule'; // Update this with the actual route name
        break;
      case 4: // Account screen
        routeName = '/account'; // Update this with the actual route name
        break;
      default:
        routeName = '/home';
    }

    // Check if the current screen is not the selected screen to avoid pushing it again
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.of(context).pushNamed(routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black26,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school), // Changed to 'book' for direct relevance to courses
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.brain, color: Colors.purple, size: 40), // Special feature
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule), // Changed to 'schedule', assuming it covers planning aspects like Portfolio
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.purple,
      onTap: (index) {
        widget.onItemSelected(index); // Call the callback passed from parent widget
        _onItemTapped(index); // Handle navigation
      },
      type: BottomNavigationBarType.fixed,
    );
  }
}
