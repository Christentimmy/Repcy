import 'package:flutter/material.dart';
import 'dart:async';


class WorkoutExercise {
  final String name;
  final int reps;
  final int duration; // in seconds
  final String imageUrl;

  WorkoutExercise({
    required this.name,
    required this.reps,
    required this.duration,
    required this.imageUrl,
  });
}

class WorkoutPlayerScreen extends StatefulWidget {
  const WorkoutPlayerScreen({super.key});

  @override
  State<WorkoutPlayerScreen> createState() => _WorkoutPlayerScreenState();
}

class _WorkoutPlayerScreenState extends State<WorkoutPlayerScreen> {
  Timer? _timer;
  bool _isPlaying = false;
  int _currentExerciseIndex = 0;
  int _remainingSeconds = 85; // 01:25
  
  final List<WorkoutExercise> _exercises = [
    WorkoutExercise(
      name: 'Jump rope',
      reps: 20,
      duration: 120,
      imageUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800&q=80',
    ),
    WorkoutExercise(
      name: 'Jumping Jack',
      reps: 20,
      duration: 120,
      imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&q=80',
    ),
    WorkoutExercise(
      name: 'Push-ups',
      reps: 15,
      duration: 90,
      imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&q=80',
    ),
  ];

  WorkoutExercise get _currentExercise => _exercises[_currentExerciseIndex];
  
  double get _progressPercentage {
    final totalDuration = _currentExercise.duration;
    final elapsed = totalDuration - _remainingSeconds;
    return (elapsed / totalDuration).clamp(0.0, 1.0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _startTimer();
      } else {
        _timer?.cancel();
      }
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _nextExercise();
        }
      });
    });
  }

  void _previousExercise() {
    if (_currentExerciseIndex > 0) {
      setState(() {
        _currentExerciseIndex--;
        _remainingSeconds = _currentExercise.duration;
        if (_isPlaying) {
          _startTimer();
        }
      });
    }
  }

  void _nextExercise() {
    if (_currentExerciseIndex < _exercises.length - 1) {
      setState(() {
        _currentExerciseIndex++;
        _remainingSeconds = _currentExercise.duration;
        if (_isPlaying) {
          _startTimer();
        }
      });
    } else {
      _completeWorkout();
    }
  }

  void _restart() {
    setState(() {
      _remainingSeconds = _currentExercise.duration;
      _isPlaying = false;
      _timer?.cancel();
    });
  }

  void _completeWorkout() {
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
    });
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          '🎉 Workout Complete!',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Great job! You\'ve completed all exercises.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentExerciseIndex = 0;
                _remainingSeconds = _exercises[0].duration;
              });
            },
            child: const Text(
              'Done',
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

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildGradientOverlay(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.network(
        _currentExercise.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.7),
              Colors.black,
            ],
            stops: const [0.0, 0.5, 0.9],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Column(
        children: [
          _buildTopBar(),
          const Spacer(),
          _buildTimer(),
          const SizedBox(height: 40),
          _buildControls(),
          const SizedBox(height: 60),
          _buildCurrentExerciseCard(),
          const SizedBox(height: 20),
          _buildStartButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Back pressed')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Column(
      children: [
        Text(
          _formatTime(_remainingSeconds),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${_currentExercise.reps}x ${_currentExercise.name}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(
          icon: Icons.replay,
          onTap: _restart,
          size: 56,
        ),
        const SizedBox(width: 20),
        _buildControlButton(
          icon: Icons.skip_previous,
          onTap: _previousExercise,
          size: 56,
        ),
        const SizedBox(width: 20),
        _buildPlayPauseButton(),
        const SizedBox(width: 20),
        _buildControlButton(
          icon: Icons.skip_next,
          onTap: _nextExercise,
          size: 56,
        ),
        const SizedBox(width: 20),
        _buildControlButton(
          icon: Icons.stop,
          onTap: _completeWorkout,
          size: 56,
        ),
      ],
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFFC107),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFC107).withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    required double size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildCurrentExerciseCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC107),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_currentExercise.reps}x ${_currentExercise.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatTime(_currentExercise.duration),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${(_progressPercentage * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          if (!_isPlaying) {
            _togglePlayPause();
          } else {
            _nextExercise();
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              _isPlaying ? 'Next Exercise' : 'Start',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}