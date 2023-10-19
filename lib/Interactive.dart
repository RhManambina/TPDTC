import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class interactivePage extends StatefulWidget {
  const interactivePage({super.key});

  @override
  State<interactivePage> createState() => _interactivePage();
}

class _interactivePage extends State<interactivePage> {

  bool isDarkMode = false;
 
  //declaration IBM
   String result = '';

 // Fonction date calcul age 

  //Create datetime variable
  String myAge = '';

  DateTime dateTime = DateTime.now();


   pickDob(){
       showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(1990), 
        lastDate: DateTime.now()
        ).then((pickedDate) {
          if(pickedDate != null) {
             calculateAge(pickedDate);
          }
        }) ;  

   }
 

   calculateAge(DateTime birth) {
      DateTime now = DateTime.now();
      Duration age = now.difference(birth);
      int years = age.inDays ~/ 365;
      // int months = (age.inDays % 365) ~/ 30;
      // int days = ((age.inDays % 365) % 30) ;
      setState(() {
        // myAge = '$years years, $months months and $days days';
         myAge = '$years ans';

      });

   }
   
   //calcul BMI

     calculBmi( double taille, double poids ){
          // double result = 
          double finalresult = poids / (taille*taille /1000);
          String bmi = finalresult.toStringAsFixed(2);
         setState(() {
           result = bmi;
         });
      }
  //Photo de couverture
  Widget photocouverture()=>Container(
    color: Colors.grey,
    child: Image.asset(
      'assets/image1.jpg',
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
      ),
  );
  //Photo de profile
  Widget photoprofile()=>Container(
    width:150,
    height:150,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),                        
    ),            
    child: Image.asset(
      'assets/image2.jpg',
      fit: BoxFit.cover,
    ),
  );

  //Radio
  String? valeurs = '';

  
  //create variable ho an'ilay slide
  double currentvalue = 0;


 //Variable ho an'ilay checkbox
  bool ?isCheckedflutter = false;
  bool ?isCheckedreact = false;
  bool ?isCheckedsymfony = false;

  //Declarer variable ho an'ilay iaffichena azy 
  String? nom ;
  String? prenom;
  String? Sexe;
  int? Taille;
  int? poids;
  String? Technologie;
  DateTime? ddn;
  String? Loisirs; 


  //declarer variable ho sotomin'ilay boutton valider
   var namectrl = TextEditingController();
   var surnamectrl = TextEditingController();
   var loisirctrl = TextEditingController();
   var poidsctrl = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   title: Center(child: Text('EXO 3')),
      // ),
      body: SingleChildScrollView(

        child: Column(

          children: [

            Column(
              
              //Ato no mi-afficher rehefa avy clikena ny boutton

                 
               children: [

                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      child: photocouverture(),
                      margin: EdgeInsets.only(bottom: 70),
                      ),
                    Positioned(
                       top: 130,
                      child: photoprofile(),
                    )
                  ],
                ),
                  //Nampiasa TextField   
              ],
             
              
            ),
            Column(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  
                  child: Column(
                    children: [
                      Row(
                            
                        children: [
                          
                          Text('nom: '),
                          Text('${namectrl.text}' ' '  'et  ' ),
                          Text('prénom: '), 
                          Text('${surnamectrl.text}'),
                        
                        ], 
                      ),
      
                  //Nampiasa radio
            
                    Row(
                    children: [
                      
                      Text('Sexe: '),
                      Text('${valeurs}'),
                      Card(
                        borderOnForeground: isDarkMode,
                        ),
                    ],
                  ),
            

                  //Taille nampiasa slide
            
                    Row(
                    children: [
                      
                      Text('Taille: '),
                      Text('${currentvalue}''cm'),
                      Card(
                        borderOnForeground: isDarkMode,
                        ),
                    ],
                  ),
            

                  //DDN nampiasa DatePicker
                  
                  
            
                  Row(
                    children: [
                      Text('Age : '),
                      Text(myAge),
                    
                    ],
                  ),


                  //Nampiasa checkbox
                //Techno
                    Row(
                    children: [
                      
                      Text('Liste des Technologies : '),
            
                      //Mi-afficher zavatra maromaro 
            
                      Visibility(child: Text('flutter , '),
                      visible: isCheckedflutter ?? false,),
                      Visibility(child: Text('React , '),
                      visible: isCheckedreact ?? false,),
                      Visibility(child: Text('Symfony  '),
                      visible: isCheckedsymfony ?? false,),
                    
                    ],
                  ),
            
            
                  //Mi_afficher ny loisir 
                  Row(
                    children: [
                      
                      Text('Loisir: '),
                      Text('${loisirctrl.text}'),
                    ],
                  ),

                    //Mi_afficher ny BMI
                  Row(
                    children: [
                      Text('BMI : '),
                      Text(result),
                    ],
                  ),

                  Divider(),
                  
                  Row(
                    
                    children: [
                      Text('Nom :  '),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: namectrl,
                          decoration: InputDecoration(hintText: 'nom'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    
                    children: [
                      Text('Prenom :  '),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: surnamectrl,
                          decoration: InputDecoration(hintText: 'prenom'),
                        ),
                      ),
                    ],
                  ),
            
                  Row(
                    children: [
                      
                      Text("Sexe : "),
                    Row(
                    children: [
                      Radio(
                        value: 'Masculin',
                      groupValue: valeurs,
                      
                        onChanged: (value){
                          setState(() {
                            valeurs=value;
                          });
                        },
                        ),
                        SizedBox(width: 10.0,),
                        Text("Masculin"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 'Feminin',
                      groupValue: valeurs,
                        onChanged: (value){
                          setState(() {
                            valeurs = value;
                          });
                        },
                        ),SizedBox(width: 10.0,),
                        Text("Feminin"),
                    ],
                  ),
              
                    ],
                  ),
            
                  Row(
                    children: [
                        Text('Taille : '),
                      //  Text(currentvalue.toString(), style: TextStyle(fontSize: 35),),
                        Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                        
                          children: [

                            Slider(
                              value: currentvalue,
                              min: 0 ,
                              max: 250 ,
                              divisions: 10,
                              label: currentvalue.toString(),
                              activeColor: Colors.green,
                              thumbColor: Colors.brown,
                              inactiveColor: Colors.blueGrey,
                              onChanged: (value){
                                setState(() {
                                  currentvalue = value;
                                });
                              },
                            ),
                          ],
                  ),  
                ],
                  ),

                      Row(
                    
                    children: [
                      Text('Poids :  '),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: poidsctrl,
                          decoration: InputDecoration(hintText: 'Poids'),
                        ),
                      ),
                    ],
                  ),
            
                  Row(
                    children: [
                      Text('Technologie : '),
                      Row(
                      children: [
                          
                            Text('Flutter'),
                            Checkbox(
                                value: isCheckedflutter,
                                activeColor: Colors.black,
                                onChanged: (newBool){
                                  setState(() {
                                    isCheckedflutter = true;
                            });
                          }
                        ),
                    
            
                    ],
                  ),
                  Row(
                      children: [
                          
                            Text('React'),
                            Checkbox(
                                value: isCheckedreact,
                                activeColor: Colors.black,
                                onChanged: (newBool){
                                  setState(() {
                                    isCheckedreact = true;
                            });
                          }
                        ),
                    ],
                  ),
                  Row(
                      children: [
                          
                            Text('Symfony'),
                            Checkbox(
                                value: isCheckedsymfony,
                                activeColor: Colors.blueGrey,
                                onChanged: (newBool){
                                  setState(() {
                                    isCheckedsymfony = newBool;
                            });
                          }
                        ),
                    
            
                    ],
                  ),    
                        
                    ],
                  ),
            
                    Row(
                    children: [
                      Text('DDN: '),
            
              
                
                ElevatedButton(
                  onPressed: () => pickDob(), 
                  child: const Text('ddn'),
                ),
                  // Text(dateTime.year.toString(),style: TextStyle(fontSize: 15),),
                  Text(dateTime.toString(),style: TextStyle(fontSize: 15),),

            
                    ],
            
                  ),

                
            
                    Row(
                    
                    children: [
                      Text('Loisirs :  '),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: loisirctrl,
                          decoration: InputDecoration(hintText: 'Loisirs'),
                        ),
                      ),
                    ],
                  ),
              ElevatedButton(

                  onPressed: () => 

                  //calcul BMI
                  //String avadika value io @poids

                  calculBmi(currentvalue,double.parse(poidsctrl.value.text)), 
                  
                  child: const Text('Valider'),
                ),  
            
                    ],
                  ),
                      )
                    ],
                  )

                  
                ],
        ),
      ),


      
          backgroundColor: (isDarkMode==true? Colors.white:const Color.fromARGB(255, 164, 113, 113)),
      
        //manovanova ny placaen'ilay bouton
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      
      //  floatingActionButton:FloatingActionButton(onPressed:() {
      //   //Manatsofoka ilay valeur
      
      //       setState(() {
      //         //Manova couleur 
      //         if(isDarkMode==true){
      //             isDarkMode = false;
      //         }else{
      //           isDarkMode = true;
      //         }          

      //       });
      //       },

      //     child: Icon(Icons.abc_outlined),
   
      // ),
       
    );
  }
}