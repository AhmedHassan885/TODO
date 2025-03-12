// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Language extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('settings'.tr),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'language'.tr,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Obx(() {
//               return Row(
//                 children: [
//                   _buildLanguageButton('AR', 'ar'),
//                   _buildLanguageButton('EN', 'en'),
//                 ],
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageButton(String label, String langCode) {
//     return GestureDetector(
//       onTap: () {
//         LocalizationService().changeLocale(langCode);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         margin: EdgeInsets.only(right: 10),
//         decoration: BoxDecoration(
//           color: Get.locale?.languageCode == langCode ? Colors.green : Colors.grey[300],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: Get.locale?.languageCode == langCode ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LocalizationService extends Translations {
//   static final locales = [Locale('en'), Locale('ar')];

//   static final Map<String, Map<String, String>> translations = {
//     'en': {'settings': 'Settings', 'language': 'Language'},
//     'ar': {'settings': 'الإعدادات', 'language': 'اللغة'},
//   };

//   @override
//   Map<String, Map<String, String>> get keys => translations;

//   void changeLocale(String langCode) {
//     final locale = Locale(langCode);
//     Get.updateLocale(locale);
//   }
// }
