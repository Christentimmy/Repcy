

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTabIndex = 0;
  double currentWeight = 140.0;
  double goalWeight = 140.0;
  
  final List<String> tabs = ['Weight', 'Workout', 'Stats', 'PRs', 'Photos'];
  
  // Sample weight data for chart
  final List<WeightEntry> weightData = [
    WeightEntry(date: '31 Dec', weight: 145.0),
    WeightEntry(date: '01 Jan', weight: 143.5),
    WeightEntry(date: '03 Jan', weight: 142.0),
    WeightEntry(date: '04 Jan', weight: 141.0),
    WeightEntry(date: '05 Jan', weight: 140.5),
    WeightEntry(date: '06 Jan', weight: 140.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildPointsBar(),
                    _buildTabs(),
                    _buildWeightStats(),
                    Expanded(child: _buildChart()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Color(0xFF1C1C1E),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'SUBSCRIBER',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Michael Jordan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointsBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            '🏆',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 8),
          const Text(
            '0 point',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Show rank info
              _showRankInfo();
            },
            child: Row(
              children: const [
                Text(
                  'Rank info',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '💡',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedTabIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTabIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : const Color(0xFFE5E5EA),
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected ? const Color(0xFFFFC107) : Colors.black54,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeightStats() {
    final difference = currentWeight - goalWeight;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatColumn('Current', '$currentWeight lb', true),
          _buildStatColumn('Goal', '$goalWeight lb', false),
          _buildStatColumn(
            'Difference',
            difference == 0 ? '--- lb' : '${difference.toStringAsFixed(1)} lb',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, bool isHighlighted) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isHighlighted ? const Color(0xFFFFC107) : Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: WeightChartPainter(weightData: weightData),
            ),
          ),
        ],
      ),
    );
  }

  void _showRankInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rank Information'),
        content: const Text(
          'Earn points by:\n'
          '• Logging workouts\n'
          '• Tracking weight\n'
          '• Completing challenges\n'
          '• Maintaining streaks',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}

class WeightEntry {
  final String date;
  final double weight;

  WeightEntry({required this.date, required this.weight});
}

class WeightChartPainter extends CustomPainter {
  final List<WeightEntry> weightData;

  WeightChartPainter({required this.weightData});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw horizontal lines
    final linePaint = Paint()
      ..color = const Color(0xFFE5E5EA)
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Y-axis labels and lines
    final weights = [180, 160, 140, 120, 100];
    for (int i = 0; i < weights.length; i++) {
      final y = size.height * i / (weights.length - 1);
      
      // Draw line
      canvas.drawLine(
        Offset(40, y),
        Offset(size.width, y),
        linePaint,
      );

      // Draw label
      textPainter.text = TextSpan(
        text: weights[i].toString(),
        style: const TextStyle(
          color: Color(0xFFFFC107),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, y - 8));
    }

    // X-axis labels
    final spacing = (size.width - 40) / (weightData.length - 1);
    for (int i = 0; i < weightData.length; i++) {
      final x = 40 + (spacing * i);
      
      textPainter.text = TextSpan(
        text: weightData[i].date,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height + 5),
      );
    }

    // Draw weight line
    final path = Path();
    final pointPaint = Paint()
      ..color = const Color(0xFFFFC107)
      ..style = PaintingStyle.fill;

    final linePaintChart = Paint()
      ..color = const Color(0xFFFFC107)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < weightData.length; i++) {
      final x = 40 + (spacing * i);
      // Map weight (100-180) to y position
      final normalizedWeight = (180 - weightData[i].weight) / 80;
      final y = size.height * normalizedWeight;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Draw point
      canvas.drawCircle(Offset(x, y), 4, pointPaint);
    }

    canvas.drawPath(path, linePaintChart);
  }

  @override
  bool shouldRepaint(WeightChartPainter oldDelegate) => true;
}