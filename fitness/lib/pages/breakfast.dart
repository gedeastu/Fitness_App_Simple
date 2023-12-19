import 'package:fitness/components/AppBarWidget.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/recommendation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class Breakfast extends StatefulWidget {
  const Breakfast({super.key});

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
 
  List<Category> categories = [];
  List<Recommendations> recommendations = [];

  void _getInitialInfo(){
    categories = Category.getCategories();
    recommendations = Recommendations.getRecommendation();
  }

  @override
  void initState() {
    // TODO: implement initState
    _getInitialInfo();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    //print(categories);
    _getInitialInfo();
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            const SizedBox(height: 40.0,),
            _categoriesSection(),
            const SizedBox(height: 40.0,),
            _recommendationsSection()
          ],
        ),
      ),
    );
  }

  Column _recommendationsSection() {
    var Recommendations = recommendations;
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 180.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Recommendation for Diet", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),)
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                height: 250.0,
                child: ListView.separated(
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 25,);
                },
                itemCount: Recommendations.length,
                itemBuilder: (context, index) {
                  print(!Recommendations[index].viewIsSelected);
                  return Container(
                    width: 210,
                    //height: 150,
                    padding: const EdgeInsets.only(bottom: 10.0,),
                    decoration: BoxDecoration(
                      color: Recommendations[index].bgCard.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      SizedBox(
                        width: 110,
                        height: 110,
                        child: SvgPicture.asset(Recommendations[index].icon),
                      ),
                      Text(Recommendations[index].nameFood,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('${Recommendations[index].level} | ${Recommendations[index].time} | ${Recommendations[index].calories}',style: const TextStyle(fontSize: 13.0,color: Colors.black54),),
                      ),
                      Container(
                        width: 120,
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: Recommendations[index].viewIsSelected ? LinearGradient(colors:[Color.fromARGB(255, 3, 102, 201),Color.fromARGB(255, 146, 164, 253)]) : LinearGradient(colors:[Color.fromARGB(255, 143, 199, 255),Color.fromARGB(255, 56, 146, 237)])
                        ),
                        child: 
                        TextButton(
                        onPressed:(){
                          setState(() {
                            Recommendations[index].viewIsSelected = !Recommendations[index].viewIsSelected;
                            
                          });
                        }, 
                        child:Text("View ${Recommendations[index].viewIsSelected ? true : false}", style: TextStyle(color: Recommendations[index].viewIsSelected ? Colors.blue : Colors.white,fontWeight: FontWeight.bold),) ,
                      ),
                      )
                    ]),
                  );
                },
              ),
              )
            ],  
          );
  }

  Column _categoriesSection() {
    var Categories = categories;
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    Text("Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),)
                  ],
                ),
            ),
            const SizedBox(height: 20.0,),
            SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20,right: 20),
              itemCount: Categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                   color:  Categories[index].boxColor.withOpacity(0.3),
                   borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(Categories[index].icon),
                      ),
                      Text(Categories[index].name,style: const TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) { 
                return const SizedBox(width:25);
               },
            ),
          )
            ],
          );
  }

  Container _searchField() {
    return Container(
            margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff1d1617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 3),
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search Breakfast",
                hintStyle: const TextStyle(
                  color: Color(0xffdddada),
                  fontSize: 14
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_alt),
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                )
              ),
            ),
          );
  }
}