// State integration drafted with OpenAI Codex. Team review pending.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sessions_provider.dart';
import '../../../profile/presentation/profile_provider.dart';
import '../../domain/study_session.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CreateSessionScreen extends ConsumerStatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  ConsumerState<CreateSessionScreen> createState() =>
      _CreateSessionScreenState();
}

class _CreateSessionScreenState extends ConsumerState<CreateSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _topicController = TextEditingController();
  final _locationController = TextEditingController(
    text: 'AAU 4 Kilo Campus Library, Study Hall',
  );

  String _selectedCourse = 'SEng3112';
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 2));
  TimeOfDay _selectedTime = const TimeOfDay(hour: 14, minute: 0);
  int _maxParticipants = 5;
  bool _useGps = false;

  @override
  void dispose() {
    _topicController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _useCampusLocation() {
    setState(() {
      _useGps = true;
      _locationController.text =
          'AAU 4 Kilo Science Library (9.0353° N, 38.7628° E)';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Simulated AAU Campus GPS Location Attached! (9.0353° N, 38.7628° E)',
        ),
        backgroundColor: AppColors.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _publishSession() {
    if (!_formKey.currentState!.validate()) return;

    final formattedDate =
        '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
    final formattedTime = _selectedTime.format(context);

    final organizerName = ref.read(profileProvider).name;
    ref
        .read(sessionsProvider.notifier)
        .add(
          StudySession(
            id: 'sess_${DateTime.now().microsecondsSinceEpoch}',
            courseCode: _selectedCourse,
            topic: _topicController.text.trim(),
            date: formattedDate,
            startTime: formattedTime,
            endTime: TimeOfDay(
              hour: (_selectedTime.hour + 2) % 24,
              minute: _selectedTime.minute,
            ).format(context),
            meetingPlace: _locationController.text.trim(),
            organizerName: organizerName,
            memberNames: [organizerName],
            isJoined: true,
            latitude: _useGps ? 9.0353 : null,
            longitude: _useGps ? 38.7628 : null,
            maxParticipants: _maxParticipants,
          ),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Study session successfully published!'),
        backgroundColor: AppColors.success,
      ),
    );

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Study Session')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Course Selector
              const Text('Target Course', style: AppTextStyles.h3),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _selectedCourse,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.school_outlined),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'SEng3112',
                    child: Text('SEng3112 - Mobile Applications'),
                  ),
                  DropdownMenuItem(
                    value: 'SEng3121',
                    child: Text('SEng3121 - Software Architecture'),
                  ),
                  DropdownMenuItem(
                    value: 'CS3101',
                    child: Text('CS3101 - Operating Systems'),
                  ),
                  DropdownMenuItem(
                    value: 'SEng4131',
                    child: Text('SEng4131 - Artificial Intelligence'),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => _selectedCourse = val);
                },
              ),
              const SizedBox(height: 20),

              // Study Topic Field
              const Text('Study Topic & Agenda', style: AppTextStyles.h3),
              const SizedBox(height: 8),
              TextFormField(
                controller: _topicController,
                decoration: const InputDecoration(
                  hintText: 'e.g. Chapter 4 Pipeline & Memory Management',
                  prefixIcon: Icon(Icons.menu_book),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a study topic or agenda';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Date & Time Pickers
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
                          label: Text(
                            '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                          ),
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 60),
                              ),
                            );
                            if (picked != null && mounted) {
                              setState(() => _selectedDate = picked);
                            }
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
                            if (picked != null && mounted) {
                              setState(() => _selectedTime = picked);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Meeting Place with AAU Campus GPS Action
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
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Campus location or room number',
                  prefixIcon: const Icon(Icons.place_outlined),
                  suffixIcon: _useGps
                      ? const Icon(
                          Icons.gps_fixed,
                          color: AppColors.primary,
                          size: 20,
                        )
                      : null,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please specify a campus meeting location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Max Attendees Stepper
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Max Attendees', style: AppTextStyles.h3),
                      Text(
                        'Recommended size for focus: 3 - 6',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton.outlined(
                        icon: const Icon(Icons.remove, size: 18),
                        onPressed: _maxParticipants > 2
                            ? () => setState(() => _maxParticipants--)
                            : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '$_maxParticipants',
                          style: AppTextStyles.h2,
                        ),
                      ),
                      IconButton.outlined(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: _maxParticipants < 15
                            ? () => setState(() => _maxParticipants++)
                            : null,
                      ),
                    ],
                  ),
                ],
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
      ),
    );
  }
}
