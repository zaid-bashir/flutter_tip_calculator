import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  int _tipPercentage = 0;
  int _personCount = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.teal),
        home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            "Tip Calculator",
          ),
          backgroundColor: Colors.teal,
        ),
        drawer: Container(),
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20.5),
            children: <Widget>[
              new Container(
                width: 350,
                height: 100,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("Total Per Person",style: TextStyle(
                            color: Colors.orange.withOpacity(.9),
                            fontWeight: FontWeight.normal,
                            fontSize: 30.0,
                          ),),
                        ),
                      ),
                      Center(
                        child: Text("\$${calculateTotalPerPerson(_billAmount,_personCount, _tipPercentage)}",style: TextStyle(
                          color: Colors.purple.withOpacity(.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.0),
                padding: EdgeInsets.all(20.0),
                width: 450,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.red,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: new Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(
                         color: Colors.purpleAccent,
                         fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                      decoration: InputDecoration(
                        prefixText: "Bill Amount:",
                        prefixIcon: Icon(Icons.monetization_on),
                      ),
                      onChanged: (String value){
                        try{
                          _billAmount = double.parse(value);
                        }catch(exception){
                          _billAmount = 0.0;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Split:",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(_personCount >1 )
                                    {
                                      _personCount--;
                                    }
                                  else{

                                  }
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.purple.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("-",style: TextStyle(
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                 "$_personCount",
                                  style: TextStyle(
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _personCount++;
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.purple.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("+",style: TextStyle(
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            "Tip:",
                            style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                          ),
                        ),
                        Text(
                            "\$${calculateTotalTip(_billAmount,_personCount,_tipPercentage)}",
                            style: TextStyle(
                            color: Colors.purple.withOpacity(.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$_tipPercentage%",
                          style: TextStyle(
                            color: Colors.purple.withOpacity(.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                          ),
                        ),
                        Slider(
                          min: 0,
                          max: 100,
                          inactiveColor: Colors.red,
                          activeColor: Colors.green,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount,int splitBy,int tipPercentage){
      double totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) +billAmount)/splitBy;
      return totalPerPerson.toStringAsFixed(2);
  }

  double calculateTotalTip(double billAmount,int splitBy, int tipPercentage){
    double totalTip = 0.0;
    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null)
      {
        //Code Goes Here.
      }
    else{
      totalTip = (billAmount * tipPercentage)/100;
    }
    return totalTip;
  }
}
