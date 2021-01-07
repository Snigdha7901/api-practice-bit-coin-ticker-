import 'package:flutter/material.dart';
import 'coin_data.dart';



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectcurrency ='AUD';
  int ex_rate=00;int ex_rate1=00;int ex_rate2=00;
  CoinData coinData=CoinData();
  void getrate()async{
    int data = await CoinData().getdata(cryptoList[0],selectcurrency);
    int data1 = await CoinData().getdata(cryptoList[1],selectcurrency);
    int data2 = await CoinData().getdata(cryptoList[2],selectcurrency);
    setState(() {
      ex_rate = data;
      ex_rate1 = data1;
      ex_rate2 = data2;
    });
  }

  List<DropdownMenuItem> getelements(){

    List<DropdownMenuItem> dropdownitem=[];
    for(int i=0;i<currenciesList.length;i++)
      { var newitem=DropdownMenuItem(child: Text(currenciesList[i]),value: currenciesList[i],);

      dropdownitem.add(newitem);
      }
  return dropdownitem;
  }


  Card display (String bitcur,int rate){

    Card show=Card (
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 28.0),
        child: Text(
          '1 $bitcur = $rate $selectcurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
    return show;}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 60.0, 18.0, 0),
            child:display(cryptoList[0],ex_rate),
          ),


          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0),
            child:display(cryptoList[1],ex_rate1),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0),
            child:display(cryptoList[2],ex_rate2),
          ),

          Container(
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<dynamic>(items: getelements(),
                value: selectcurrency,
                onChanged: (value)
            {setState(() {
              selectcurrency=value;
              getrate();
            });}),
          ),
        ],
      ),
    );
  }
}