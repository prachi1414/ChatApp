import 'package:flutter/material.dart';
import 'button_values.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String number1="";
  String operand="";
  String number2="";

  @override
  Widget build(BuildContext context) {
    final screenSized=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator',
        style: TextStyle(
          color: Color.fromARGB(233, 235, 89, 36),
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
        ),
        
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$number1$operand$number2".isEmpty
                    ?"0"
                    :"$number1$operand$number2"
                    ,
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            //button
            Wrap(
              children:
               Btn.buttonValues
               .map(
                (value) => SizedBox(
                  width: value == Btn.calculate
                  ? screenSized.width/2
                  :  screenSized.width/4,
                  height: screenSized.width/5,
                  child: buildButton(value)),)
                .toList(),

              
            )
          ],
        ) 
        ),
    );
  }
  Widget buildButton(value){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            ),
          borderRadius: BorderRadius.circular(100)
          ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(value, 
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 25),
            )
            ),
        ),
      ),
    );
  }
  //$$$$$
    void onBtnTap(String value){
     if(value==Btn.del){
      delete();
      return;
     }
     if(value==Btn.clr){
      clearAll();
      return;
     }
     if(value==Btn.per){
      convertToPercentage();
      return;
     }

     if(value ==Btn.calculate){
      calculate();
      return;
     }

     appenndValue(value);
   }

   //######
  //Calculates the resutl

  void calculate(){
    if(number1.isEmpty)
    return;
    if(operand.isEmpty)
    return;
    if(number2.isEmpty)
    return;

    double num1=double.parse(number1);
    double num2=double.parse(number2);

    var result = 0.0;
    switch(operand){
      case Btn.add:
      result = num1+num2;
      break;
      case Btn.subtract:
      result = num1-num2;
      break;
      case Btn.multiply:
      result = num1*num2;
      break;
      case Btn.divide:
      result = num1/num2;
      break;
      default:
    
    }
    setState(() {
      number1 = "$result";
      if (number1.endsWith(".0")){
        number1 = number1.substring(0,number1.length -2);
      }

      operand= "";
      number2= "";

    });

  }
   //output percentage

   void convertToPercentage(){
    if(number1.isNotEmpty&&operand.isNotEmpty&&number2.isNotEmpty){
     // final res=number1 operand number2;
     //res=number1;

    }
    if(operand.isNotEmpty){
      return;
    }
    final number = double.parse(number1);
    setState(() {
      number1="${(number / 100)}";
      operand = "";
      number2 = "";
      print(number1);
    });
   }
    //Clear all output
    void clearAll(){
      setState(() {
        number1 = "";
        operand = "";
        number2 = "";
      });
    }

   //delete one from end
   void delete(){
    if(number2.isNotEmpty){
      number2=number2.substring(0,number2.length-1);
    }
    else if(operand.isNotEmpty){
      operand="";
    }
    else if(number1.isNotEmpty){
      number1=number1.substring(0,number1.length-1);
    }
    setState(() {});
   }

  //$$$$$$
void appenndValue(String value){
  if(value!=Btn.dot&&int.tryParse(value)==null){
        if(operand.isNotEmpty&&number2.isNotEmpty){

        }
        operand=value;
      }
      else if(number1.isEmpty|| operand.isEmpty){
        if(value==Btn.dot && number1.contains(Btn.dot))
        return;
        if(value==Btn.dot && (number1.isEmpty || number1==Btn.no0)) 
        {
          value="0.";
        }
        number1 += value;
      }
      else if(number2.isEmpty|| operand.isNotEmpty){
        if(value==Btn.dot && number2.contains(Btn.dot))
        return;
        if(value==Btn.dot && (number2.isEmpty || number2==Btn.no0)) 
        {
          value="0.";
        }
        number2 += value;
      }
      setState(() {});

}
  //$$$$

  Color getBtnColor(value){
    return [Btn.del,Btn.clr].contains(value)?Colors.blueGrey:
        [
          Btn.divide,
          Btn.multiply,
          Btn.per,
          Btn.subtract,
          Btn.add,
          Btn.calculate,
          Btn.dot
          ].contains(value)?const Color.fromARGB(255, 206, 130, 31)
          :Colors.black26;
        
  }
}