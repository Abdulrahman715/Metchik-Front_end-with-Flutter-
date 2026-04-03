import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_icon_button.dart';

class RowBodyProductsView extends StatelessWidget {
  const RowBodyProductsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '    Search ... ',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          CustomIconButton(icon:Icons.filter_list, onPressed: () {}),
        ],
      ),
    );
  }
}
