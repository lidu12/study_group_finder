// State integration drafted with OpenAI Codex. Team review pending.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../profile_provider.dart';
import '../../../auth/presentation/auth_provider.dart';
import '../../domain/student_profile.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/mock_data/mock_seeds.dart';

class ProfileCoursesScreen extends ConsumerStatefulWidget {
  const ProfileCoursesScreen({super.key});

  @override
  ConsumerState<ProfileCoursesScreen> createState() =>
      _ProfileCoursesScreenState();
}

class _ProfileCoursesScreenState extends ConsumerState<ProfileCoursesScreen> {
  void _toggleCourse(String courseId) =>
      ref.read(profileProvider.notifier).toggleCourse(courseId);

  void _removeSlot(int index) {
    ref.read(profileProvider.notifier).removeAvailability(index);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Availability slot removed'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAddSlotDialog() {
    String selectedDay = 'Monday';
    TimeOfDay startTime = const TimeOfDay(hour: 14, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 16, minute: 0);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext sheetContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            String formatTime(TimeOfDay time) {
              final hour = time.hour.toString().padLeft(2, '0');
              final minute = time.minute.toString().padLeft(2, '0');
              return '$hour:$minute';
            }

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add Availability Slot',
                        style: AppTextStyles.h2,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(sheetContext),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Day Dropdown
                  DropdownButtonFormField<String>(
                    initialValue: selectedDay,
                    decoration: const InputDecoration(
                      labelText: 'Day of the Week',
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Monday', child: Text('Monday')),
                      DropdownMenuItem(
                        value: 'Tuesday',
                        child: Text('Tuesday'),
                      ),
                      DropdownMenuItem(
                        value: 'Wednesday',
                        child: Text('Wednesday'),
                      ),
                      DropdownMenuItem(
                        value: 'Thursday',
                        child: Text('Thursday'),
                      ),
                      DropdownMenuItem(value: 'Friday', child: Text('Friday')),
                      DropdownMenuItem(
                        value: 'Saturday',
                        child: Text('Saturday'),
                      ),
                      DropdownMenuItem(value: 'Sunday', child: Text('Sunday')),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        setModalState(() => selectedDay = val);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Start and End Time Pickers
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.access_time),
                          label: Text('Start: ${formatTime(startTime)}'),
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: sheetContext,
                              initialTime: startTime,
                            );
                            if (picked != null) {
                              setModalState(() => startTime = picked);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.access_time_filled),
                          label: Text('End: ${formatTime(endTime)}'),
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: sheetContext,
                              initialTime: endTime,
                            );
                            if (picked != null) {
                              setModalState(() => endTime = picked);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Add Slot Confirm Button
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(profileProvider.notifier)
                          .addAvailability(
                            AvailabilitySlot(
                              dayOfWeek: selectedDay,
                              startTime: formatTime(startTime),
                              endTime: formatTime(endTime),
                            ),
                          );
                      Navigator.pop(sheetContext);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added $selectedDay slot (${formatTime(startTime)} - ${formatTime(endTime)})',
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    child: const Text('Add Time Slot'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(profileProvider);
    final enrolledCourseIds = user.enrolledCourseIds;
    final availability = user.availability;
    final allCourses = MockSeeds.courses;
    final signedIn = ref.watch(authProvider) != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Courses'),
        actions: [
          IconButton(
            tooltip: signedIn ? 'Logout' : 'Sign in',
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).signOut();
              context.go('/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.school, color: Colors.white, size: 36),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, style: AppTextStyles.h2),
                        const SizedBox(height: 4),
                        Text(
                          'ID: ${user.studentId}',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(user.email, style: AppTextStyles.bodySecondary),
                        const SizedBox(height: 2),
                        Text(
                          '${user.department} • Year ${user.yearOfStudy}',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Enrolled Courses Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Enrolled Courses', style: AppTextStyles.h2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${enrolledCourseIds.length} Selected',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Select the courses you are taking this semester to find compatible study groups.',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allCourses.map((c) {
                final isEnrolled = enrolledCourseIds.contains(c['id']);
                return FilterChip(
                  label: Text('${c['courseCode']} - ${c['courseName']}'),
                  selected: isEnrolled,
                  selectedColor: AppColors.primary.withValues(alpha: 0.15),
                  checkmarkColor: AppColors.primary,
                  onSelected: (_) => _toggleCourse(c['id'] as String),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),

            // Weekly Availability Slots
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Weekly Availability', style: AppTextStyles.h2),
                TextButton.icon(
                  onPressed: _showAddSlotDialog,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add Slot'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (availability.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Center(
                  child: Text(
                    'No availability slots added yet.\nClick "Add Slot" above to set your study times.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySecondary,
                  ),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: availability.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final slot = availability[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '${slot.dayOfWeek}: ${slot.startTime} - ${slot.endTime}',
                            style: AppTextStyles.body,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 18,
                            color: AppColors.textMuted,
                          ),
                          onPressed: () => _removeSlot(index),
                          tooltip: 'Remove slot',
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
