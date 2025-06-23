import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';




class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final String githubUrl = 'https://github.com/abir739';
  final String linkedinUrl = 'https://www.linkedin.com/in/abir-cherif-931770202/';
  final String portfolioUrl = 'https://abir739.github.io/Portfolio';
  final String cvAssetPath = 'assets/pdf/Abeer_Cherif_cv.pdf';
  String? cvLocalPath;

  @override
  void initState() {
    super.initState();
    _prepareCVFile();
  }

  Future<void> _prepareCVFile() async {
    try {
      final byteData = await DefaultAssetBundle.of(context).load(cvAssetPath);
      final file = File('${(await getTemporaryDirectory()).path}/Abeer_Cherif_cv.pdf');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      setState(() {
        cvLocalPath = file.path;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error preparing CV: $e')),
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackBar('Could not launch URL');
      }
    } catch (e) {
      _showErrorSnackBar('Error launching URL: $e');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void _viewCV() {
    if (cvLocalPath != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewerScreen(path: cvLocalPath!),
        ),
      );
    } else {
      _showErrorSnackBar('CV is not ready yet');
    }
  }

  void _downloadCV() {
    _launchUrl('https://abir739.github.io/Portfolio/assets/pdf/Abeer_Cherif_cv.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abir Cherif', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'view_cv') {
                _viewCV();
              } else if (value == 'download_cv') {
                _downloadCV();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'view_cv', child: Text('View CV')),
              const PopupMenuItem(value: 'download_cv', child: Text('Download CV')),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo[900]),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('View CV'),
              onTap: () {
                Navigator.pop(context);
                _viewCV();
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Experience'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Education'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact'),
              onTap: () => _launchUrl('mailto:abir.cherif98@gmail.com'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo[700]!, Colors.indigo[900]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/img.jpg'),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Abir Cherif',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mobile Developer',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Monastir, Tunisia | abir.cherif98@gmail.com | +216 93649677',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _viewCV,
                          icon: const Icon(Icons.description),
                          label: const Text('View CV'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: _downloadCV,
                          icon: const Icon(Icons.download),
                          label: const Text('Download CV'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Professional Summary
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Professional Summary',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Dynamic and passionate Mobile Developer with over two years of experience crafting high-quality web and mobile applications. Expert in Flutter, Dart, JavaScript, and PHP. Led the development of a trip management app, slashing organization time by 30%. Committed to delivering innovative solutions in collaborative, fast-paced environments, with a focus on European opportunities.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            // Experience Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Professional Experience',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    _buildExperienceCard(
                      'Mobile Developer',
                      'Continuous Net, Sousse, Tunisia',
                      'July 2023 - Present',
                      [
                        'Led development of a trip management app using Flutter and Dart, reducing organization time by 30% with real-time updates.',
                        'Collaborated with backend teams to integrate REST APIs in an Agile setting.',
                        'Improved user retention by 20% through usability testing and UI enhancements.',
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildExperienceCard(
                      'Mobile Development Intern',
                      'Continuous Net, Sousse, Tunisia',
                      'Feb 2023 - June 2023',
                      [
                        'Developed a mobile app for trip management, streamlining user workflows.',
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildExperienceCard(
                      'Web Development Intern',
                      'DRÄXLMAIER Group, Monastir, Tunisia',
                      'June 2022 - Aug 2022',
                      [
                        'Optimized a document archiving web app with PHP, cutting load times by 25%.',
                        'Enhanced UI with HTML, CSS, JavaScript, and Laravel.',
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Education Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Education',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    _buildEducationCard(
                      'Bachelor\'s Degree in Computer Engineering',
                      'École Nationale des Sciences de l\'Informatique (ENSI), Manouba, Tunisia',
                      'Jan 2020 - Jan 2023',
                    ),
                    const SizedBox(height: 10),
                    _buildEducationCard(
                      'Degree in Mathematics and Applications',
                      'Higher Institute of Computer Science and Mathematics (ISIMM), Monastir, Tunisia',
                      'Jan 2017 - Jan 2020',
                    ),
                  ],
                ),
              ),
            ),
            // Skills Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        'Flutter',
                        'Dart',
                        'JavaScript',
                        'PHP',
                        'HTML',
                        'CSS',
                        'Angular',
                        'Bootstrap',
                        'MySQL',
                        'Firebase',
                        'Git',
                        'GitLab',
                        'Agile/SCRUM',
                      ].map((skill) => Chip(
                            label: Text(skill),
                            backgroundColor: Colors.indigo[100],
                            labelStyle: TextStyle(color: Colors.indigo[900]),
                          )).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Languages Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Languages',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        'Arabic (Native)',
                        'English (Fluent)',
                        'French (Fluent)',
                      ].map((lang) => Chip(
                            label: Text(lang),
                            backgroundColor: Colors.indigo[100],
                            labelStyle: TextStyle(color: Colors.indigo[900]),
                          )).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Projects Released Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projects Released',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    _buildProjectReleasedCard(
                      'Sunshine Vacances',
                      'A Flutter-based travel app for managing claims, accommodations, and transfers, using Firebase, HTTP, and REST APIs. Features real-time updates and notifications.',
                      'https://play.google.com/store/apps/details?id=com.zenify_client_app',
                    ),
                    const SizedBox(height: 10),
                    _buildProjectReleasedCard(
                      'Tunisie Promo',
                      'A mobile app for discovering promotions in Tunisia, built with Flutter and published on Play Store.',
                      'https://play.google.com/store/search?q=tunisie%20promo&c=apps',
                    ),
                  ],
                ),
              ),
            ),
            // Projects Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projects',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    _buildProjectCard(
                      title: 'Instagram Clone',
                      description: 'A Flutter app mimicking Instagram with Firebase authentication and feed functionality.',
                      url: 'https://github.com/abir739/Instagram-Clone',
                    ),
                    const SizedBox(height: 10),
                    _buildProjectCard(
                      title: 'Voyageur App',
                      description: 'A travel app for managing accommodations and transfers with real-time data.',
                      url: 'https://github.com/abir739/Voyageur_app',
                    ),
                    const SizedBox(height: 10),
                    _buildProjectCard(
                      title: 'Habit Tracker',
                      description: 'A Flutter app for tracking daily habits with Provider state management.',
                      url: 'https://github.com/abir739/Habit-Tracker-Flutter-app',
                    ),
                    const SizedBox(height: 10),
                    _buildProjectCard(
                      title: 'Guide App',
                      description: 'A tourist guide app with user profiles and notifications.',
                      url: 'https://github.com/abir739/Guide_app',
                    ),
                    const SizedBox(height: 10),
                    _buildProjectCard(
                      title: 'Quiz App',
                      description: 'A cross-platform quiz app with local storage and scoring system.',
                      url: 'https://github.com/abir739/Quiz_App',
                    ),
                    const SizedBox(height: 10),
                    _buildProjectCard(
                      title: 'Document Archiving Web App',
                      description: 'A PHP and Laravel-based web app for document management, optimized to reduce load times by 25%.',
                      url: 'https://github.com/abir739/Document_Archiving_Web_App',
                    ),
                  ],
                ),
              ),
            ),
            // Contact Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30.0),
              color: Colors.indigo[900],
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    Text(
                      'Get in Touch',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          icon: Icons.code,
                          label: 'GitHub',
                          url: githubUrl,
                        ),
                        const SizedBox(width: 15),
                        _buildSocialButton(
                          icon: Icons.link,
                          label: 'LinkedIn',
                          url: linkedinUrl,
                        ),
                        const SizedBox(width: 15),
                        _buildSocialButton(
                          icon: Icons.web,
                          label: 'Portfolio',
                          url: portfolioUrl,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '© 2025 Abir Cherif. All rights reserved.',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(
      String title, String company, String duration, List<String> responsibilities) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
            Text(company, style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600])),
            Text(duration, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[500])),
            const SizedBox(height: 10),
            ...responsibilities.map(
              (resp) => Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 14)),
                    Expanded(
                      child: Text(
                        resp,
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard(String degree, String institution, String duration) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(degree, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
            Text(institution, style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600])),
            Text(duration, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectReleasedCard(String title, String description, String url) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Text(description, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
            const SizedBox(height: 10),
            TextButton.icon(
              icon: const Icon(Icons.link, color: Colors.indigo),
              onPressed: () => _launchUrl(url),
              label: Text(
                'View on Store',
                style: GoogleFonts.poppins(color: Colors.indigo[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required String url,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700])),
            const SizedBox(height: 12),
            TextButton.icon(
              icon: const Icon(Icons.code, color: Colors.indigo),
              onPressed: () => _launchUrl(url),
              label: Text(
                'View on Source',
                style: GoogleFonts.poppins(color: Colors.indigo[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return ElevatedButton.icon(
      onPressed: () => _launchUrl(url),
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
        elevation: 3,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String path;

  const PDFViewerScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV - Abir Cherif'),
        backgroundColor: Colors.indigo[900],
      ),
      body: PDFView(
        filePath: path,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error loading PDF: $error')),
          );
        },
      ),
    );
  }
}