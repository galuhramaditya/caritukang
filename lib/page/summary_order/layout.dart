import 'package:flutter/material.dart';

const horizontal_padding = 20.0;
const primary_color = Color(0xFF2E86DE);

class SummaryOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Service Descrition",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleSection(
              children: [
                Text("Detail Alamat"),
                Text("Ubah Alamat", style: TextStyle(color: primary_color)),
              ],
            ),
            Section(
              child: Row(
                children: [
                  Image.asset("images/map.png"),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Home", style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 5),
                        Text(
                          "25A, Jalan Danau Ranau, Sawojajar, K kemang",
                          style: TextStyle(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text("Tambah lantai / nomor"),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tambah catatan"),
                            Icon(Icons.edit, color: primary_color),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TitleSection(
              children: [
                Text("Detail Pesanan"),
              ],
            ),
            Section(
              title: "Detail",
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: ["Wall-Mounted Unit", "Mitsubishi Electric", "AC bermasalah", "Tidak dingin"]
                      .map(
                        (e) => Row(
                          children: [
                            Text("\u2022", style: TextStyle(fontSize: 20, color: Colors.grey)),
                            SizedBox(width: 5),
                            Text(e),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Divider(color: Colors.grey),
            Section(
              title: "Diagnosa",
              child: Text("Onsite consultation will diagnose the problem for troubleshooting accordingly. The scope will depend on the repair works necessary"),
            ),
            Divider(color: Colors.grey),
            Section(
              title: "Jumlah Pekerja",
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    FlatButton(onPressed: () {}, child: Icon(Icons.add)),
                    VerticalDivider(color: Colors.grey, thickness: 1),
                    Expanded(child: Text("1", textAlign: TextAlign.center)),
                    VerticalDivider(color: Colors.grey, thickness: 1),
                    FlatButton(onPressed: () {}, child: Icon(Icons.remove)),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey),
            Section(
              title: "Deskripsi",
              child: Row(
                children: [
                  Text("Tambah deskripsi"),
                  SizedBox(width: 10),
                  Icon(Icons.edit, color: primary_color),
                ],
              ),
            ),
            Section(
              child: FlatButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        title: Center(child: Text('Cari berdasarkan')),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed("/payment");
                                },
                                child: Text("Sistem"),
                                minWidth: double.infinity,
                              ),
                              Divider(color: Colors.grey),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed("/payment");
                                },
                                child: Text("ID Mitra"),
                                minWidth: double.infinity,
                              ),
                              Divider(color: Colors.grey),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                color: Color(0xFF2E86DE),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                height: 50,
                minWidth: double.infinity,
                child: Text("Pesan Sekarang", style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    Key key,
    @required this.child,
    this.title,
  }) : super(key: key);

  final child;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: horizontal_padding, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null ? Text(title, style: TextStyle(fontWeight: FontWeight.w700)) : SizedBox(),
          title != null ? SizedBox(height: 20) : SizedBox(),
          child,
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal_padding, vertical: 10),
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
