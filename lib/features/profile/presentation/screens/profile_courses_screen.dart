import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/mock_data/mock_seeds.dart';

class ProfileCoursesScreen extends StatefulWidget {
  const ProfileCoursesScreen({super.key});

  @override
  State<ProfileCoursesScreen> createState() => _ProfileCoursesScreenState();
}

class _ProfileCoursesScreenState extends State<ProfileCoursesScreen> {
  late Set<String> _enrolledCourseIds;

  @override
  void initState() {
    super.initState();
    _enrolledCourseIds = Set<String>.from(
      MockSeeds.currentUser['enrolledCourseIds'] as List,
    );
  }

  void _toggleCourse(String courseId) {
    setState(() {
      if (_enrolledCourseIds.contains(courseId)) {
        _enrolledCourseIds.remove(courseId);
      } else {
        _enrolledCourseIds.add(courseId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = MockSeeds.currentUser;
    final allCourses = MockSeeds.courses;
    final availability = user['availability'] as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go('/login'),
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
                        Text(user['name'], style: AppTextStyles.h2),
                        const SizedBox(height: 4),
                        Text(user['email'], style: AppTextStyles.bodySecondary),
                        const SizedBox(height: 2),
                        Text(
                          '${user['department']} • Year ${user['yearOfStudy']}',
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
            const Text('Enrolled Courses', style: AppTextStyles.h2),
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
                final isEnrolled = _enrolledCourseIds.contains(c['id']);
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add time slot feature opened')),
                    );
                  },
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Add Slot'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: availability.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final slot = availability[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.schedule, color: AppColors.primary, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${slot['dayOfWeek']}: ${slot['startTime']} - ${slot['endTime']}',
                          style: AppTextStyles.body,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 18, color: AppColors.textMuted),
                        onPressed: () {},
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
