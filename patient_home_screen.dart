// File: lib/patient_home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'app_colors.dart';
import 'language_provider.dart';
import 'hospital_card.dart';
import 'news_card.dart';
import 'health_category_card.dart';
import 'app_drawer.dart';
import 'chatbot_assistant.dart';
import 'digital_card_dialog.dart';
import 'appointment_booking_sheet.dart';
import 'models.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Hospital> _hospitals = [
    Hospital(id: '1', name: 'Anjam Central Hospital', logoPath: 'assets/hospitals/anjam_central.png'),
    Hospital(id: '2', name: 'Anjam Heart Center', logoPath: 'assets/hospitals/anjam_heart.png'),
    Hospital(id: '3', name: 'Anjam Children Hospital', logoPath: 'assets/hospitals/anjam_children.png'),
    Hospital(id: '4', name: 'Anjam Emergency Center', logoPath: 'assets/hospitals/anjam_emergency.png'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeTab(),
          _buildResultsTab(),
          _buildAppointmentsTab(),
          _buildProfileTab(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButton: _currentIndex == 0 ? _buildChatbotFAB() : null,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryGreen,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.local_hospital, color: AppColors.primaryGreen, size: 20),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'Anjam Hospital',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ],
    );
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHospitalCarousel(),
          _buildNewsSection(),
          _buildHealthCategories(),
          const SizedBox(height: 100), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildHospitalCarousel() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Our Hospitals',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _hospitals.length,
              itemBuilder: (context, index) {
                return HospitalCard(
                  hospital: _hospitals[index],
                  onTap: () => _navigateToHospitalDetails(_hospitals[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hospital News & Updates',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              TextButton(
                onPressed: () {/* Navigate to all news */},
                child: const Text('View All', style: TextStyle(color: AppColors.primaryGreen)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return NewsCard(
                  title: 'Medical News ${index + 1}',
                  description: 'Latest updates from Anjam Hospital about new services and treatments...',
                  imageUrl: 'assets/news/news_${index + 1}.jpg',
                  onTap: () => _navigateToNewsDetails(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthCategories() {
    final categories = [
      {'icon': Icons.favorite, 'title': 'Cardiology', 'color': Colors.red, 'doctors': '12 Doctors'},
      {'icon': Icons.psychology, 'title': 'Neurology', 'color': Colors.purple, 'doctors': '8 Doctors'},
      {'icon': Icons.healing, 'title': 'Orthopedics', 'color': Colors.blue, 'doctors': '15 Doctors'},
      {'icon': Icons.child_care, 'title': 'Pediatrics', 'color': Colors.orange, 'doctors': '10 Doctors'},
      {'icon': Icons.visibility, 'title': 'Ophthalmology', 'color': Colors.green, 'doctors': '6 Doctors'},
      {'icon': Icons.hearing, 'title': 'ENT', 'color': Colors.teal, 'doctors': '7 Doctors'},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Healthcare Specialties',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return HealthCategoryCard(
                icon: categories[index]['icon'] as IconData,
                title: categories[index]['title'] as String,
                doctorCount: categories[index]['doctors'] as String,
                color: categories[index]['color'] as Color,
                onTap: () => _navigateToCategoryDetails(categories[index]['title'] as String),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResultsTab() {
    return Column(
      children: [
        Container(
          color: AppColors.primaryGreen,
          child: TableCalendar<TestResult>(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              decoration: BoxDecoration(color: AppColors.primaryGreen),
              headerPadding: EdgeInsets.symmetric(vertical: 16),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              weekendTextStyle: const TextStyle(color: Colors.white70),
              defaultTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: AppColors.accentGreen,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(color: AppColors.primaryGreen),
              markerDecoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getResultsForDay,
          ),
        ),
        Expanded(
          child: _buildResultsList(),
        ),
      ],
    );
  }

  Widget _buildResultsList() {
    final results = _getResultsForDay(_selectedDay ?? DateTime.now());
    
    if (results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment_outlined, size: 64, color: AppColors.greyColor),
            SizedBox(height: 16),
            Text(
              'No results for this date',
              style: TextStyle(fontSize: 18, color: AppColors.greyColor),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.lightGreen,
              child: Icon(
                _getResultIcon(result.type),
                color: AppColors.primaryGreen,
              ),
            ),
            title: Text(
              result.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '${result.hospitalName} • ${result.doctorName}',
              style: const TextStyle(color: AppColors.secondaryText),
            ),
            trailing: const Icon(Icons.chevron_right, color: AppColors.greyColor),
            onTap: () => _viewResultDetails(result),
          ),
        );
      },
    );
  }

  Widget _buildAppointmentsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppointmentActions(),
          const SizedBox(height: 24),
          _buildUpcomingAppointments(),
          const SizedBox(height: 24),
          _buildPastAppointments(),
        ],
      ),
    );
  }

  Widget _buildAppointmentActions() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _bookNewAppointment,
            icon: const Icon(Icons.add),
            label: const Text('Book Appointment'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _callHospital,
            icon: const Icon(Icons.phone),
            label: const Text('Call Hospital'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryGreen,
              side: const BorderSide(color: AppColors.primaryGreen),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Appointments',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          'Dr. Ahmad Hassan',
          'Cardiology',
          'Tomorrow, 10:00 AM',
          'Anjam Central Hospital',
          true,
        ),
        _buildAppointmentCard(
          'Dr. Sara Mohammed',
          'Dermatology',
          'Dec 15, 2:30 PM',
          'Anjam Specialized Center',
          true,
        ),
      ],
    );
  }

  Widget _buildPastAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Past Appointments',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          'Dr. Omer Ali',
          'General Medicine',
          'Dec 1, 9:00 AM',
          'Anjam Central Hospital',
          false,
        ),
        _buildAppointmentCard(
          'Dr. Layla Ahmed',
          'Ophthalmology',
          'Nov 28, 11:30 AM',
          'Anjam Eye Center',
          false,
        ),
      ],
    );
  }

  Widget _buildAppointmentCard(String doctor, String specialty, String time, String hospital, bool isUpcoming) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        specialty,
                        style: const TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isUpcoming)
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'reschedule', child: Text('Reschedule')),
                      const PopupMenuItem(value: 'cancel', child: Text('Cancel')),
                    ],
                    onSelected: (value) => _handleAppointmentAction(value),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: AppColors.greyColor),
                const SizedBox(width: 4),
                Text(time, style: const TextStyle(color: AppColors.secondaryText)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: AppColors.greyColor),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(hospital, style: const TextStyle(color: AppColors.secondaryText)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 24),
          _buildProfileActions(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.lightGreen,
              child: const Icon(Icons.person, size: 50, color: AppColors.primaryGreen),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Patient ID: AH2024001',
              style: TextStyle(color: AppColors.secondaryText),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProfileStat('Age', '32'),
                _buildProfileStat('Blood Type', 'O+'),
                _buildProfileStat('Visits', '12'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.secondaryText),
        ),
      ],
    );
  }

  Widget _buildProfileActions() {
    final actions = [
      {'icon': Icons.person_outline, 'title': 'Edit Profile', 'action': () {}},
      {'icon': Icons.medical_information, 'title': 'Medical History', 'action': () {}},
      {'icon': Icons.credit_card, 'title': 'Digital Card', 'action': _showDigitalCard},
      {'icon': Icons.settings, 'title': 'Settings', 'action': () {}},
      {'icon': Icons.help_outline, 'title': 'Help & Support', 'action': () {}},
      {'icon': Icons.logout, 'title': 'Logout', 'action': _logout},
    ];

    return Column(
      children: actions.map((action) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(action['icon'] as IconData, color: AppColors.primaryGreen),
            title: Text(action['title'] as String),
            trailing: const Icon(Icons.chevron_right, color: AppColors.greyColor),
            onTap: action['action'] as VoidCallback,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.greyColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildChatbotFAB() {
    return FloatingActionButton(
      onPressed: _openChatbot,
      backgroundColor: AppColors.primaryGreen,
      child: const Icon(Icons.chat, color: Colors.white),
    );
  }

  // Helper methods
  List<TestResult> _getResultsForDay(DateTime day) {
    if (day.day == DateTime.now().day) {
      return [
        TestResult(
          id: '1',
          name: 'Blood Test',
          type: 'Laboratory',
          date: day,
          hospitalName: 'Anjam Central Hospital',
          doctorName: 'Dr. Ahmad Hassan',
          pdfPath: 'assets/results/blood_test_2024.pdf',
        ),
        TestResult(
          id: '2',
          name: 'X-Ray Chest',
          type: 'Radiology',
          date: day,
          hospitalName: 'Anjam Diagnostic Center',
          doctorName: 'Dr. Sara Mohammed',
          pdfPath: 'assets/results/xray_chest_2024.pdf',
        ),
      ];
    }
    return [];
  }

  IconData _getResultIcon(String type) {
    switch (type.toLowerCase()) {
      case 'laboratory':
        return Icons.science;
      case 'radiology':
        return Icons.camera_alt;
      case 'cardiology':
        return Icons.favorite;
      default:
        return Icons.assignment;
    }
  }

  // Navigation and action methods
  void _navigateToHospitalDetails(Hospital hospital) {}
  void _navigateToNewsDetails(int index) {}
  void _navigateToCategoryDetails(String category) {}
  void _viewResultDetails(TestResult result) {}
  void _bookNewAppointment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const AppointmentBookingSheet(),
    );
  }
  void _callHospital() {}
  void _handleAppointmentAction(String action) {}
  void _showDigitalCard() {
    showDialog(
      context: context,
      builder: (context) => const DigitalCardDialog(),
    );
  }
  void _openChatbot() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const ChatbotAssistant(),
    );
  }
  void _logout() {}
}