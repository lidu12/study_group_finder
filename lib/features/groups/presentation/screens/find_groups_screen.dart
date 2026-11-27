// State integration drafted with OpenAI Codex. Team review pending.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../groups_provider.dart';
import '../../../profile/presentation/profile_provider.dart';
import '../../domain/study_group.dart';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class FindGroupsScreen extends ConsumerStatefulWidget {
  const FindGroupsScreen({super.key});

  @override
  ConsumerState<FindGroupsScreen> createState() => _FindGroupsScreenState();
}

class _FindGroupsScreenState extends ConsumerState<FindGroupsScreen> {
  String _selectedCourse = 'All';
  String _searchQuery = '';
  void _toggleJoin(StudyGroup group) {
    ref.read(groupsProvider.notifier).toggleMembership(group.id);
    final joined = !group.isMember;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          joined
              ? 'Successfully joined ${group.name}!'
              : 'You left ${group.name}.',
        ),
        backgroundColor: joined ? AppColors.success : AppColors.textSecondary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showCreateGroupDialog() {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String courseCode = 'SEng3112';

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Create Study Group', style: AppTextStyles.h2),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Group Name'),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: courseCode,
                  decoration: const InputDecoration(labelText: 'Course'),
                  items:
                      ['SEng3112', 'SEng3121', 'CS3101', 'SEng4131', 'CS3202']
                          .map(
                            (c) => DropdownMenuItem(value: c, child: Text(c)),
                          )
                          .toList(),
                  onChanged: (val) {
                    if (val != null) courseCode = val;
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Group Description',
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.trim().isNotEmpty) {
                  ref
                      .read(groupsProvider.notifier)
                      .add(
                        StudyGroup(
                          id: 'grp_${DateTime.now().microsecondsSinceEpoch}',
                          name: nameCtrl.text.trim(),
                          courseCode: courseCode,
                          courseName: 'Addis Ababa University Course',
                          description: descCtrl.text.trim().isNotEmpty
                              ? descCtrl.text.trim()
                              : 'Collaborative student study group for $courseCode.',
                          creatorName: ref.read(profileProvider).name,
                          memberCount: 1,
                          isMember: true,
                        ),
                      );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Study group created successfully!'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredGroups = ref.watch(groupsProvider).where((g) {
      final matchesCourse =
          _selectedCourse == 'All' || g.courseCode == _selectedCourse;
      final query = _searchQuery.toLowerCase();
      final matchesQuery =
          _searchQuery.isEmpty ||
          g.name.toLowerCase().contains(query) ||
          g.courseCode.toLowerCase().contains(query) ||
          g.description.toLowerCase().contains(query);
      return matchesCourse && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Study Groups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.group_add_outlined),
            tooltip: 'Create Group',
            onPressed: _showCreateGroupDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Input
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Search groups by course or topic...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _searchQuery = ''),
                      )
                    : null,
              ),
            ),
          ),

          // Course Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: ['All', 'SEng3112', 'SEng3121', 'CS3101', 'SEng4131']
                  .map((courseCode) {
                    final isSelected = _selectedCourse == courseCode;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Text(courseCode),
                        selected: isSelected,
                        onSelected: (_) =>
                            setState(() => _selectedCourse = courseCode),
                        selectedColor: AppColors.primary.withValues(
                          alpha: 0.15,
                        ),
                        checkmarkColor: AppColors.primary,
                      ),
                    );
                  })
                  .toList(),
            ),
          ),

          // Results List
          Expanded(
            child: filteredGroups.isEmpty
                ? const Center(
                    child: Text(
                      'No study groups found matching your search.',
                      style: AppTextStyles.bodySecondary,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredGroups.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final group = filteredGroups[index];
                      final isMember = group.isMember;
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    group.courseCode,
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.primary,

                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.people_outline,
                                      size: 16,
                                      color: AppColors.textSecondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${group.memberCount} members',
                                      style: AppTextStyles.caption,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(group.name, style: AppTextStyles.h3),
                            const SizedBox(height: 6),
                            Text(
                              group.description,
                              style: AppTextStyles.bodySecondary,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Created by ${group.creatorName}',
                                  style: AppTextStyles.caption,
                                ),
                                ElevatedButton(
                                  onPressed: () => _toggleJoin(group),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isMember
                                        ? AppColors.surfaceVariant
                                        : AppColors.primary,
                                    foregroundColor: isMember
                                        ? AppColors.textPrimary
                                        : Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                  ),
                                  child: Text(
                                    isMember ? 'Leave Group' : 'Join Group',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateGroupDialog,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
