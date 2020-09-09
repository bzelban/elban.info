import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

// ignore: must_be_immutable
class MyAppState extends State<MyApp> {
  int selected;

  @override
  void initState() {
    super.initState();
    selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      //EmptyWidget(),
      LogoWidget(),
      AboutMeWidget(),
      //ResumeWidget(),
      TestResumeWidget(),
      WorksWidget(),
    ];

    return MaterialApp(
      title: 'Bedirhan .Z ELBAN',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wiggle.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  ScaleTransition(scale: animation, child: body[selected]),
              child: body[selected],
            ),
          ),
        ),
        floatingActionButton: SpeedDialWidget(),
      ),
    );
  }

//------------ Empty Widget
  // ignore: non_constant_identifier_names
  Widget EmptyWidget() {
    return Container();
  }
////////////////////////////////////////////////////////////////////////////////

//------------ Logo Widget
  Widget LogoWidget() {
    return Container(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.height - 550,
          height: MediaQuery.of(context).size.height - 550,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: new BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            shape: BoxShape.circle,
          ),
          child: new Image.asset(
            "assets/icon.png",
            scale: 1,
          ),
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////

//------------ AboutMe Widget
  // ignore: non_constant_identifier_names
  Widget AboutMeWidget() {
    return Container(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 130),
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
          ),
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                text: "         Hi! I'm Bedirhan.",
                style: TextStyle(color: Colors.white, fontSize: 30),
                children: <TextSpan>[
                  TextSpan(text: '\n\n\n'),
                  TextSpan(
                    text: "  Born in Germany. I'm an undergraduate",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Software Engineering",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " student and self-taught",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Computer Vision",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Sound Generation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " & ",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Mobile Developer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ". I'm primarily focused on and experienced about",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Python",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " C",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " C++",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " & ",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: "Dart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " languages. I also have application experience with",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Java",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " MATLAB",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: " BASH",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text: "\n\n",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  TextSpan(
                    text:
                        "  Nowadays I'm working on my own FM_Synthesis and Decentralized Mobile App models while I'm studying.",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////

//------------ Resume Widget
  // ignore: non_constant_identifier_names
  Widget ResumeWidget() {
    final pdfController = PdfController(
      document: PdfDocument.openAsset("assets/lorem-ipsum.pdf"),
    );

    return Container(
      child: Center(
        child: new Container(
          width: MediaQuery.of(context).size.width - 60,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 130),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
          ),
          child: PdfView(
            controller: pdfController,
          ),
        ),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////

//------------ testResume Widget
  Widget TestResumeWidget() {
    final pdfController = PdfController(
      document: PdfDocument.openAsset("assets/lorem-ipsum.pdf"),
    );

    return Container(
        child: PdfView(
      controller: pdfController,
    ));
  }
////////////////////////////////////////////////////////////////////////////////

//------------ Works Widget
  // ignore: non_constant_identifier_names
  Widget WorksWidget() {
    return Container(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 130),
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
          ),
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        '\nNative Mobile App Style Interactive Landing Page (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text: '\n\nVigdis, The FM Synthesis (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nMusic and Computers, Synthesis and Analysis Examples  (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nIntense App Brewery, Multiple Cross-Platorm Apps (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nVirus Tracking App, Java Software Architecture Project (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nGiant Step to Quality Software: Clean Code, Article (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nExam Management System, Java Software Verification and Validation Project (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nLimus App, Yaşar University Incubation Project, Passed BIGG, killed by Covid-19 (2020)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text: '\n\nMachine Learning Examples with Python (2019)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  TextSpan(
                    text:
                        '\n\nEnergy Efficiency Presentation & Article, Tracking & Optimizing with AI (2019)',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////

//----------- Speed Dial Widget
  // ignore: non_constant_identifier_names
  Widget SpeedDialWidget() {
    return SpeedDial(
      tooltip: 'Navigation',
      marginRight: MediaQuery.of(context).size.width / 2 - 35,
      marginBottom: 35,
      overlayColor: Colors.black,
      backgroundColor: Colors.black,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 35.0),
      children: [
        SpeedDialChild(
          child: Icon(Icons.fingerprint),
          label: "About Me",
          labelStyle: TextStyle(fontSize: 25.0),
          onTap: () {
            if (selected != 1) {
              setState(() {
                selected = 1;
              });
            }
            print(selected);
          },
          backgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: Icon(Icons.attach_file),
          label: "Resume",
          labelStyle: TextStyle(fontSize: 22.0),
          onTap: () {
            if (selected != 2) {
              setState(() {
                selected = 2;
              });
            }
            print(selected);
          },
          backgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: Icon(Icons.visibility),
          label: "Works",
          labelStyle: TextStyle(fontSize: 19.0),
          onTap: () {
            if (selected != 3) {
              setState(() {
                selected = 3;
              });
            }
            print(selected);
          },
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////////
}
