import 'package:apibloc/bloc/character_bloc.dart';
import 'package:apibloc/bloc/character_event.dart';
import 'package:apibloc/bloc/character_state.dart';
import 'package:apibloc/screens/deties_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rick and Morty Characters",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Custom color
        elevation: 8, // Shadow for the AppBar
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 5,
              ),
            );
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailScreen(
                            character: character,
                          ),
                        ),
                      );
                    },
                    leading: Hero(
                      tag: 'character_image_${character.id}',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(character.image),
                      ),
                    ),
                    title: Text(
                      character.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      character.status,
                      style: TextStyle(
                        color: _getStatusColor(character.status),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            );
          } else if (state is CharacterError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Error: ${state.message}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<CharacterBloc>().add(FetchCharactersEvent());
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text(
              "Loading characters...",
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }

  // Helper method to color-code status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}


