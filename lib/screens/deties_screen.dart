import 'package:apibloc/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        // Wrap the whole body in SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'character_image_${character.id}',
              child: Image.network(
                character.image,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              character.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow('Status', character.status),
                    _buildDetailRow('Species', character.species),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text('Location : ${character.location.name}'),
                  ],
                ),
              ),
            ),
            // ListView will now scroll with the rest of the screen
            ListView.builder(
              shrinkWrap:
                  true, // Ensures the list takes up only as much space as it needs
              physics:
                  NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
              itemCount: character.episode.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    subtitle: Text(character.episode[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
