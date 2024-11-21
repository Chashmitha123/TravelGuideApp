import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Map<String, String>> places = [
    {'name': 'London', 'image': 'assets/london.jpeg'},
    {'name': 'Rome', 'image': 'assets/rome.jpg'},
    {'name': 'Berlin', 'image': 'assets/berlin.jpg'},
    {'name': 'Istanbul', 'image': 'assets/istanbul.jpg'},
    {'name': 'Bangkok', 'image': 'assets/bangkok.jpg'},
  ];

  final List<Map<String, String>> favoritePlaces = [];

  // Method to add or remove place from favorites
  void toggleFavorite(Map<String, String> place) {
    setState(() {
      if (favoritePlaces.contains(place)) {
        favoritePlaces.remove(place);
      } else {
        favoritePlaces.add(place);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Places list
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  final isFavorite = favoritePlaces.contains(place);

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.asset(
                                place['image']!,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                                onPressed: () => toggleFavorite(place),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            place['name']!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 12.0, bottom: 12.0),
                          child: Text(
                            'Tap the heart to add or remove from favorites.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Display favorite places
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Favorites:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  favoritePlaces.isEmpty
                      ? Text('No favorites yet. Add some places!')
                      : Column(
                    children: favoritePlaces.map((place) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            place['image']!,
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(place['name']!),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
