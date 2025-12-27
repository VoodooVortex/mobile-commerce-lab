import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfile());
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF039587)),
        fontFamily: 'Magic Red',
      ),
      home: const MyHomePage(title: 'My Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _like = 14;

  void _incrementLikes() {
    setState(() {
      _like++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfff6ff),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _incrementLikes,
            icon: const Icon(
              Icons.favorite,
              color: Color(0xFF48444e),
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: const Color(0xFFB39DDB),
                //   width: 4,
                // ),
              ),
              child: const CircleAvatar(
                radius: 60,
                // backgroundColor: Color(0xFFB39DDB),
                backgroundImage: AssetImage('assets/images/66160080.JPG'),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Mr. Flutter Dev',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF272e31),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Mobile Application Developer',
              style: TextStyle(fontSize: 16, color: Color(0xFFb7aeb6)),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFe2f1f2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Likes
                  Column(
                    children: [
                      Text(
                        'Likes',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF272e31),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$_like',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF0d9285),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  // Followers
                  Column(
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF272e31),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '1.5k',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF272e31),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  // Following
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF272e31),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '300',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF272e31),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ElevatedButton(
                onPressed: _incrementLikes,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFfaf1fa),
                  foregroundColor: Color(0xFF7f71a0),
                  elevation: 2, // เงา
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // ขอบมน
                  ),
                ),
                child: const Text(
                  'Like +1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
