import 'package:flutter/material.dart';

class ImageAndNameSection extends StatelessWidget {
  const ImageAndNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[400]
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://res.cloudinary.com/duwfy7ale/image/upload/q_auto/f_auto/v1775133520/download_wd9ups.jpg',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          OutlinedButton.icon(
            onPressed: () {
              // هنا يمكنك إضافة وظيفة تحرير الملف الشخصي
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            icon: const Icon(Icons.edit, size: 16),
            label: const Text('Edit', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
