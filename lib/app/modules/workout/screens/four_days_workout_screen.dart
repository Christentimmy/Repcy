import 'package:flutter/material.dart';

class FourDaysWorkoutScreen extends StatefulWidget {
  const FourDaysWorkoutScreen({super.key});

  @override
  State<FourDaysWorkoutScreen> createState() => _FourDaysWorkoutScreenState();
}

class _FourDaysWorkoutScreenState extends State<FourDaysWorkoutScreen> {
  final Map<String, String> schedule = {
    'Monday': 'Full Body',
    'Tuesday': 'Rest',
    'Wednesday': 'Full Body',
    'Thursday': 'Rest',
    'Friday': 'Full Body',
    'Saturday': 'Rest',
    'Sunday': 'Rest',
  };

  final List<String> workoutTypes = [
    'Full Body',
    'Upper Body',
    'Lower Body',
    'Push',
    'Pull',
    'Legs',
    'Cardio',
    'Rest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 20),
                  ...schedule.keys.map((day) => _buildDayCard(day)),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate back
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Back button pressed'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '2 to 3 days workout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildDayCard(String day) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showWorkoutPicker(day),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5EA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              schedule[day]!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _showWorkoutPicker(String day) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C2C2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Select workout for $day',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ...workoutTypes.map(
              (type) => ListTile(
                title: Text(
                  type,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: schedule[day] == type
                    ? const Icon(Icons.check, color: Color(0xFFFFC107))
                    : null,
                onTap: () {
                  setState(() {
                    schedule[day] = type;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: _saveSchedule,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveSchedule() {
    // Calculate workout days
    int workoutDays = schedule.values.where((value) => value != 'Rest').length;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Schedule Saved!',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your workout schedule has been saved.',
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 12),
            Text(
              'Workout days per week: $workoutDays',
              style: const TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ...schedule.entries.map((entry) {
              if (entry.value != 'Rest') {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '${entry.key}: ${entry.value}',
                    style: TextStyle(color: Colors.grey[300], fontSize: 14),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Color(0xFFFFC107),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
