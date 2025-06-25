import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'dart:html' as html;

class PdfViewerPage extends StatelessWidget {
  final String assetPath;
  const PdfViewerPage({required this.assetPath, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PdfControllerPinch(
      document: PdfDocument.openAsset(assetPath),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              html.window.open('assets/pdf/Abeer_Cherif_cv.pdf', '_blank');
            },
            backgroundColor: Colors.blue.shade700,
            tooltip: 'Open in new tab',
            child: const Icon(Icons.open_in_new),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              html.AnchorElement anchor =
                  html.AnchorElement(href: 'assets/pdf/Abeer_Cherif_cv.pdf')
                    ..setAttribute('download', 'Abir_Cherif_CV.pdf')
                    ..click();
            },
            backgroundColor: Colors.blue.shade700,
            tooltip: 'Download CV',
            child: const Icon(Icons.download),
          ),
        ],
      ),
      body: PdfViewPinch(
        controller: controller,
      ),
    );
  }
}
