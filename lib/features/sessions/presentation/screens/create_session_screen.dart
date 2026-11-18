import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  final _topicController = TextEditingController();
  final _locationController = TextEditingController(text: 'AAU 4 Kilo Campus Library, Study Hall');
  String _selectedCourse = 'SEng3112';
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 2));
  TimeOfDay _selectedTime = const TimeOfDay(hour: 14, minute: 0);

  @override
  void dispose() {
    _topicController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _useCampusLocation() {
    setState(() {
      _locationController.text = 'AAU 4 Kilo Science Library (9.0353° N, 38.7628° E)';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Simulated AAU Campus GPS Location Attached!'),
        backgroundColor: AppColors.secondary,
      ),
    );
  }

  void _publishSession() {
    if (_topicController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a session study topic'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Study session successfully published!'),
        backgroundColor: AppColors.success,
      ),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Study Session'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Course Dropdown
            const Text('Course', style: AppTextStyles.h3),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedCourse,
              decoration: const InputDecoration(),
              items: const [
                DropdownMenuItem(value: 'SEng3112', child: Text('SEng3112 - Mobile Applications')),
                DropdownMenuItem(value: 'SEng3121', child: Text('SEng3121 - Software Architecture')),
                DropdownMenuItem(value: 'CS3101', child: Text('CS3101 - Operating Systems')),
                DropdownMenuItem(value: 'SEng4131', child: Text('SEng4131 - Artificial Intelligence')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _selectedCourse = val);
              },
            ),
            const SizedBox(height: 20),

            // Topic Field
            const Text('Study Topic & Agenda', style: AppTextStyles.h3),
            const SizedBox(height: 8),
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(
                hintText: 'e.g. Chapter 4 Pipeline and Memory Management',
                prefixIcon: Icon(Icons.menu_book),
              ),
            ),
            const SizedBox(height: 20),

            // Date & Time
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date', style: AppTextStyles.h3),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.calendar_today, size: 18),
                        label: Text('${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 60)),
                          );
                          if (picked != null) setState(() => _selectedDate = picked);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Time', style: AppTextStyles.h3),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.access_time, size: 18),
                        label: Text(_selectedTime.format(context)),
                        onPressed: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                          );
                          if (picked != null) setState(() => _selectedTime = picked);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Meeting Place
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Meeting Place', style: AppTextStyles.h3),
                TextButton.icon(
                  onPressed: _useCampusLocation,
                  icon: const Icon(Icons.my_location, size: 16),
                  label: const Text('Use AAU GPS'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: 'Campus location or room number',
                prefixIcon: Icon(Icons.place_outlined),
              ),
            ),
            const SizedBox(height: 32),

            // Publish Button
            ElevatedButton(
              onPressed: _publishSession,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Publish Study Session'),
            ),
          ],
        ),
      ),
    );
  }
}
