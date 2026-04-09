import 'package:doctordesktop/External/DoctorCalendarView.dart';
import 'package:doctordesktop/reception/CreateAppointment.dart';
import 'package:doctordesktop/reception/Sidebar.dart';
import 'package:flutter/material.dart';

class ReceptionMainScreen extends StatefulWidget {
  const ReceptionMainScreen({super.key});

  @override
  State<ReceptionMainScreen> createState() => _ReceptionMainScreenState();
}

class _ReceptionMainScreenState extends State<ReceptionMainScreen> {
  int _selectedNavIndex = 0;

  // Map of screen widgets indexed by their navigation index
  late final Map<int, Widget> _screens;

  @override
  void initState() {
    super.initState();

    // Initialize all screens
    _screens = {
      0: const AppointmentCreationScreen(),
      1: const DoctorAppointmentsListView(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          ImprovedSidebar(
            selectedIndex: _selectedNavIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedNavIndex = index;
              });
            },
            navigationItems: [
              NavigationItem(
                index: 0,
                icon: Icons.person,
                label: 'Create Appointment',
              ),
              NavigationItem(
                index: 1,
                icon: Icons.calendar_month,
                label: 'Appointments',
              ),
            ],
          ),

          // Content area - shows the selected screen
          Expanded(
            child: _screens[_selectedNavIndex] ??
                const Center(child: Text('Screen not implemented yet')),
          ),
        ],
      ),
    );
  }
}
