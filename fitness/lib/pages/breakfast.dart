import 'package:fitness/components/AppBarWidget.dart';
import 'package:fitness/models/category_model.dart';
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

  void _getCategories(){
    categories = Category.getCategories();
  }

  @override
  void initState() {
    // TODO: implement initState
    _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
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
          ],
        ),
      ),
    );
  }

  Column _categoriesSection() {
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
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                   color:  categories[index].boxColor.withOpacity(0.4),
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
                        child: SvgPicture.asset(categories[index].icon),
                      ),
                      Text(categories[index].name,style: const TextStyle(fontWeight: FontWeight.w500),)
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