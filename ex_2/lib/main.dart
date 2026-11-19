
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Exercise2(),
      ),
    );

// Main page
class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: const [
          FavoriteCard(
            title: "Flutter",
            description: "Mobile development framework",
            isFavorite: false,
          ),
          FavoriteCard(
            title: "Dart",
            description: "Programming language",
            isFavorite: true,
          ),
          FavoriteCard(
            title: "React",
            description: "JavaScript library",
            isFavorite: true,
          ),
        ],
      ),
    );
  }
}

// Favorite Card
class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      // Border at the bottom
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),

      child: Row(
        children: [

          // Text takes available space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  widget.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Favorite heart button
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
