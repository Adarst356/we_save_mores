import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';
import '../../../utils/custom_appbar.dart';
import 'notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotificationController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: "Notification & Events",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
        rightIcon: Obx(() {
          if (controller.notifications.isEmpty) return const SizedBox();

          return TextButton(
            onPressed: () => controller.markAllAsRead(),
            child: const Text(
              "Mark All Read",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          );
        }),
      ),

      body: Obx(() {
        return controller.notificationState.value.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

          error: (msg) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/network_error.png',
                  height: 200,
                ),
                Spacing.h20,
                AppText(
                  msg,
                  fontSize: 16,
                  color: Colors.grey,
                  align: TextAlign.center,
                ),
                Spacing.h20,
                ElevatedButton.icon(
                  onPressed: () => controller.getNotification(),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Retry"),
                ),
              ],
            ),
          ),

          success: (data) {
            final notifications = controller.notifications;

            if (notifications.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/network_error.png',
                      height: 200,
                    ),
                    Spacing.h20,
                    const AppText(
                      "No notifications yet",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    Spacing.h10,
                    const AppText(
                      "You're all caught up!",
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => controller.refreshNotifications(),
              child: ListView.builder(
                itemCount: notifications.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final notificationData = notifications[index];
                  final isUnread = notificationData.isSeen == false;

                  return GestureDetector(
                    onTap: () => controller.markAsRead(notificationData.id),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: isUnread
                            ? const Color(0xffd5dbf5)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: isUnread
                            ? Border.all(color: Colors.blue, width: 1.5)
                            : null,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Notification Icon or Image
                          notificationData.imageUrl != null &&
                              notificationData.imageUrl!.isNotEmpty
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              notificationData.imageUrl!,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                              const Icon(Icons.notifications, size: 60),
                            ),
                          )
                              : const Icon(Icons.notifications, size: 60),

                          Spacing.w12,

                          // Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppText(
                                        notificationData.title ?? "Notification",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    if (isUnread)
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                  ],
                                ),

                                Spacing.h8,

                                AppText(
                                  notificationData.message ?? "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),

                                Spacing.h8,

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Spacing.w6,
                                    AppText(
                                      _formatDate(notificationData.entryDate),
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },

          none: () => const SizedBox(),
        );
      }),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return "Just now";

    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          if (difference.inMinutes == 0) {
            return "Just now";
          }
          return "${difference.inMinutes}m ago";
        }
        return "${difference.inHours}h ago";
      } else if (difference.inDays == 1) {
        return "Yesterday";
      } else if (difference.inDays < 7) {
        return "${difference.inDays}d ago";
      } else {
        return DateFormat('dd MMM yyyy').format(date);
      }
    } catch (e) {
      return dateStr;
    }
  }
}