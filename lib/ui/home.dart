import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:framework_flutter/model/question.dart';
import 'package:framework_flutter/util/hexcolor.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("Umwami wa mbere yatwaye Uburundi ni Ntare Rugamba.", false),
    Question.name("Uburundi bwikukiye itariki 1 myandagaro 1962.", true),
    Question.name(
        "Incungu yo kwikukira k'uburundi ni Melchior NDADAYE.", false),
    Question.name("Igihugu ca mbere ca kolonije Uburundi ni Ububirigi.", false),
    Question.name("Uburundi bwakoronijwe n'ibihugu 4.", false),
    Question.name("Incungu ya demokarasi ni Melchiol Ndandaye.", true),
    Question.name("Abakuru b'ibihugu bamaze gutwara Uburundi ni 7.", false),
    Question.name("Uburundi bugizwe n'intara 18.", true),
    Question.name("Umurwa mukuru w'uburundi ni Ngozi", false),
    Question.name("Ururimi rukoreshwa cane mu Burundi n'ikirundi", true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barundi Barundikazi"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.greenAccent,

      // we use (Builder) here to use a (context) that is a descendent of (Scaffold)
      // or else [scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "build/images/index.png",
                  //Image(
                  //image: AssetImage("build/images/index.png"),

                  width: 200,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.orange.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(fontSize: 16.9, color: Colors.black),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /*
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),

                   */
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "EGO",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "OYA",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Wagitoye"));
      Scaffold.of(context).showSnackBar(snackbar);

      //setState(() {
      //_currentQuestionIndex++;
      //});
    } else {
      //debugPrint("Incorrect!");
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Cakunaniye"));
      Scaffold.of(context).showSnackBar(snackbar);
      //_updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
/*
  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
 */
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Total Per Person",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: _purple),
                      ),
                    ),
                    Text(
                      " \$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                      style: TextStyle(
                          fontSize: 34.9,
                          fontWeight: FontWeight.bold,
                          color: _purple),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: _purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            color: _purple,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 10, //optional
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      // no go!
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "J'ai appris que le courage n'est pas l'absence de peur, mais la capacité de la vaincre.",
    "Je ne perds jamais. Soit je gagne, soit j'apprends.",
    "Cela semble toujours impossible, jusqu'à ce qu'on le fasse.",
    "Être libre, ce n'est pas seulement se débarrasser de ses chaînes ; c'est vivre d'une façon qui respecte et renforce la liberté des autres.",
    "La plus grande gloire n’est pas de ne jamais tomber, mais de se relever à chaque chute.",
    "Aucun de nous, en agissant seul, ne peut atteindre le succès.",
    "Pour faire la paix avec un ennemi, on doit travailler avec cet ennemi, et cet ennemi devient votre associé.",
    "Un gagnant est juste un rêveur qui n'a jamais cédé.",
    ". Être amoureux est une expérience que chaque homme doit connaître. Pour moi, c'est une expérience extraordinaire. On devrait être reconnaissant de vivre une expérience pareille.",
    "Ce qui compte, ce ne sont pas les individus mais le collectif.",
    "Prenez sur vous, où que vous viviez, de donner de la joie et de l'espoir autour de vous.",
    "Une tête bien faite et un bon cœur forment toujours une formidable combinaison.",
    "En amour, contrairement à la politique, en général la prudence n'est pas une vertu.",
    "Il est sage de persuader les gens de faire des choses et de les amener à penser que l’idée venait d’eux.",
    "Ne me jugez pas sur mes succès, jugez-moi sur le nombre de fois où je suis tombé et où je me suis relevé à nouveau.",
    "Même quand j’étais enfant, j’ai appris à vaincre mes adversaires sans les humilier.",
    "J'ai toujours pensé que l'exercice physique est la clef non seulement de la santé du corps mais aussi de la paix de l'esprit.",
    "En faisant scintiller notre lumière, nous offrons aux autres la possibilité d’en faire autant.",
    "L'éducation est l'arme la plus puissante pour changer le monde.",
    "L’honnêteté, la sincérité, la simplicité, l’humilité, la générosité, l’absence de vanité, la capacité à servir les autres - qualités à la portée de tous les âmes sont les véritables fondations de notre vie spirituelle."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                          fontSize: 16.5),
                    ))),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label: Text(
                    "Inspire me!",
                    style: TextStyle(fontSize: 18.8, color: Colors.white),
                  )),
            ),
            Spacer()
          ],
        ),
        // Aha urashobora kwandika ijambo ku murongo ugabuye hagati na hagati
        // ecran ya fone
        // Ura crea irya rirya jambo ryo muri button hama ugaca u crea methode iyibwira ico
        // gukora munyuma
        // Urashobora nokwafficha directement quote numero kanaka muri irya liste zirimwo
        // flatbutton niyo button ufyonzeko ica ihamagara ivyo wagize hejuru
        // turashiramwo variable y'incrementa kugira ufyonze ice y'incrementa
        // incrementation ibera muri _showQuote
        // We need also to set the _index as a set state(etat de lieu)
        // Turashiramwo n agituma ishitse kubwanyuma ica isubira gutangura
        // nico catumye dukoresha modulo ya _index
        // Munyuma gukora ibijanye na design bise neza (user interface)
        // couleurs et autres bouton ivyandiko, couleurs, taille, forme,
        // Divider ligne de division
      ),
    );
  }

  void _showQuote() {
    //increment our index/counter by 1
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
      ),
      backgroundColor: Colors.redAccent,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "AKIMANA JL",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text("buildingapps.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person_outline), Text("T: @buildappswithme")],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

/*
class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tapped button");
  }

  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
              onPressed: () => debugPrint("Email Tapped!"),
              icon: Icon(Icons.mail)),
          IconButton(onPressed: _tapButton, icon: Icon(Icons.access_alarm))
        ],
        // i can make the centerTitle false et ça s'affiche ku ntango
      ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.call_missed),
          onPressed: () => debugPrint("Hello")),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("First")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("second")),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text("Third"))
        ],
        onTap: (int index) => debugPrint("Tapped item : $index"),
      ),
      backgroundColor: Colors.redAccent.shade100,
      // we can do something simular of scaffolding with inkwell
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton()

            //  InkWell(
            //    child: Text(
            //      "Tap me",
            //      style: TextStyle(fontSize: 23.4),
            //    ),
            //  onTap: () => debugPrint("tapped..."),
            // )
          ],
        ),
      ),
    );
  }
}
 */

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(
          content: Text("Hello Again"),
          backgroundColor: Colors.amberAccent.shade700,
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  // ça, on l'obtient en tapant les deux lettres st et en choisissant
  // parmi les sugestions StatelessWidget

  @override
  Widget build(BuildContext context) {
    // Material design on les inclus ici comme
    // on a inclus le center dans mon app du texte sur
    // le fond noir.
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        // Comme ca sans la composantes color,
        // ça s'affiche sur un fond blanc.
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        // on met aussi du style pour le texte
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic),
      )),
    );
  }
}
