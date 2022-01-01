import 'dart:convert';

import 'package:demo/widgets/daily_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {

  const DetailsScreen({ Key? key }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


final baseUrl="api.openweathermap.org/data/2.5/forecast/daily?q=London&units=metric&cnt=7&appid=eee222ea3ece225edcedf966de7163ba";
 Map weatherData={};
  Future getWeather()async{
    final response = await http.get(Uri.parse
    (baseUrl));
    if(response.statusCode==200){
      setState(() {
        weatherData=jsonDecode(response.body); 
        // print("object:$weatherData");
      });
     
    }
  }
  @override
  void initState() {
    getWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
    body: Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
           gradient: LinearGradient(
              colors: [
                Color(0xff4B3EAE),
                Color(0xff766CC1),
                Color(0xff4B3EAE),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context,DetailsScreen());
                      }, 
                      icon: Icon(Icons.arrow_back_ios)
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Text(
                      "Today’s Weather",
                      style: TextStyle(
                        fontSize: 24
                      ),
                    ),
                    Text("Sunday, 8 March 2021"),
                   
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
                 Container(
                  //  width: 286,
                  //  height: 165,
                   decoration: BoxDecoration(
                     color: Color(0xff766CC1),
                     borderRadius: BorderRadius.circular(40),
                     border: Border.all(
                       width: 2,
                       color: Colors.white
                     )
                   ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Image.asset(
                          "assets/Moon_cloud_fast_wind.png",
                         
                          ),
                         
                        Column(
                          children: [
                            Text(
                              "23°",
                              // "${weatherData["city"]["name"]}",
                              // "${weatherData["city"]["name"]}",
                              
                               style: TextStyle(
                               fontSize: 72
                            ),
                            ),
                            Text(
                              "Moon Cloud Fast Wind",
                               style: TextStyle(
                               fontSize: 12
                            ),
                            ),
    
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    
                    child: Container(
                    
                    padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(40),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.white.withOpacity(0.30),
                             offset:Offset(0,-40),
                             spreadRadius: -20
                           )
                         ]
                      ),
                    
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                         Text(
                            "Future Weather",
                             style: TextStyle(
                             fontSize: 24,
                             fontWeight: FontWeight.bold
                          ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context,index){
                                return Divider(
                                  thickness: 1,
                                  color: Colors.grey.withOpacity(0.30),
                                );
                              },
                              shrinkWrap: true,
                               itemCount: 15,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (contex,index){
                                return DailyCard(
                                  value: "${weatherData["list"][0]["temp"]["day"]}",
                                  imageName: "Sun_cloud_angled_rain",
                                  date: "9 Marche 2021",
                                  day:"Monday" ,
                                
                                );
                              }
                              ),
                          ),
                         
                        ],
                      ),
                    ),
                  )
               
        ],
      ),
    ),
    );
  }
}

