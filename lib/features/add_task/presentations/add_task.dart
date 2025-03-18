// // ignore_for_file: camel_case_types, avoid_print
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:todo/core/helper/my_navigator.dart';
// import 'package:todo/core/resource_manager/app_colors.dart';
// import 'package:todo/core/widgets/inputs/Default.dart';
// import 'package:todo/features/add_task/manager/cubit/ad_task_state.dart';
// import 'package:todo/features/add_task/manager/cubit/add_task_cubit.dart';
// import 'package:todo/features/home/presentations/home2.dart';

// class Add_task extends StatelessWidget {
//   Add_task({super.key});

//   final List<String> dropdownItems = ["Home", "Work", "Personal"];
//   final List<Widget> dropdownIcons = [
//     Icon(Icons.house, color: Colors.pink),
//     Icon(Icons.work, color: Colors.black),
//     Icon(Icons.person, color: AppColors.darkGreen),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TaskCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(Icons.arrow_back_ios_new_rounded)),
//           title: Text(
//             "Add Task",
//             style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w300,
//                 color: Color(0xff24252C)),
//           ),
//         ),
//         body: BlocConsumer<TaskCubit, AddTaskState>(
//           builder: (context, state) {
//             final taskCubit = TaskCubit.get(context);
//             return Column(
//               children: [
//                 SizedBox(height: 20),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   height: 65,
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButtonFormField(
//                       value: taskCubit.selectedTaskGroup,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           labelText: "Task Group",
//                           labelStyle: TextStyle(
//                               fontSize: 9,
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xff6E6A7C))),
//                       borderRadius: BorderRadius.circular(15),
//                       icon: Icon(Icons.keyboard_arrow_down_rounded),
//                       isExpanded: true,
//                       itemHeight: 55,
//                       hint: Text(
//                         "Select task group",
//                         style: TextStyle(
//                           color: AppColors.text_black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                       items: dropdownItems.asMap().entries.map((entry) {
//                         int index = entry.key;
//                         String text = entry.value;
//                         return DropdownMenuItem(
//                           value: text,
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                   radius: 18,
//                                   backgroundColor: Colors.grey[200],
//                                   child: dropdownIcons[index]),
//                               SizedBox(width: 15),
//                               Text(text)
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         taskCubit;
//                       },
//                     ),
//                   ),
//                 ),
//                 DefaultFormField(
//                   controller: taskCubit.task_titleController,
//                   hint: "Enter task name",
//                   labelText: "Task Name",
//                 ),
//                 DefaultFormField(
//                   controller: taskCubit.task_DescController,
//                   maxLines: 5,
//                   hint: "Enter task description . . . ",
//                   labelText: "Description",
//                 ),
                
//                 if (state is TaskLoadingState) CircularProgressIndicator(),
//                 Button(
//                   text: "Save",
//                   onPressed: () => taskCubit.saveTask(),
//                 ),
//               ],
//             );
//           },
//           listener: (context, state) {
//             if (state is TaskSuccessState) {
//               navigateTo(context, screen: Home2());
//             } else if (state is TaskErrorState) {
//               Get.showSnackbar(GetSnackBar(
//                 title: "Error",
//                 message: state.error,
//                 duration: Duration(seconds: 3),
//               ));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }