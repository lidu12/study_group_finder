import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/mock_data/mock_seeds.dart';

class SessionDetailsScreen extends StatefulWidget {
  const SessionDetailsScreen({
    required this.sessionId,
    super.key,
  });

  final String sessionId;

  @override
  State<SessionDetailsScreen> createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {
  late Map<String, dynamic> _session;
  late bool _isJoined;
  late List<String> _members;

  @override
  void initState() {
    super.initState();
    final found = MockSeeds.studySessions.firstWhere(
      (s) => s['id'] == widget.sessionId,
      orElse: () => MockSeeds.studySessions.first,
    );
    _session = Map<String, dynamic>.from(found);
    _isJoined = _session['isJoined'] == true;
    _members = List<String>.from(_session['memberNames'] as List);
  }

  void _toggleJoin() {
    final currentUserName = MockSeeds.currentUser['name'] as String;
    setState(() {
      _isJoined = !_isJoined;
      if (_isJoined) {
        if (!_members.contains(currentUserName)) {
          _members.add(currentUserName);
        }
      } else {
        _members.remove(currentUserName);
      }
      _session['isJoined'] = _isJoined;
      _session['memberNames'] = _members;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isJoined
            ? 'You joined this study session!'
            : 'You left this study session.'),
        backgroundColor: _isJoined ? AppColors.success : AppColors.textSecondary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _session['courseCode'] ?? 'Course',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Topic Header
            Text(
              _session['topic'] ?? 'Study Session',
              style: AppTextStyles.h1.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text(
              'Organized by ${_session['organizerName']}',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: 24), 

            // Info Card: Date, Time & Meeting Place
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${_session['date']} • ${_session['startTime']} - ${_session['endTime']}',
                          style: AppTextStyles.body,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.place, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _session['meetingPlace'] ?? 'Campus Meeting Place',
                              style: AppTextStyles.body,
                            ),
                            if (_session['latitude'] != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'GPS: ${_session['latitude']}° N, ${_session['longitude']}° E (AAU Campus)',
                                  style: AppTextStyles.caption.copyWith(color: AppColors.primary),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), 

            // Attendees Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Attendees', style: AppTextStyles.h2),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${_members.length} Confirmed',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _members.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final member = _members[index];
                final isMe = member == MockSeeds.currentUser['name'];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        child: Text(
                          member.isNotEmpty ? member[0] : 'S',
                          style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          member + (isMe ? ' (You)' : ''),
                          style: AppTextStyles.body.copyWith(
                            fontWeight: isMe ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                      const Icon(Icons.check_circle, size: 18, color: AppColors.success),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),

            // RSVP Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _toggleJoin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isJoined ? AppColors.surfaceVariant : AppColors.primary,
                  foregroundColor: _isJoined ? AppColors.textPrimary : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(_isJoined ? 'Leave Study Session' : 'Join Study Session (RSVP)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

