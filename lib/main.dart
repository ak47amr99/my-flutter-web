import 'dart:math';
import 'package:flutter/material.dart';

void main() {

  runApp(PetGachaApp());
}

class PetCard {
  final String name;
  final String imageUrl;
  final String rarity;

  PetCard({required this.name, required this.imageUrl, required this.rarity});
}

Color getRarityColor(String rarity) {
  switch (rarity) {
    case 'Common':
      return Colors.grey;
    case 'Rare':
      return Colors.blue;
    case 'Epic':
      return Colors.purple;
    case 'Legendary':
      return Colors.orange;
    default:
      return Colors.black;
  }
}

class PetGachaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Roller',
      home: PetHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PetHomePage extends StatefulWidget {
  @override
  _PetHomePageState createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> with SingleTickerProviderStateMixin {
  final List<PetCard> catPets = [
    PetCard(name: 'Siamese Cat', imageUrl: 'assets/siamese_1.jpg', rarity: 'Common'),
    PetCard(name: 'British Shorthair', imageUrl: 'assets/british-shorthair-1.jpg', rarity: 'Rare'),
    PetCard(name: 'Maine Coon', imageUrl: 'assets/maine_coon_giant.jpg', rarity: 'Epic'),
    PetCard(name: 'Persian Cat', imageUrl: 'assets/persian_long_hair_2.jpg', rarity: 'Legendary'),
    PetCard(name: 'Sphynx', imageUrl: 'assets/Sphynx1.jpg', rarity: 'Rare'),
    PetCard(name: 'American Shorthair', imageUrl: 'assets/americanshorthair.jpg', rarity: 'Legendary'),
    PetCard(name: 'Bombay cat', imageUrl: 'assets/bombaycat.jpg', rarity: 'Epic'),
    PetCard(name: 'Siberian cat', imageUrl: 'assets/siberiancat.jpg', rarity: 'Rare'),
    PetCard(name: 'Russian Blue', imageUrl: 'assets/russianblue.jpg', rarity: 'Common'),
    PetCard(name: 'Sir munchkin Cat', imageUrl: 'assets/munchkincat.jpg', rarity: 'Legendary'),
  ];

  final List<PetCard> dogPets = [
    PetCard(name: 'Bull Dog', imageUrl: 'assets/bulldog.jpg', rarity: 'Common'),
    PetCard(name: 'Poodle', imageUrl: 'assets/poodle.jpg', rarity: 'Rare'),
    PetCard(name: 'German Shepherd', imageUrl: 'assets/germanshepherd.jpg', rarity: 'Epic'),
    PetCard(name: 'Golden Retriever', imageUrl: 'assets/golden.jpeg', rarity: 'Legendary'),
    PetCard(name: 'Labrador Retriever', imageUrl: 'assets/Labrador.jpg', rarity: 'Rare'),
    PetCard(name: 'Husky', imageUrl: 'assets/husky.jpg', rarity: 'Epic'),
    PetCard(name: 'Chihuahua', imageUrl: 'assets/chihuahua.jpg', rarity: 'Common'),
    PetCard(name: 'Dachshund', imageUrl: 'assets/Dachshund.jpg', rarity: 'Rare'),
    PetCard(name: 'Border Collie', imageUrl: 'assets/Border Collie.jpg', rarity: 'Legendary'),
    PetCard(name: 'Maltese dog', imageUrl: 'assets/Maltese dog.jpg', rarity: 'Epic'),
    PetCard(name: 'Boxer', imageUrl: 'assets/Boxer.jpg', rarity: 'Common'),
  ];

  final List<PetCard> junglePets = [
    PetCard(name: 'Tiger', imageUrl: 'assets/tiger.jpg', rarity: 'Epic'),
    PetCard(name: 'Monkey', imageUrl: 'assets/monkey.jpg', rarity: 'Common'),
    PetCard(name: 'Parrot', imageUrl: 'assets/parrot.jpg', rarity: 'Rare'),
    PetCard(name: 'Panther', imageUrl: 'assets/panther.jpg', rarity: 'Legendary'),
    PetCard(name: 'Lion', imageUrl: 'assets/lion.jpg', rarity: 'Legendary'),
    PetCard(name: 'Giraffe', imageUrl: 'assets/giraffe.jpg', rarity: 'Epic'),
    PetCard(name: 'Crocodile', imageUrl: 'assets/Crocodile.jpg', rarity: 'Epic'),
    PetCard(name: 'Capybara', imageUrl: 'assets/capybara.jpg', rarity: 'Common'),
    PetCard(name: 'Rhino', imageUrl: 'assets/rhino.jpg', rarity: 'Rare'),
  ];

  List<PetCard> collection = [];
  PetCard? lastRolled;
  bool isRolling = false;
  bool showWelcomePopup = true;
  int eggIndex = 0; // 0: cat, 1: dog, 2: jungle

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: -0.1, end: 0.1).chain(CurveTween(curve: Curves.elasticIn)).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var pet in catPets + dogPets + junglePets) {
        precacheImage(AssetImage(pet.imageUrl), context);
      }

      if (showWelcomePopup) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Welcome!',style: TextStyle(color: Colors.pink),),
            content: Text('HAPPY LATE BIRTHDAY IRIS, CLICK ON THE EGGS ;)', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.pink),),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() => showWelcomePopup = false);
                },
                child: Text('Got it!'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rollPet() async {
    List<PetCard> currentPool;
    if (eggIndex == 0) currentPool = catPets;
    else if (eggIndex == 1) currentPool = dogPets;
    else currentPool = junglePets;

    setState(() => isRolling = true);
    _controller.repeat(reverse: true);
    await Future.delayed(Duration(milliseconds: 700));
    _controller.stop();
    _controller.reset();

    final rand = Random().nextDouble();
    String selectedRarity;
    if (rand < 0.03) selectedRarity = 'Legendary';
    else if (rand < 0.1) selectedRarity = 'Epic';
    else if (rand < 0.35) selectedRarity = 'Rare';
    else selectedRarity = 'Common';

    final petsOfSelectedRarity = currentPool.where((pet) => pet.rarity == selectedRarity).toList();
    List<PetCard> possiblePets = petsOfSelectedRarity;
    if (petsOfSelectedRarity.length > 1 && lastRolled != null) {
      possiblePets = petsOfSelectedRarity.where((pet) => pet.name != lastRolled!.name).toList();
    }
    if (possiblePets.isEmpty) {
      possiblePets = petsOfSelectedRarity;
    }
    final rolledPet = possiblePets[Random().nextInt(possiblePets.length)];
    final isNew = !collection.any((pet) => pet.name == rolledPet.name);

    setState(() {
      lastRolled = rolledPet;
      collection.add(rolledPet);
      isRolling = false;
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isNew ? 'New Pet!' : 'You got a pet!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You got: ${rolledPet.name} (${rolledPet.rarity})'),
            SizedBox(height: 10),
            Image.asset(rolledPet.imageUrl, height: 100),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
        ],
      ),
    );
  }

  void navigateToCollection(List<PetCard> allPets, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollectionPage(collection: collection, allPets: allPets, title: title),
      ),
    );
  }

  void switchEgg(int direction) {
    setState(() {
      eggIndex = (eggIndex + direction) % 3;
      if (eggIndex < 0) eggIndex += 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eggImages = [
      'assets/egg.png',
      'assets/dogegg.png',
      'assets/jungle_egg.png'
    ];
    final eggLocked = [
      false,
      !catPets.every((pet) => collection.any((c) => c.name == pet.name)),
      !dogPets.every((pet) => collection.any((c) => c.name == pet.name)),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Pet Roller'), backgroundColor: Colors.pinkAccent),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(
              title: Text('Cat Collection'),
              onTap: () => navigateToCollection(catPets, 'Cat Collection'),
            ),
            ListTile(
              title: Text('Dog Collection'),
              enabled: !eggLocked[1],
              onTap: eggLocked[1] ? null : () => navigateToCollection(dogPets, 'Dog Collection'),
            ),
            ListTile(
              title: Text('Jungle Collection'),
              enabled: !eggLocked[2],
              onTap: eggLocked[2] ? null : () => navigateToCollection(junglePets, 'Jungle Collection'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => switchEgg(-1)),
                GestureDetector(
                  onTap: isRolling || eggLocked[eggIndex] ? null : rollPet,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) => Transform.rotate(
                      angle: isRolling ? _animation.value : 0,
                      child: child,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(eggImages[eggIndex], height: 180),
                        if (eggLocked[eggIndex])
                          Container(
                            height: 180,
                            width: 180,
                            color: Colors.black54,
                            child: Icon(Icons.lock, size: 60, color: Colors.white),
                          ),
                      ],
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () => switchEgg(1)),
              ],
            ),
            SizedBox(height: 20),
            Text('Tap the egg to roll a pet!'),
          ],
        ),
      ),
    );
  }
}

class CollectionPage extends StatelessWidget {
  final List<PetCard> collection;
  final List<PetCard> allPets;
  final String title;

  const CollectionPage({required this.collection, required this.allPets, required this.title});

  @override
  Widget build(BuildContext context) {
    final uniquePets = {for (var pet in collection) pet.name: pet}.values.toList();

    final sortedPets = [
      ...allPets.where((p) => p.rarity == 'Common'),
      ...allPets.where((p) => p.rarity == 'Rare'),
      ...allPets.where((p) => p.rarity == 'Epic'),
      ...allPets.where((p) => p.rarity == 'Legendary'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.pinkAccent),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8),
        children: sortedPets.map((pet) {
          final hasPet = uniquePets.any((p) => p.name == pet.name);
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hasPet ? Image.asset(pet.imageUrl, height: 100, fit: BoxFit.cover) : Icon(Icons.help_outline, size: 100),
                SizedBox(height: 4),
                Text(hasPet ? pet.name : '???', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  pet.rarity,
                  style: TextStyle(color: getRarityColor(pet.rarity), fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
