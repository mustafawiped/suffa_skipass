// class ApiLoginUnauthorized {
//   String type;
//   String title;
//   int status;
//   String traceId;

//   ApiLoginUnauthorized({
//     required this.type,
//     required this.title,
//     required this.status,
//     required this.traceId,
//   });

//   // JSON serialization
//   Map<String, dynamic> toJson() => {
//         'type': type,
//         'title': title,
//         'status': status,
//         'traceId': traceId,
//       };

//   factory ApiLoginUnauthorized.fromJson(Map<String, dynamic> json) {
//     return ApiLoginUnauthorized(
//       type: json['type'],
//       title: json['title'],
//       status: json['status'],
//       traceId: json['traceId'],
//     );
//   }
// }
