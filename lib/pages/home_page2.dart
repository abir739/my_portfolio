// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';




class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final String githubUrl = 'https://github.com/abir739';
  final String linkedinUrl =
      'https://www.linkedin.com/in/abir-cherif-931770202/';
  final String portfolioUrl = 'https://abir739.github.io/Portfolio';
  final String cvUrl =
      "assets/pdf/Abeer_Cherif_cv.pdf";

  Future<void> _launchUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch URL')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error launching URL: $e')),
      );
    }
  }

  void _viewCV(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CVViewerScreen(cvUrl: cvUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Abir Cherif',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
            onPressed: () => _viewCV(context),
            tooltip: 'View CV',
          ),
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            onPressed: () => _launchUrl(cvUrl, context),
            tooltip: 'Download CV',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade900],
                ),
              ),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Colors.blue),
              title: const Text('Experience'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: const Text('Education'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: Colors.blue),
              title: const Text('Contact'),
              onTap: () =>
                  _launchUrl('mailto:abircherif212@gmail.com', context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _launchUrl('mailto:abircherif212@gmail.com', context),
        backgroundColor: Colors.blue.shade700,
        child: const Icon(Icons.email),
        tooltip: 'Contact Me',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    ZoomIn(
                      child: const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/img.jpg'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Abir Cherif',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
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
                    Text(
                      'Monastir, Tunisia | abircherif212@gmail.com | +216 93649677',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white60,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _viewCV(context),
                          icon: const Icon(Icons.visibility),
                          label: const Text('View CV'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(cvUrl, context),
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
              padding: const EdgeInsets.all(24.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Professional Summary',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Dynamic and passionate Frontend Developer with nearly two years of experience building web and mobile applications. Proficient in Flutter, Dart, JavaScript, and PHP. Spearheaded a trip management app, reducing organization time by 30%. Eager to contribute to innovative projects in a collaborative environment, preferably in Europe.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Experience Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Professional Experience',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildExperienceCard(
                      'Mobile Developer',
                      'Continuous Net, Sousse, Tunisia',
                      'July 2023 - Present',
                      [
                        'Spearheaded development of a trip management app using Flutter and Dart, reducing organization time by 30% with real-time data updates.',
                        'Collaborated with backend team to integrate APIs in an Agile environment.',
                        'Conducted usability testing, improving user retention by 20%.',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      'Mobile Development Intern',
                      'Continuous Net, Sousse, Tunisia',
                      'Feb 2023 - June 2023',
                      [
                        'Developed and launched a mobile app using Flutter and Dart to manage organized trips, streamlining user processes.',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      'Web Development Intern',
                      'DRÄXLMAIER Group, Monastir, Tunisia',
                      'June 2022 - Aug 2022',
                      [
                        'Optimized a document archiving web app using PHP, reducing load times by 25%.',
                        'Enhanced user interface with HTML, CSS, JavaScript, and Laravel.',
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Education Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Education',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildEducationCard(
                      'Bachelor\'s Degree in Computer Engineering',
                      'École Nationale des Sciences de l\'Informatique (ENSI), Manouba, Tunisia',
                      'Jan 2020 - Jan 2023',
                    ),
                    const SizedBox(height: 16),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        'Flutter',
                        'Dart',
                        'JavaScript',
                        'PHP',
                        'HTML',
                        'CSS',
                        'CI/CD pipeline',
                        'Bootstrap',
                        'MySQL',
                        'Firebase',
                        'Git',
                        'GitLab',
                        'Agile/SCRUM'
                      ]
                          .map((skill) => Chip(
                                label: Text(
                                  skill,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: Colors.blue.shade100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                elevation: 2,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Languages Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Languages',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        'Arabic (Native)',
                        'English (Fluent)',
                        'French (Fluent)'
                      ]
                          .map((lang) => Chip(
                                label: Text(
                                  lang,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: Colors.blue.shade100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                elevation: 2,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Projects Released Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projects Released',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildProjectReleasedCard(
                      'Sunshine Vacances',
                      'A Flutter-based travel app for managing claims, accommodations, and transfers, using Firebase, HTTP, and REST APIs. Features real-time updates and notifications.',
                      'https://play.google.com/store/apps/details?id=com.zenify_client_app',
                      context,
                    ),
                    const SizedBox(height: 16),
                    _buildProjectReleasedCard(
                      'Tunisie Promo',
                      'A mobile app for discovering promotions in Tunisia, built with Flutter and published on Play Store.',
                      'https://play.google.com/store/search?q=tunisie%20promo&c=apps',
                      context,
                    ),
                  ],
                ),
              ),
            ),
            // Projects Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Projects',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildProjectCard(
                    title: 'Instagram Clone',
                    description:
                        'A Flutter app mimicking Instagram with Firebase authentication and feed functionality.',
                    url: 'https://github.com/abir739/Instagram-Clone',
                  ),
                  const SizedBox(height: 16),
                  _buildProjectCard(
                    title: 'Voyageur App',
                    description:
                        'A travel app for managing accommodations and transfers with real-time data.',
                    url: 'https://github.com/abir739/Voyageur_app',
                  ),
                  const SizedBox(height: 16),
                  _buildProjectCard(
                    title: 'Habit Tracker',
                    description:
                        'A Flutter app for tracking daily habits with Provider state management.',
                    url: 'https://github.com/abir739/Habit-Tracker-Flutter-app',
                  ),
                  const SizedBox(height: 16),
                  _buildProjectCard(
                    title: 'Guide App',
                    description:
                        'A tourist guide app with user profiles and notifications.',
                    url: 'https://github.com/abir739/Guide_app',
                  ),
                  const SizedBox(height: 16),
                  _buildProjectCard(
                    title: 'Quiz App',
                    description:
                        'A cross-platform quiz app with local storage and scoring system.',
                    url: 'https://github.com/abir739/Quiz_App',
                  ),
                  const SizedBox(height: 16),
                  _buildProjectCard(
                    title: 'Document Archiving Web App',
                    description:
                        'A PHP and Laravel-based web app for document management, optimized to reduce load times by 25%.',
                    url:
                        'https://github.com/abir739/Document_Archiving_Web_App',
                  ),
                ],
              ),
            ),
            // Contact Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade900, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    Text(
                      'Get in Touch',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(githubUrl, context),
                          icon: const Icon(Icons.code, size: 20),
                          label: const Text('GitHub'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue.shade900,
                            elevation: 2,
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(linkedinUrl, context),
                          icon: const Icon(Icons.link, size: 20),
                          label: const Text('LinkedIn'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue.shade900,
                            elevation: 2,
                          ),
                        ),
                        // const SizedBox(width: 12),
                        // ElevatedButton.icon(
                        //   onPressed: () => _launchUrl(portfolioUrl, context),
                        //   icon: const Icon(Icons.web, size: 20),
                        //   label: const Text('Portfolio'),
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.white,
                        //     foregroundColor: Colors.blue.shade900,
                        //     elevation: 2,
                        //   ),
                        // ),
                      ],
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

  Widget _buildExperienceCard(String title, String company, String duration,
      List<String> responsibilities) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
            Text(
              company,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              duration,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 12),
            ...responsibilities.map((resp) => Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_right,
                          size: 18, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          resp,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard(
      String degree, String institution, String duration) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              degree,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
            Text(
              institution,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              duration,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectReleasedCard(
      String title, String description, String url, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => _launchUrl(url, context),
              child: Text(
                'View on Store',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      {required String title,
      required String description,
      required String url}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => _launchUrl(url, context),
              child: Text(
                'View on GitHub',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CVViewerScreen extends StatelessWidget {
  final String cvUrl ;

  const CVViewerScreen({super.key, required this.cvUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View CV',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(cvUrl)),
      ),
    );
  }
}
