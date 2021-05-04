import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CategorySectionWidget extends StatelessWidget {
  const CategorySectionWidget({
    Key key,
  }) : super(key: key);

  static const category = ["Umum", "Kelistrikan", "AC", "Pipa", "Konstruksi", "Keamanan", "Design", "Perkebunan"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Category", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200], width: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 4 / 5,
              children: category.map((e) => CategoryItem(title: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key, this.title}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showMaterialModalBottomSheet(
              enableDrag: true,
              bounce: true,
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => SheetQuestionnare1Widget(),
            );
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Color(0xFF6485DA), Color(0xFFAABBE5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        FittedBox(
          child: Text(title, maxLines: 2, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

class SheetQuestionnare1Widget extends StatelessWidget {
  const SheetQuestionnare1Widget({
    Key key,
  }) : super(key: key);

  static const question = ["ceiling cassette", "Portable Aircon / Floor Standing", "Wall-Mounted Unit"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: QuestionerWidget(
        question: "Tipe AC apa yang anda punya?",
        onPressed: () {
          Navigator.of(context).pop();
          showMaterialModalBottomSheet(
            enableDrag: true,
            bounce: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => SheetQuestionnare2Widget(),
          );
        },
        option: Column(
          children: question
              .asMap()
              .entries
              .map((e) => RadioListTile(
                    value: e.key,
                    groupValue: question,
                    onChanged: (o) {},
                    title: Text(e.value),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class SheetQuestionnare2Widget extends StatelessWidget {
  const SheetQuestionnare2Widget({
    Key key,
  }) : super(key: key);

  static const question = [
    "Carrier",
    "Samsung",
    "Daikin",
    "LG",
    "Electrolux",
    "Panasonic",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: QuestionerWidget(
        question: "Merk AC?",
        onPressed: () {
          Navigator.of(context).pop();
          showMaterialModalBottomSheet(
            enableDrag: true,
            bounce: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => SheetQuestionnare3Widget(),
          );
        },
        option: Container(
          width: double.infinity,
          height: 200,
          child: GridView.count(
            childAspectRatio: 3 / 1,
            crossAxisCount: 2,
            children: question
                .asMap()
                .entries
                .map((e) => RadioListTile(
                      value: e.key,
                      groupValue: question,
                      onChanged: (o) {},
                      title: Text(e.value),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class SheetQuestionnare3Widget extends StatelessWidget {
  const SheetQuestionnare3Widget({
    Key key,
  }) : super(key: key);

  static const question = [
    "Saya mempunyai masalah dengan AC saya",
    "Saya hendak service tahunan",
    "Saya hendak service rutin standar",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: QuestionerWidget(
        question: "Apa yang dapat kami bantu?",
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("/summary-order");
        },
        option: Column(
          children: question
              .asMap()
              .entries
              .map((e) => RadioListTile(
                    value: e.key,
                    groupValue: question,
                    onChanged: (o) {},
                    title: Text(e.value),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class QuestionerWidget extends StatelessWidget {
  const QuestionerWidget({
    Key key,
    @required this.question,
    @required this.option,
    @required this.onPressed,
  }) : super(key: key);

  final String question;
  final Widget option;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Column(
        children: [
          Divider(
            color: Colors.grey,
            indent: 125,
            endIndent: 125,
            thickness: 2,
          ),
          SizedBox(height: 20),
          Text("Kuisioner", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 20),
          Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          option,
          SizedBox(height: 20),
          FlatButton(
            onPressed: onPressed,
            color: Color(0xFF2E86DE),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 50,
            minWidth: double.infinity,
            child: Text("Next", style: TextStyle(fontSize: 20, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
