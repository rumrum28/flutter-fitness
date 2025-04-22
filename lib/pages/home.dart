import 'package:fitness/models/category_models.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _searchField(),
          SizedBox(height: 40),
          _categorySection(),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recommendation\nfor diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 220,
                      decoration: BoxDecoration(
                        color: diets[index].boxColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            diets[index].iconPath,
                            width: 48,
                            height: 48,
                          ),
                          Text(
                            diets[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                            style: TextStyle(
                              color: Color(0xff7B6F72),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  diets[index].viewIsSelected
                                      ? Color(0xff9DCEFF)
                                      : Colors.transparent,
                                  diets[index].viewIsSelected
                                      ? Color.fromARGB(255, 82, 161, 240)
                                      : Colors.transparent,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                  color:
                                      diets[index].viewIsSelected
                                          ? Colors.white
                                          : Color.fromARGB(255, 82, 161, 240),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 25),
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    const String search = 'assets/icons/Search.svg';
    const String filter = 'assets/icons/FilterAlt.svg';

    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: 0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(search),
          ),
          hintText: 'Search Pancake',
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(filter),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    const String arrowLeft = 'assets/icons/ArrowBackIos.svg';
    const String more = 'assets/icons/MoreVert.svg';

    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(arrowLeft, height: 20, width: 20),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(more, height: 20, width: 20),
          ),
        ),
      ],
    );
  }
}
