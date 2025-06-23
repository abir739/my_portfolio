// // // import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:animate_do/animate_do.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// // void main() {
// //   runApp(const PortfolioApp());
// // }

// // class PortfolioApp extends StatelessWidget {
// //   const PortfolioApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Abir Cherif Portfolio',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         textTheme: GoogleFonts.poppinsTextTheme(),
// //         scaffoldBackgroundColor: Colors.grey.shade100,
// //         cardTheme: CardTheme(
// //           elevation: 4,
// //           shadowColor: Colors.blue.withOpacity(0.2),
// //           shape:
// //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //         ),
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: Colors.blue.shade700,
// //             foregroundColor: Colors.white,
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //           ),
// //         ),
// //       ),
// //       home: const PortfolioHomePage(),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_portfolio_app/pages/home_page.dart';

// void main() {
//   runApp(const PortfolioApp());
// }

// class PortfolioApp extends StatelessWidget {
//   const PortfolioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Abir Cherif Portfolio',
//       theme: ThemeData(
//         primaryColor: Colors.indigo[900],
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.indigo,
//           accentColor: Colors.amber[700],
//         ),
//         textTheme: GoogleFonts.poppinsTextTheme().copyWith(
//           headlineLarge: GoogleFonts.poppins(
//               fontWeight: FontWeight.bold, color: Colors.indigo[900]),
//           bodyMedium: GoogleFonts.poppins(color: Colors.grey[800]),
//         ),
//         scaffoldBackgroundColor: Colors.grey[50],
//         cardTheme: CardTheme(
//           elevation: 5,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.indigo[900],
//             foregroundColor: Colors.white,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           ),
//         ),
//       ),
//       home: const PortfolioHomePage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_app/pages/portfolio_home_page.dart';


void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abir Cherif Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.grey.shade100,
        cardTheme: CardTheme(
          elevation: 6,
          shadowColor: Colors.blue.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            elevation: 3,
          ),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}



