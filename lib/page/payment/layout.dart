import 'package:flutter/material.dart';

const horizontal_padding = 20.0;
const primary_color = Color(0xFF2E86DE);

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Pembayaran",
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
                        Text(""),
                        SizedBox(height: 5),
                        Text(""),
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
              title: "Jumlah Pekerja",
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "Membutuhkan"),
                    TextSpan(text: " 2 ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: "pekerja"),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey),
            Section(
              title: "Durasi",
              child: Text("02:30:59"),
            ),
            Divider(color: Colors.grey),
            Section(title: "Deskripsi"),
            Divider(color: Colors.grey),
            Section(
              title: "Detail",
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ["Isi freon", "55,000"],
                    ["Membersihkan condenser AC", "15,000"]
                  ]
                      .map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e[0]),
                            SizedBox(width: 5),
                            Text("Rp. ${e[1]}", style: TextStyle(color: primary_color)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Divider(color: Colors.grey),
            Section(
              title: "Metode Pembayaran",
              child: Row(
                children: [
                  Container(
                    width: 65,
                    height: 25,
                    child: OutlineButton(
                      onPressed: () {},
                      child: Text("OVO", style: TextStyle(color: Theme.of(context).accentColor)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("Rp. 150,000"),
                ],
              ),
            ),
            Divider(color: Colors.grey[200], thickness: 5),
            Section(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 30)),
                  Text("Rp. 70,000", style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor)),
                ],
              ),
            ),
            Section(
              child: FlatButton(
                onPressed: () {},
                color: Color(0xFF2E86DE),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                height: 50,
                minWidth: double.infinity,
                child: Text("Bayar Sekarang", style: TextStyle(fontSize: 20, color: Colors.white)),
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
    this.child,
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
          child != null ? child : Text(""),
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
