import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf_excel_flutter/constants/colors.dart';
import 'package:pdf_excel_flutter/data/results.dart';
import 'package:pdf_excel_flutter/pages/student_profile.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List results = Results.results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        title: Text(
          'All Students',
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
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: results.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (_) => StudentProfile(
                      studentName: results[index][0],
                      studentReg: results[index][1],
                      studentImage: results[index][2],
                      studentResults: results[index][3],
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(results[index][2]),
                ),
                title: Text(
                  results[index][0],
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  results[index][1],
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
      floatingActionButton: _excelFAB(),
    );
  }

  Widget _excelFAB() {
    return FloatingActionButton(
      onPressed: () {
        downloadExcelDialog(context);
      },
      backgroundColor: AppColors.greenColor,
      child: const Icon(
        CupertinoIcons.tray_arrow_down,
        color: Colors.white,
      ),
    );
  }

  void downloadExcelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('You are about to download the results excel sheet. Proceed?'),
        //content: const Text('Proceed?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              generateAndSaveExcel();
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> generateAndSaveExcel() async {
    final xcel.Workbook workbook = xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[0]; // the sheet we will be populating (only the first sheet)
    const String excelFile = 'test_download'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(1, 1).setText('All Students');
    sheet.getRangeByIndex(2, 1).setText('Form 4 West'); // example class
    sheet.getRangeByIndex(4, 1).setText('Student Name');

    // set the titles for the subject results we want to fetch
    sheet.getRangeByIndex(4, 2).setText('Maths');
    sheet.getRangeByIndex(4, 3).setText('English');
    sheet.getRangeByIndex(4, 4).setText('Kiswahili');
    sheet.getRangeByIndex(4, 5).setText('Physics');
    sheet.getRangeByIndex(4, 6).setText('Biology');
    sheet.getRangeByIndex(4, 7).setText('Chemistry');
    sheet.getRangeByIndex(4, 8).setText('Geography');
    sheet.getRangeByIndex(4, 9).setText('Spanish');
    sheet.getRangeByIndex(4, 10).setText('Total');

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < results.length; i++) {
      sheet.getRangeByIndex(i + 5, 1).setText(results[i][0]);
      sheet.getRangeByIndex(i + 5, 2).setText(results[i][3]['Maths'][0].toString());
      sheet.getRangeByIndex(i + 5, 3).setText(results[i][3]['English'][0].toString());
      sheet.getRangeByIndex(i + 5, 4).setText(results[i][3]['Kiswahili'][0].toString());
      sheet.getRangeByIndex(i + 5, 5).setText(results[i][3]['Physics'][0].toString());
      sheet.getRangeByIndex(i + 5, 6).setText(results[i][3]['Biology'][0].toString());
      sheet.getRangeByIndex(i + 5, 7).setText(results[i][3]['Chemistry'][0].toString());
      sheet.getRangeByIndex(i + 5, 8).setText(results[i][3]['Geography'][0].toString());
      sheet.getRangeByIndex(i + 5, 9).setText(results[i][3]['Spanish'][0].toString());
      sheet.getRangeByIndex(i + 5, 10).setText(results[i][3]['Total'][0].toString());
    }

    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();
    File('/storage/emulated/0/Download/$excelFile.xlsx').writeAsBytes(bytes);

    // toast message to user
    Fluttertoast.showToast(
      msg: 'Excel file successfully downloaded',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.whiteColor,
    );

    //dispose the workbook
    workbook.dispose();
  }
}
