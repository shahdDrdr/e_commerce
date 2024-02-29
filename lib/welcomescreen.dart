// //import 'package:e_commerc/ui/views/splash_view/splash_view.dart';
// //import 'package:flutter/foundation.dart';
// import 'package:e_commerc/ui/shared/custom_widget/container.dart';
// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//             body: Stack(
//       children: [
//         Image.asset(
//           'assets/images/pngs/drawable/main_background.png',
//           fit: BoxFit.fitWidth,
//           width: size.width,
//         ),
//         Container(
//           width: size.width,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color.fromRGBO(0, 173, 239, 1),
//               Color.fromRGBO(0, 173, 239, 0.89),
//               Color.fromRGBO(46, 49, 146, 0.89),
//             ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.only(
//               start: size.width / 14,
//               end: size.width / 14,
//               top: size.width / 7),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Welcome to Pony,',
//                 style:
//                     TextStyle(color: Colors.white, fontSize: size.width / 19),
//               ),
//               Text(
//                 'an e-commerce app !',
//                 style:
//                     TextStyle(color: Colors.white, fontSize: size.width / 19),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     top: size.width / 14, bottom: size.width / 13),
//                 child: Text(
//                   'There are also country specific classified online sites like usfreeads.com for United States. There are a number of agencies throughout the world that have made a business out of the classified advertising industry. ',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               ContainerCustom(
//                   text: 'Go to the Hope page',
//                   texttwo: 'Start to explore your shopping paradise',
//                   image: 'home'),
//               ContainerCustom(
//                   text: 'Search your products',
//                   texttwo: 'You can search what you need so quick',
//                   image: 'search'),
//               ContainerCustom(
//                   text: 'You need the help ?',
//                   texttwo: 'Support team can help you 24/7',
//                   image: 'faq'),
//             ],
//           ),
//         )
//       ],
//     )));
//   }
// }
