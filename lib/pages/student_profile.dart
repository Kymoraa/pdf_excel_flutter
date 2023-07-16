import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf_excel_flutter/constants/colors.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({
    super.key,
    required this.studentName,
    required this.studentReg,
    required this.studentImage,
    required this.studentResults,
  });

  final String studentName;
  final String studentReg;
  final String studentImage;
  final Map studentResults;

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: AppColors.whiteColor,
        toolbarHeight: 60,
        title: Text(
          widget.studentName,
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  minRadius: 35.0,
                  backgroundImage: AssetImage(widget.studentImage),
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      widget.studentName,
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.studentReg,
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'Subject',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Marks',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Grade',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              rows: [
                // maths
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Maths',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Maths'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Maths'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // english
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'English',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['English'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['English'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // kiswahili
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Kiswahili',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Kiswahili'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Kiswahili'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // physics
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Physics',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Physics'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Physics'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // biology
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Biology',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Biology'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Biology'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // chemistry
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Chemistry',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Chemistry'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Chemistry'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // geography
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Geography',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Geography'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Geography'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // spanish
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Spanish',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Spanish'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Spanish'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Grand Total: ${widget.studentResults['Total'][0]}',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  'Mean Grade: ${widget.studentResults['Total'][1]}',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _pdfFAB(),
    );
  }

  Widget _pdfFAB() {
    return FloatingActionButton(
      onPressed: () {
        downloadPDFDialog(context);
      },
      backgroundColor: AppColors.redColor,
      child: const Icon(
        CupertinoIcons.tray_arrow_down,
        color: AppColors.whiteColor,
      ),
    );
  }

  void downloadPDFDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('You are about to generate the report form for ${widget.studentName}. Proceed?'),
        //content: const Text('Proceed?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              generateAndSavePDF();
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> generateAndSavePDF() async {
    final image = await imageFromAssetBundle('assets/logos/school-logo.png'); // import 'package:printing/printing.dart'
    final doc = pw.Document(); // import 'package:pdf/widgets.dart' as pw
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(18.00),
            child: pw.Column(
              children: [
                pw.Align(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Image(image, width: 100, height: 100), // our school logo for the official PDF
                ),
                pw.Text(
                  'Jackie & Co. Secondary School',
                  style: const pw.TextStyle(fontSize: 17.00),
                ),
                pw.SizedBox(height: 10.00),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Name: ${widget.studentName}',
                        style: const pw.TextStyle(fontSize: 15.00),
                      ),
                      pw.Text(
                        'Form 4 West',
                        style: const pw.TextStyle(fontSize: 15.00),
                      ),
                    ],
                  ),
                ),
                pw.Divider(),
                pw.SizedBox(height: 15.00),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Subject',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.SizedBox(height: 5.00),
                        pw.Text(
                          'Maths',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'English',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Kiswahili',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Physics',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Biology',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Chemistry',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Geography',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Spanish',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Marks',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.SizedBox(height: 5.00),
                        pw.Text(
                          widget.studentResults['Maths'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['English'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Kiswahili'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Physics'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Biology'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Chemistry'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Geography'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Spanish'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Grade',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.SizedBox(height: 5.00),
                        pw.Text(
                          widget.studentResults['Maths'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['English'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Kiswahili'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Physics'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Biology'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Chemistry'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Geography'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Spanish'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 30.00),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'Grand Total: ${widget.studentResults['Total'][0]}',
                    ),
                    pw.SizedBox(width: 15),
                    pw.Text(
                      'Mean Grade: ${widget.studentResults['Total'][1]}',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }
}
