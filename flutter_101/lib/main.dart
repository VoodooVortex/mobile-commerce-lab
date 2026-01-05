import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00BCD4)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyPortfolioPage(),
    );
  }
}

class MyPortfolioPage extends StatefulWidget {
  const MyPortfolioPage({super.key});

  @override
  State<MyPortfolioPage> createState() => _MyPortfolioPageState();
}

class _MyPortfolioPageState extends State<MyPortfolioPage> {
  // Sample data for highlights
  final List<Map<String, String>> highlights = [
    {'title': 'Project 1', 'image': 'https://picsum.photos/400/300?random=1'},
    {'title': 'Project 2', 'image': 'https://picsum.photos/400/300?random=2'},
    {'title': 'Project 3', 'image': 'https://picsum.photos/400/300?random=3'},
    {'title': 'Project 4', 'image': 'https://picsum.photos/400/300?random=4'},
  ];

  // Sample data for gallery
  final List<String> galleryImages = [
    'https://picsum.photos/400/400?random=10',
    'https://picsum.photos/400/400?random=11',
    'https://picsum.photos/400/400?random=12',
    'https://picsum.photos/400/400?random=13',
    'https://picsum.photos/400/400?random=14',
    'https://picsum.photos/400/400?random=15',
    'https://picsum.photos/400/400?random=16',
    'https://picsum.photos/400/400?random=17',
  ];

  Future<void> _onRefresh() async {
    // Simulate refresh
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // Refresh data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Portfolio',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: const Color(0xFF00BCD4),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              _buildProfileSection(),

              const SizedBox(height: 24),

              // Highlights Section
              _buildHighlightsSection(),

              const SizedBox(height: 24),

              // Gallery Section
              _buildGallerySection(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Avatar with circular cyan background
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF00BCD4).withOpacity(0.3),
                  const Color(0xFF00BCD4).withOpacity(0.6),
                ],
              ),
            ),
            child: Center(
              child: Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/4fd0db61df0567c0f352.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.flutter_dash,
                    size: 60,
                    color: Color(0xFF00BCD4),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Name
          const Text(
            'Mr. Flutter Dev',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          // Subtitle
          Text(
            'Creative Designer',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Highlights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: highlights.length,
            itemBuilder: (context, index) {
              return _buildHighlightCard(highlights[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightCard(Map<String, String> project, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.75;
    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: cardWidth,
              height: 200,
              color: Colors.grey[300],
              child: Image.network(
                project['image']!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Title overlay at bottom-left
          Positioned(
            left: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                project['title']!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Gallery',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: galleryImages.length,
            itemBuilder: (context, index) {
              return _buildGalleryItem(galleryImages[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.grey[300],
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          // Center icon overlay
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.image,
                size: 24,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
