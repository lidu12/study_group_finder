import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/mock_data/mock_seeds.dart';

class FindGroupsScreen extends StatefulWidget {
  const FindGroupsScreen({super.key});

  @override
  State<FindGroupsScreen> createState() => _FindGroupsScreenState();
}

class _FindGroupsScreenState extends State<FindGroupsScreen> {
  String _selectedCourse = 'All';
  String _searchQuery = '';
  late List<Map<String, dynamic>> _groups;

  @override
  void initState() {
    super.initState();
    _groups = List<Map<String, dynamic>>.from(
      MockSeeds.studyGroups.map((g) => Map<String, dynamic>.from(g)),
    );
  }

  void _toggleJoin(int index) {
    setState(() {
      final isMember = _groups[index]['isMember'] as bool;
      _groups[index]['isMember'] = !isMember;
      _groups[index]['memberCount'] = (_groups[index]['memberCount'] as int) + (isMember ? -1 : 1);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _groups[index]['isMember']
              ? 'Joined ${_groups[index]['name']}'
              : 'Left ${_groups[index]['name']}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredGroups = _groups.where((g) {
      final matchesCourse = _selectedCourse == 'All' || g['courseCode'] == _selectedCourse;
      final matchesQuery = _searchQuery.isEmpty ||
          g['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          g['courseCode'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCourse && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Study Groups'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: const InputDecoration(
                hintText: 'Search groups by course or topic...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          // Course Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                'All',
                'SEng3112',
                'SEng3121',
                'CS3101',
                'SEng4131',
              ].map((courseCode) {
                final isSelected = _selectedCourse == courseCode;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(courseCode),
                    selected: isSelected,
                    onSelected: (_) => setState(() => _selectedCourse = courseCode),
                    selectedColor: AppColors.primary.withValues(alpha: 0.15),
                    checkmarkColor: AppColors.primary,
                  ),
                );
              }).toList(),
            ),
          ),

          // Groups List
          Expanded(
            child: filteredGroups.isEmpty
                ? const Center(
                    child: Text(
                      'No study groups found for this course filter.',
                      style: AppTextStyles.bodySecondary,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredGroups.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final group = filteredGroups[index];
                      final isMember = group['isMember'] as bool;
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
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    group['courseCode'],
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.people_outline, size: 16, color: AppColors.textSecondary),
                                    const SizedBox(width: 4),
                                    Text('${group['memberCount']} members', style: AppTextStyles.caption),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(group['name'], style: AppTextStyles.h3),
                            const SizedBox(height: 6),
                            Text(
                              group['description'],
                              style: AppTextStyles.bodySecondary,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Led by ${group['creatorName']}',
                                  style: AppTextStyles.caption,
                                ),
                                ElevatedButton(
                                  onPressed: () => _toggleJoin(_groups.indexOf(group)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isMember ? AppColors.surfaceVariant : AppColors.primary,
                                    foregroundColor: isMember ? AppColors.textPrimary : Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  ),
                                  child: Text(isMember ? 'Leave Group' : 'Join Group'),
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
    );
  }
}
