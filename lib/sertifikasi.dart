import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';


void main() {
  runApp(Sertifikasi());
}


class Sertifikasi extends StatefulWidget {
  @override
  SertifikasiState createState() => 
  SertifikasiState();
}

class SertifikasiState extends State<Sertifikasi> {
  final sampleUrl = 'https://drive.google.com/uc?export=download&id=15axYg0aQYKCyV91jmXzTRaMo-JUrM2Lt';

  String? pdfFlePath;

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Plugin example app'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Load pdf"),
                  onPressed: loadPdf,
                ),
                if (pdfFlePath != null)
                  Expanded(
                    child: Container(
                      child: PdfView(path: pdfFlePath!),
                    ),
                  )
                else
                  Text("Pdf is not Loaded"),
              ],
            ),
          ),
        );
      }),
    );
  }
}