// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo/core/resource_manager/app_colors.dart';
// import 'package:todo/features/settings/manager/cubit/settings_cubit.dart';
// import 'package:todo/features/settings/manager/cubit/settings_state.dart';

// class Settings extends StatelessWidget {
//   const Settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           UpdateProfileCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "Settings",
//             style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w300,
//                 fontFamily: "Lexend Deca",
//                 color: Color(0xff24252C)),
//           ),
//         ),
//         body: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
//           builder: (context, state) {
//             if (state is SettingsChanged) {
//               return Column(
//                 children: [
//                   SizedBox(height: 30),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Notification",
//                           style: TextStyle(
//                               color: Color(0xff24252C),
//                               fontFamily: "Lexend Deca",
//                               fontSize: 20,
//                               fontWeight: FontWeight.w300),
//                         ),
//                         Spacer(),
//                         Switch(
//                           activeTrackColor: AppColors.darkGreen,
//                           value: state.settings.notifications,
//                           onChanged: (val) {
//                             context
//                                 .read<UpdateProfileCubit>()
//                                 .updateSettings(notifications: val);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Enable Cloud",
//                           style: TextStyle(
//                               color: Color(0xff24252C),
//                               fontFamily: "Lexend Deca",
//                               fontSize: 20,
//                               fontWeight: FontWeight.w300),
//                         ),
//                         Spacer(),
//                         Checkbox(
//                           activeColor: AppColors.darkGreen,
//                           value: state.settings.cloud,
//                           onChanged: (val) {
//                             context
//                                 .read<SettingsCubit>()
//                                 .updateSettings(cloud: val!);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }
