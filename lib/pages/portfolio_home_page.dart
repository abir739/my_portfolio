import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio_app/pages/pdf_view_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:parallax_animation/parallax_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

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
  final String cvPath = "assets/pdf/Abeer_Cherif_cv.pdf";
  final ScrollController _scrollController = ScrollController();

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

  void _scrollToSection(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PdfViewerPage(assetPath: cvPath),
                ),
              );
            },
            tooltip: 'View CV',
          ),
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
             onPressed: () {
          html.AnchorElement anchor = html.AnchorElement(href: 'assets/pdf/Abeer_Cherif_cv.pdf')
            ..setAttribute('download', 'Abir_Cherif_CV.pdf')
            ..click();
        },
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
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Colors.blue),
              title: const Text('Experience'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(600);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: const Text('Education'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(1200);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.blue),
              title: const Text('Certifications'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(1800);
              },
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                _launchUrl('mailto:abircherif212@gmail.com', context),
            backgroundColor: Colors.blue.shade700,
            child: const Icon(Icons.email),
            tooltip: 'Contact Me',
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _scrollToSection(0),
            backgroundColor: Colors.blue.shade700,
            child: const Icon(Icons.arrow_upward),
            tooltip: 'Back to Top',
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section with Parallax
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ParallaxArea(
                child: ParallaxWidget(
                  child: FadeInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ZoomIn(
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage:
                                const AssetImage('assets/images/img.jpg'),
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Abir Cherif',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Mobile Developer | Flutter Expert',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
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
                            ElasticIn(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          PdfViewerPage(assetPath: cvPath),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.visibility),
                                label: const Text('View CV'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElasticIn(
                              child: ElevatedButton.icon(
                                onPressed: () {
          html.AnchorElement anchor = html.AnchorElement(href: 'assets/pdf/Abeer_Cherif_cv.pdf')
            ..setAttribute('download', 'Abir_Cherif_CV.pdf')
            ..click();
        },
                                icon: const Icon(Icons.download),
                                label: const Text('Download CV'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                      'Dynamic and passionate Mobile Developer with over two years of experience building scalable web and mobile applications. Expert in Flutter, Dart, JavaScript, and Firebase, with a proven track record of delivering a trip management app that reduced organization time by 30%. Skilled in Agile methodologies and CI/CD pipelines, seeking to contribute to innovative projects in Europe.',
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
                        'Led development of a trip management app using Flutter and Dart, reducing organization time by 30% with real-time data updates and Firebase integration.',
                        'Collaborated with backend teams to integrate REST APIs in an Agile environment, ensuring seamless data flow.',
                        'Conducted usability testing and A/B testing, improving user retention by 20%.',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      'Mobile Development Intern',
                      'Continuous Net, Sousse, Tunisia',
                      'Feb 2023 - June 2023',
                      [
                        'Developed and launched a mobile app using Flutter and Dart for organized trips, streamlining user workflows by 15%.',
                        'Implemented Firebase notifications for real-time updates.',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      'Web Development Intern',
                      'DRÄXLMAIER Group, Monastir, Tunisia',
                      'June 2022 - Aug 2022',
                      [
                        'Optimized a document archiving web app using PHP and Laravel, reducing load times by 25%.',
                        'Enhanced UI with HTML, CSS, JavaScript, and Bootstrap for better usability.',
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
            // Certifications Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Certifications',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCertificationCard(
                      'Flutter & Dart - The Complete Guide',
                      'Udemy',
                      '2023',
                      'Mastered Flutter development and state management.',
                    ),
                    const SizedBox(height: 16),
                    _buildCertificationCard(
                      'Agile with Scrum',
                      'Coursera',
                      '2022',
                      'Learned Agile methodologies and Scrum practices.',
                    ),
                  ],
                ),
              ),
            ),
            // Skills Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInLeft(
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
                        'CI/CD Pipeline',
                        'Bootstrap',
                        'MySQL',
                        'Firebase',
                        'Git',
                        'GitLab',
                        'Agile/SCRUM',
                        'REST APIs',
                        'State Management (Provider, Riverpod)',
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
              child: FadeInRight(
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
                        'French (Fluent)',
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
                      'A Flutter-based travel app for managing claims, accommodations, and transfers, using Firebase, HTTP, and REST APIs. Over 10,000 downloads on Play Store.',
                      'https://play.google.com/store/apps/details?id=com.zenify_client_app',
                      context,
                      image: 'assets/images/sunshine.png',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectReleasedCard(
                      'Tunisie Promo',
                      'A mobile app for discovering promotions in Tunisia, built with Flutter and integrated with Firebase. Published on Play Store with 5,000+ downloads.',
                      'https://play.google.com/store/search?q=tunisie%20promo&c=apps',
                      context,
                      image: 'assets/images/tunisie_promo.png',
                    ),
                  ],
                ),
              ),
            ),
            // Projects Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
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
                          'A Flutter app mimicking Instagram with Firebase authentication, feed, and chat functionality.',
                      url: 'https://github.com/abir739/Instagram-Clone',
                      image: 'assets/images/instagram_clone.png',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectCard(
                      title: 'Voyageur App',
                      description:
                          'A travel app for managing accommodations and transfers with real-time data and Firebase integration.',
                      url: 'https://github.com/abir739/Voyageur_app',
                      image: 'assets/images/voyageur.png',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectCard(
                      title: 'Habit Tracker',
                      description:
                          'A Flutter app for tracking daily habits with Provider state management and local storage.',
                      url:
                          'https://github.com/abir739/Habit-Tracker-Flutter-app',
                      image: 'assets/images/habit_tracker.png',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectCard(
                      title: 'Guide App',
                      description:
                          'A tourist guide app with user profiles, notifications, and offline support.',
                      url: 'https://github.com/abir739/Guide_app',
                      image: 'assets/images/guide_app.png',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectCard(
                      title: 'Quiz App',
                      description:
                          'A cross-platform quiz app with local storage, scoring, and dynamic question loading.',
                      url: 'https://github.com/abir739/Quiz_App',
                      image: 'assets/images/quiz_app.png',
                    ),
                    // const SizedBox(height: 16),
                    // _buildProjectCard(
                    //   title: 'Document Archiving Web App',
                    //   description:
                    //       'A PHP and Laravel-based web app for document management, optimized to reduce load times by 25%.',
                    //   url:
                    //       'https://github.com/abir739/Document_Archiving_Web_App',
                    //   image: 'assets/images/document_app.png',
                    // ),
                  ],
                ),
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
                        ElasticIn(
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(githubUrl, context),
                            icon: const Icon(Icons.code, size: 20),
                            label: const Text('GitHub'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.shade900,
                              elevation: 2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElasticIn(
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(linkedinUrl, context),
                            icon: const Icon(Icons.link, size: 20),
                            label: const Text('LinkedIn'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.shade900,
                              elevation: 2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElasticIn(
                          child: ElevatedButton.icon(
                            onPressed: () => {},
                            icon: const Icon(Icons.download, size: 20),
                            label: const Text('Download CV'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.shade900,
                              elevation: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Download my portfolio as a PDF to include with your job applications:',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(
                          'https://your-cloud-hosted-portfolio-url.com/portfolio.pdf',
                          context), // Replace with actual portfolio PDF URL
                      icon: const Icon(Icons.download),
                      label: const Text('Download Portfolio'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade900,
                        elevation: 2,
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

  Widget _buildExperienceCard(String title, String company, String duration,
      List<String> responsibilities) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: Card(
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
      ),
    );
  }

  Widget _buildEducationCard(
      String degree, String institution, String duration) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: Card(
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
      ),
    );
  }

  Widget _buildCertificationCard(
      String title, String issuer, String year, String description) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: Card(
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
                '$issuer, $year',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade600,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectReleasedCard(
      String title, String description, String url, BuildContext context,
      {String? image}) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              if (image != null) const SizedBox(width: 16),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      {required String title,
      required String description,
      required String url,
      String? image}) {
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              if (image != null) const SizedBox(width: 16),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}
