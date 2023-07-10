import 'dart:convert';

// import 'package:cek_rekening/bank_model.dart';
import 'package:cek_rekening/bank_model.dart';
import 'package:cek_rekening/hasil_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Bank_model? bankData;
  Hasil_model? hasilData;
  bool isSuccess = false;
  var idBank, bankAccountNumber;

  @override
  void initState() {
    super.initState();
    fetchDataBank();
  }

  Future<void> fetchDataBank() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://proxy.cors.sh/https://cekrekening.id/master/bank?enablePage=0'),
          headers: {
            'x-cors-api-key': 'temp_3deea5aa97ca4319c894ab1b223cfc3f',
          });
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          bankData = Bank_model.fromJson(jsonData);
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API request: $e');
    }
  }

  Future<void> fetchDataRekening(idBank, noRek) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://proxy.cors.sh/https://cekrekening.id/master/cekrekening/report'),
        headers: {
          'Content-Type': 'application/json',
          'x-cors-api-key': 'temp_3deea5aa97ca4319c894ab1b223cfc3f',
        },
        body: jsonEncode(
          {"bankId": idBank, "bankAccountNumber": noRek},
        ),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          hasilData = Hasil_model.fromJson(jsonData);
          isSuccess = true;
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // print('Error during API request: $e');
      debugPrint('Error during API request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Center(
                    child: Text(
                      "CEK REKENING",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.045,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 0, 0),
                        wordSpacing: 5,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "data by KOMINFO (cekrekening.id)",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 0, 0),
                        wordSpacing: 5,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Center(
                    child: Text(
                      "Pilih Bank :",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 0, 0),
                        wordSpacing: 5,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.16,
                    child: DropdownButtonFormField<String>(
                      value: idBank,
                      items: bankData?.data?.content?.map((option) {
                        return DropdownMenuItem<String>(
                          value: option.id.toString(),
                          child: Text(option.bankName!),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          idBank = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Pilih Bank',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  Center(
                    child: Text(
                      "Masukkan No Rekening :",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 0, 0),
                        wordSpacing: 5,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.16,
                    child: TextField(
                      //input hanya angka
                      keyboardType: TextInputType.number,

                      onChanged: (text) {
                        bankAccountNumber = text;
                      },
                    ),
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () async {
                      // print(idBank);
                      // print(bankAccountNumber);
                      fetchDataRekening(idBank, bankAccountNumber);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5.0), // Atur nilai sesuai kebutuhan
                      side: BorderSide(
                          color: Colors.black,
                          width: 1.0), // Atur warna dan lebar sesuai kebutuhan
                    ),
                    child: Container(
                      width: width * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.print,
                            size: width * 0.03,
                          ),
                          SizedBox(
                            width: width * 0.007,
                          ),
                          Text(
                            'Cek Rekening',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isSuccess
                ? Container(
                    child: Column(
                      children: [
                        Text(
                          "Hasil : ",
                          style: GoogleFonts.roboto(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 3, 0, 0),
                            wordSpacing: 5,
                            letterSpacing: 2,
                          ),
                        ),
                        hasilData!.data!.laporanDetail!.length > 0
                            ? Container(
                                margin: EdgeInsets.only(bottom: width * 0.007),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Data Ditemukan",
                                        style: GoogleFonts.roboto(
                                          fontSize: height * 0.025,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 2, 161, 10),
                                          wordSpacing: 5,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: width * 0.3,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: 1.0,
                                        ),
                                      ),
                                    ),
                                    rowData(
                                        "Nama Bank ",
                                        hasilData!
                                            .data!.laporan!.bank!.bankName!,
                                        width,
                                        height),
                                    rowData(
                                        "Nomor Rekening ",
                                        hasilData!.data!.laporan!.accountNo!,
                                        width,
                                        height),
                                    rowData(
                                        "Nama Rekening ",
                                        hasilData!.data!.laporan!.accountName!,
                                        width,
                                        height),
                                    rowData(
                                        "Kategori Aduan ",
                                        hasilData!.data!.laporan!.kategoriAduan!
                                            .deskripsi!,
                                        width,
                                        height),
                                    rowData(
                                        "Status ",
                                        hasilData!.data!.laporan!.status!
                                            .description!,
                                        width,
                                        height),
                                    rowData(
                                        "Detail Laporan ", " ", width, height),
                                    Table(
                                      border: TableBorder.all(),
                                      columnWidths: {
                                        0: FlexColumnWidth(10),
                                        1: FlexColumnWidth(width * 0.03),
                                        2: FlexColumnWidth(width * 0.04),
                                        3: FlexColumnWidth(width * 0.04),
                                        4: FlexColumnWidth(width * 0.05),
                                        5: FlexColumnWidth(width * 0.05),
                                        6: FlexColumnWidth(width * 0.15),
                                        7: FlexColumnWidth(width * 0.03),
                                        8: FlexColumnWidth(width * 0.06),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[
                                                300], // Set background color for header row
                                          ),
                                          children: [
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'no',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        16, // Adjust the font size
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Status',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        16, // Adjust the font size
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Pelapor',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        16, // Adjust the font size
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Add other header cells with adjusted styles
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Tipe Aduan',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        16, // Adjust the font size
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Kategori Aduan',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        16, // Adjust the font size
                                                  ),
                                                ),
                                              ),
                                            ),

                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Tanggal Aduan',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Kronologi',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Platform',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(
                                                  'Status Laporan',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        for (var data
                                            in hasilData!.data!.laporanDetail!)
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    '*',
                                                    style: TextStyle(
                                                      fontSize:
                                                          12, // Adjust the font size
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.laporanId!.status!
                                                        .description!,
                                                    style: TextStyle(
                                                      fontSize:
                                                          12, // Adjust the font size
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.reporterEmail!,
                                                    style: TextStyle(
                                                      fontSize:
                                                          12, // Adjust the font size
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Add other header cells with adjusted styles
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.tipeAduan!
                                                        .description!,
                                                    style: TextStyle(
                                                      fontSize:
                                                          12, // Adjust the font size
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.kategoriAduan!
                                                        .deskripsi!,
                                                    style: TextStyle(
                                                      fontSize:
                                                          12, // Adjust the font size
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              tableCellKhusus(
                                                  data.laporanDate!),
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.chronology!,
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.sumberMedia!
                                                        .description!,
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(
                                                    data.remarks!,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Text("Data Tidak Ditemukan")
                      ],
                    ),
                  )
                : Text("-")
          ],
        ),
      ),
    );
  }
}

Widget rowData(title, data, width, height) {
  return Row(
    children: [
      SizedBox(
        width: width * 0.1,
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: height * 0.025,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      SizedBox(
        width: 10,
        child: Text(" : "),
      ),
      SizedBox(
        child: Text(
          data,
          style: GoogleFonts.roboto(
            fontSize: height * 0.025,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    ],
  );
}

Widget tableCellKhusus(time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

  return TableCell(
    child: Center(
      child: Text(
        formattedDate,
      ),
    ),
  );
}
