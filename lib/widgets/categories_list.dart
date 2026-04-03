import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<String> categories = ['Children', 'Men', 'Women', 'Shoes', 'Bags'];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    // 1. بنسحب الـ ColorScheme بتاع الثيم الحالي (سواء لايت أو دارك)
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                // 2. لو مختار: ياخد اللون الأساسي (أسود في اللايت / أبيض في الدارك)
                // لو مش مختار: يبقى شفاف أو لون هادي
                color: isSelected ? colorScheme.onSurface : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey[300]!,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(
                  // 3. لو الخلفية غامقة، الكلام يبقى فاتح (surface) والعكس
                  color: isSelected ? colorScheme.surface : colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}