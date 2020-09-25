import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';

class FAQs extends StatelessWidget {
  Widget build(BuildContext context) {
    //Size of the viewport
    Size size = MediaQuery.of(context).size;
    //StringCollection.createList();
    getFaqItems();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringCollection.title_,
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: 30,
            ),
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Column(
                      children: [
                        Container(
                            width: size.width * 0.9,
                            height: size.height * 0.05,
                            child: Text(StringCollection.faq,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: EdgeInsets.all(size.width * 0.05),
                            height: size.height * 0.78,
                            child: Column(children: [
                              Expanded(
                                  child: ListView.builder(
                                itemCount: StringCollection.questions.length,
                                itemBuilder: (BuildContext context, int index) {
                                  //print(index);
                                  //print(StringCollection.questions[index]);
                                  //print(StringCollection.answers[index]);

                                  return FAQItem(
                                      StringCollection.questions[index],
                                      StringCollection.answers[index]);
                                },
                              )),
                            ]))
                      ],
                    )))));
  }

  getFaqItems() async {
    await StringCollection.createList();
  }
}

// ignore: must_be_immutable
class FAQItem extends StatefulWidget {
  String answer = "";
  String question = "";

  FAQItem(String question, String answer) {
    this.answer = answer;
    this.question = question;
  }

  _FaqItem createState() => _FaqItem(question, answer);
}

class _FaqItem extends State<FAQItem> {
  String question = "";
  String answer = "";

  //To show/hide answer part
  bool bShowAnswer = false;

  _FaqItem(String question, String answer) {
    this.question = question;
    this.answer = answer;
  }

  Widget build(BuildContext context) {
    //Viewport Size
    Size size = MediaQuery.of(context).size;

    return  Container(

    width: size.width * 0.8,
    child: SingleChildScrollView(
          child: Column(
        children: [
          //Question
          Container(
              padding: EdgeInsets.all(size.width * 0.025),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(5.0)),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bShowAnswer = !bShowAnswer;
                    });
                  },
                  child: Container(
                      child: Row(children: [
                    Container(width: size.width * 0.7, child: Text(question)),
                    Container(
                      width: size.width * 0.01,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    )
                  ])))),
          //Padding
          SizedBox(height: size.height * 0.03),
          //Answer
          Visibility(
              visible: bShowAnswer,
              child: Container(
                  child: Column(children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      width: size.width * 0.1,
                      child: Text("Ans.",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                    width: size.width * 0.7,
                    child: Text(answer),
                  ),
                ]),
                SizedBox(height: size.height * 0.05)
              ]))),
        ],
      ),
    ),
        );

  }
}