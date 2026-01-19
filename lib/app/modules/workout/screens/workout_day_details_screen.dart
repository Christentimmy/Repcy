import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repcy/app/routes/app_routes.dart';

class Exercise {
  final String name;
  final String duration;
  final String imageUrl;

  Exercise({
    required this.name,
    required this.duration,
    required this.imageUrl,
  });
}

class WorkoutDayDetailScreen extends StatefulWidget {
  const WorkoutDayDetailScreen({super.key});

  @override
  State<WorkoutDayDetailScreen> createState() => _WorkoutDayDetailScreenState();
}

class _WorkoutDayDetailScreenState extends State<WorkoutDayDetailScreen> {
  final List<Exercise> exercises = [
    Exercise(
      name: 'Jumping Jacks',
      duration: '0:30',
      imageUrl:
          'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=400&q=80',
    ),
    Exercise(
      name: 'Incline Push-Ups',
      duration: '0:30',
      imageUrl:
          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&q=80',
    ),
    Exercise(
      name: 'Knee Push-Ups',
      duration: '0:30',
      imageUrl:
          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&q=80',
    ),
    Exercise(
      name: 'Front and Back Lunge',
      duration: '0:30',
      imageUrl:
          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&q=80',
    ),
    Exercise(
      name: 'Front and Back Lunge',
      duration: '0:30',
      imageUrl:
          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&q=80',
    ),
  ];

  int get totalDuration {
    return exercises.length * 30; // Each exercise is 30 seconds
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                _buildDayTitle(),
                _buildStatsCards(),
                _buildEditButton(),
                const SizedBox(height: 20),
                ..._buildExerciseList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          _buildStartButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=800&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Back pressed')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 24,
                left: 24,
                child: Text(
                  'Full Body\nWorkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayTitle() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        'DAY 1',
        style: TextStyle(
          color: const Color(0xFFFFC107),
          fontSize: 32,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildStatsCards() {
    final minutes = (totalDuration / 60).floor();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5EA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    '$minutes mins',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Duration',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5EA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    '${exercises.length}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Exercise',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GestureDetector(
        onTap: () {
          _showEditDialog();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'Edit',
              style: TextStyle(
                color: Color(0xFFFFC107),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, color: Color(0xFFFFC107), size: 16),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildExerciseList() {
    return exercises.asMap().entries.map((entry) {
      // final index = entry.key;
      final exercise = entry.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: GestureDetector(
          // onTap: () => _showExerciseInfo(exercise),
          onTap: () {
            Get.toNamed(AppRoutes.workoutPlayerScreen);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF3A3A3C),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(exercise.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exercise.duration,
                        style: TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[600]!, width: 2),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildStartButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1C1C1E).withOpacity(0),
            const Color(0xFF1C1C1E),
          ],
        ),
      ),
      child: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: _startWorkout,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text(
                'Start',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showExerciseInfo(Exercise exercise) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C2C2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              exercise.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Duration: ${exercise.duration}',
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'This exercise targets multiple muscle groups and helps build strength and endurance. Make sure to maintain proper form throughout the movement.',
              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Got it',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Edit Workout',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'You can customize this workout by adding or removing exercises, adjusting durations, or changing the order.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Edit mode activated'),
                  backgroundColor: Color(0xFFFFC107),
                ),
              );
            },
            child: const Text(
              'Edit',
              style: TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Start Workout',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ready to begin your workout?',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            Text(
              '${exercises.length} exercises',
              style: const TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${(totalDuration / 60).floor()} minutes total',
              style: const TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Workout started! 💪'),
                  backgroundColor: Color(0xFFFFC107),
                ),
              );
            },
            child: const Text(
              'Start',
              style: TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
