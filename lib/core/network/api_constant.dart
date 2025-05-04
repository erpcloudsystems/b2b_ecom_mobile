class ApiConstance {
  static const int pageLength = 20;
  static const String siteUrl = 'https://erpcloud.systems';
  // static const String siteUrl = 'https://Ecsdemo.erpnext.cloud';
  static const String baseUrl = "$siteUrl/api/";
  static const String login = 'method/ecs_ecs.ecs_mobile.login';
  static const String logout = 'method/logout';
  static const String forgetPassword =
      'method/frappe.core.doctype.user.user.reset_password';
  static const String taskEndPoint = 'resource/Task';
  static const String getProfile = 'resource/Employee';
  /*static String editProfile({required String name}) {
    return 'resource/User/$name';
  }*/
  static const String changePassword =
      'method/frappe.core.doctype.user.user.update_password';
  static const String getTimeSheet = 'resource/Timesheet';
  static String getTimeSheetDetails(String id) => '$getTimeSheet/$id';
  static const String userEndPoint = 'resource/User';
  static const String assignInTaskEndPoint =
      'method/frappe.desk.form.assign_to.add';

  // Project
  static const String projectEndPoint = 'resource/Project';

  // Check in
  static const String checkInEndPoint = 'resource/Employee Checkin';
  // Leave Application
  static const String leaveApplicationEndPoint = 'resource/Leave Application';
  static const String createLeaveApplicationEndPoint =
      'method/ecs_ecs.ecs_mobile.leave_application';
  // Issue
  static const String issueEndPoint = 'resource/Issue';

  static String submit({required String docType, required String id}) =>
      '$docType/$id';

  static String userTasks = 'method/ecs_ecs.ecs_mobile.get_tasks';

  // Notifications
  static const String sendDeviceTokenEndPoint =
      'method/ecs_ecs.doctype_triggers.projects.todo.todo.get_push_notification_details';
  static const String getNotifications = 'resource/Notification Log';

  // Comment
  static const String commentEndPoint = 'resource/Comment';

  // Note
  static const String noteEndPoint = 'resource/Note';

  // Attachment
  static const String getAttachmentEndPoint = 'resource/File';
  static const String uploadAttachmentEndPoint = 'method/upload_file';
}
