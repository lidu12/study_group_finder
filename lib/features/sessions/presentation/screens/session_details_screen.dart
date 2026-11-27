// State integration drafted with OpenAI Codex. Team review pending.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sessions_provider.dart';
import '../../../profile/presentation/profile_provider.dart';
import '../../domain/study_session.dart';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class SessionDetailsScreen extends ConsumerWidget {
  const SessionDetailsScreen({required this.sessionId, super.key});

  final String sessionId;

  void _toggleJoin(BuildContext context, WidgetRef ref, StudySession session) {
    ref
        .read(sessionsProvider.notifier)
        .toggleRsvp(session.id, ref.read(profileProvider).name);
    final joined = !session.isJoined;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          joined
              ? 'You joined this study session!'
              : 'You left this study session.',
        ),
        backgroundColor: joined ? AppColors.success : AppColors.textSecondary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref
        .watch(sessionsProvider)
        .where((item) => item.id == sessionId)
        .firstOrNull;
    if (session == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Session Details')),
        body: const Center(child: Text('Session not found')),
      );
    }
    final isJoined = session.isJoined;
    final members = session.memberNames;
    final currentName = ref.watch(profileProvider).name;
    final limit = session.maxParticipants;
    final isFull = limit != null && members.length >= limit;
    return Scaffold(
      appBar: AppBar(title: const Text('Session Details')),
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
                session.courseCode,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Topic Header
            Text(session.topic, style: AppTextStyles.h1.copyWith(fontSize: 22)),
            const SizedBox(height: 8),
            Text(
              'Organized by ${session.organizerName}',
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
                      const Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${session.date} • ${session.startTime} - ${session.endTime}',
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
                              session.meetingPlace,
                              style: AppTextStyles.body,
                            ),
                            if (session.latitude != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'GPS: ${session.latitude}° N, ${session.longitude}° E (AAU Campus)',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.primary,
                                  ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${members.length} Confirmed',
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
              itemCount: members.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final isMe = isJoined && index == 0;
                final member = isMe ? currentName : members[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primary.withValues(
                          alpha: 0.1,
                        ),
                        child: Text(
                          member.isNotEmpty ? member[0] : 'S',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          member + (isMe ? ' (You)' : ''),
                          style: AppTextStyles.body.copyWith(
                            fontWeight: isMe
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: AppColors.success,
                      ),
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
                onPressed: !isJoined && isFull
                    ? null
                    : () => _toggleJoin(context, ref, session),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isJoined
                      ? AppColors.surfaceVariant
                      : AppColors.primary,
                  foregroundColor: isJoined
                      ? AppColors.textPrimary
                      : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  isJoined
                      ? 'Leave Study Session'
                      : 'Join Study Session (RSVP)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
