import 'package:flutter/material.dart';


class WorkoutProgramScreen extends StatefulWidget {
  const WorkoutProgramScreen({super.key});

  @override
  State<WorkoutProgramScreen> createState() => _WorkoutProgramScreenState();
}

class _WorkoutProgramScreenState extends State<WorkoutProgramScreen> {
  int currentWeek = 1;
  int completedDays = 0;
  int totalDays = 28;
  
  // Track completion status for each week and day
  Map<int, Set<int>> completedWorkouts = {
    1: {}, // Week 1
    2: {}, // Week 2
    3: {}, // Week 3
    4: {}, // Week 4
  };

  double get progressPercentage => (completedDays / totalDays) * 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 100),
                  children: [
                    _buildMotivationCard(),
                    const SizedBox(height: 20),
                    ...List.generate(4, (index) => _buildWeekSection(index + 1)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildNextButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 360,
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
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Back pressed')),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Body\nWorkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${totalDays - completedDays} Days left',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Stack(
                      children: [
                        Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: progressPercentage / 100,
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC107),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${progressPercentage.toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1605296867424-35fc25c9212a?w=200&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Kick off your full-body fitness journey with energy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekSection(int weekNumber) {
    final isCurrentWeek = weekNumber == currentWeek;
    // final isPastWeek = weekNumber < currentWeek;
    final isFutureWeek = weekNumber > currentWeek;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCurrentWeek
                      ? const Color(0xFFFFC107)
                      : isFutureWeek
                          ? Colors.grey[600]
                          : Colors.grey[400],
                  border: Border.all(
                    color: isCurrentWeek ? const Color(0xFFFFC107) : Colors.grey[600]!,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    weekNumber.toString(),
                    style: TextStyle(
                      color: isCurrentWeek ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              if (weekNumber < 4)
                Container(
                  width: 2,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey[700]!,
                        width: 2,
                        style: isFutureWeek ? BorderStyle.solid : BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Week content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Week $weekNumber',
                      style: TextStyle(
                        color: isCurrentWeek ? const Color(0xFFFFC107) : Colors.grey[400],
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (isCurrentWeek)
                      Text(
                        '${completedWorkouts[weekNumber]?.length ?? 0}/7',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _buildWeekGrid(weekNumber, isCurrentWeek, isFutureWeek),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekGrid(int weekNumber, bool isCurrentWeek, bool isFutureWeek) {
    return Column(
      children: [
        // Days 1-4
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDayCircle(weekNumber, 1, isCurrentWeek, isFutureWeek),
            _buildCheckbox(weekNumber, 1, isCurrentWeek),
            _buildDayCircle(weekNumber, 2, isCurrentWeek, isFutureWeek),
            _buildCheckbox(weekNumber, 2, isCurrentWeek),
            _buildDayCircle(weekNumber, 3, isCurrentWeek, isFutureWeek),
            _buildCheckbox(weekNumber, 3, isCurrentWeek),
            _buildDayCircle(weekNumber, 4, isCurrentWeek, isFutureWeek),
          ],
        ),
        const SizedBox(height: 16),
        // Days 5-7 and trophy
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDayCircle(weekNumber, 5, isCurrentWeek, isFutureWeek),
            _buildCheckbox(weekNumber, 5, isCurrentWeek),
            _buildDayCircle(weekNumber, 6, isCurrentWeek, isFutureWeek),
            _buildCheckbox(weekNumber, 6, isCurrentWeek),
            _buildDayCircle(weekNumber, 7, isCurrentWeek, isFutureWeek),
            const SizedBox(width: 40),
            const Text('🏆', style: TextStyle(fontSize: 32)),
          ],
        ),
      ],
    );
  }

  Widget _buildDayCircle(int week, int day, bool isCurrentWeek, bool isFutureWeek) {
    final isCompleted = completedWorkouts[week]?.contains(day) ?? false;
    final isActive = isCurrentWeek && !isFutureWeek;

    return GestureDetector(
      onTap: isActive
          ? () {
              setState(() {
                if (isCompleted) {
                  completedWorkouts[week]!.remove(day);
                  completedDays--;
                } else {
                  completedWorkouts[week]!.add(day);
                  completedDays++;
                }
              });
            }
          : null,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted
              ? const Color(0xFFFFC107)
              : isFutureWeek
                  ? const Color(0xFFE5E5EA)
                  : Colors.white,
          border: Border.all(
            color: isActive ? const Color(0xFFFFC107) : const Color(0xFFE5E5EA),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: TextStyle(
              color: isCompleted
                  ? Colors.white
                  : isFutureWeek
                      ? Colors.grey[400]
                      : const Color(0xFFFFC107),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(int week, int day, bool isCurrentWeek) {
    final isCompleted = completedWorkouts[week]?.contains(day) ?? false;

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isCompleted ? const Color(0xFFFFC107) : Colors.white,
        border: Border.all(
          color: const Color(0xFFE5E5EA),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isCompleted
          ? const Icon(Icons.check, size: 16, color: Colors.white)
          : null,
    );
  }

  Widget _buildNextButton() {
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
      child: GestureDetector(
        onTap: () {
          if (currentWeek < 4) {
            setState(() {
              currentWeek++;
            });
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Moving to Week $currentWeek'),
              backgroundColor: const Color(0xFFFFC107),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Next',
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
}