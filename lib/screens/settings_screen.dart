// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
// import 'package:meeteasy/resources/auth_methods.dart';
// import 'package:meeteasy/widgets/custom_button.dart';

// class Settings extends StatelessWidget {
//   Settings({Key? key}) : super(key: key);

//   final AuthMethods _authMethods = AuthMethods();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 _authMethods.user.displayName.toString(),
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               InkWell(
//                 text: '
                
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
