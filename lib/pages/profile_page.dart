import 'package:flutter/material.dart';
import '../data/user_model.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF424242),
          title: const Text(
            'Log Out',
            style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(color: Colors.white70, fontFamily: 'Helvetica'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInPage(),
                  ),
                );
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.redAccent, fontFamily: 'Helvetica'),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSection({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<Widget> content,
  }) {
    return Card(
      color: const Color(0xFF333333),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Icon(icon, color: iconColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 18,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: content),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
        appBar: AppBar(
          automaticallyImplyLeading: false, // This removes the left arrow
          backgroundColor: const Color(0xFF212121),
          title: Row(
            children: [
              // Logo on the left side
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/icons/logo.png',
                  width: 25, // Adjust size as needed
                  height: 25,
                  color: Colors.white,
                ),
              ),
              const Spacer(), // Pushes the "Profile" text to the center

              // "Profile" text centered
              const Text(
                'Mihon',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontFamily: 'Helvetica',
                ),
              ),
              const Spacer(), // Ensures the title stays centered
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0), // Adds padding to the right
              child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () => _showLogoutConfirmationDialog(context),
              ),
            ),
          ],
        ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unified Profile and Bio Section
// Unified Profile and Bio Section
// Unified Profile and Bio Section
            Card(
              color: const Color(0xFF333333),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(user.profilePicture),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  user.displayName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.local_fire_department,
                                  color: Colors.orangeAccent,
                                  size: 18,
                                ),
                                Text(
                                  '${user.readingStreak}',
                                  style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            // Username with '@'
                            Row(
                              children: [
                                const Icon(
                                  Icons.alternate_email, // '@' icon
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                const SizedBox(width: 8), // Spacing between the icon and the text
                                Text(
                                  user.username,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),

                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on, // Location icon
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                const SizedBox(width: 8), // Spacing between the icon and the text
                                Text(
                                  user.location,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Helvetica',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),

                            // Add Birthday
                            Row(
                              children: [
                                const Icon(
                                  Icons.cake, // Birthday icon
                                  color: Colors.white70,
                                  size: 12,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  user.birthday,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Helvetica',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(color: Colors.white38, thickness: 1),

                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        user.bio,
                        style: const TextStyle(color: Colors.white70, fontFamily: 'Helvetica'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Favorite Genres section within the bio
                    // Center the chips horizontally
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var genre in user.favoriteGenres)
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Chip(
                                  label: Text(
                                    genre,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Helvetica',
                                      fontSize: 12,
                                    ),
                                  ),
                                  backgroundColor: const Color(0xFF333333), // Dark gray background
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6), // Rounded corners
                                  ),
                                  elevation: 0, // No shadow or border effect
                                  side: const BorderSide(color: Colors.white38), // Ensure no border is applied
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

// Achievements Section
// Achievements Section
            // Achievements Section
            _buildSection(
              icon: Icons.emoji_events,
              iconColor: Colors.orangeAccent,
              title: 'Achievements',
              content: [
                for (var achievement in user.achievements)
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center, // Align vertically in the center
                      children: [
                        const Icon(
                          Icons.circle, // Bullet point icon
                          color: Colors.white70, // Light color for the bullet
                          size: 6, // Small size for the bullet
                        ),
                        const SizedBox(width: 4),
                        Text(
                          ' $achievement', // Add space here to keep the bullet and text together
                          style: const TextStyle(color: Colors.white70, fontFamily: 'Helvetica'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),


            // Favorite Manga Section with Horizontal Scroll
            _buildSection(
              icon: Icons.favorite,
              iconColor: Colors.pinkAccent,
              title: 'Favorite Manga',
              content: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var title in user.favoriteManga.keys)
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6), // Apply border radius here
                                child: Image.asset(
                                  user.favoriteManga[title]!,
                                  width: 103,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Wrapping the title with a SizedBox for better control
                              SizedBox(
                                width: 103, // Set width to match the image size
                                child: SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'Helvetica',
                                      overflow: TextOverflow.ellipsis, // Adds ellipsis if title is too long
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                    softWrap: true, // Allow text to wrap
                                    maxLines: 2, // Limit to 2 lines for better UI
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // Currently Reading Section with Horizontal Scroll
            _buildSection(
              icon: Icons.menu_book_sharp,
              iconColor: Colors.blueAccent,
              title: 'Currently Reading',
              content: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var title in user.currentlyReading.keys)
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6), // Apply border radius here
                                child: Image.asset(
                                  user.currentlyReading[title]!,
                                  width: 103,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Wrap title with a SizedBox for better spacing
                              SizedBox(
                                width: 103, // Set width to match the image size
                                child: SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'Helvetica',
                                      overflow: TextOverflow.ellipsis, // Adds ellipsis if title is too long
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // Completed Manga Section with Horizontal Scroll
            _buildSection(
              icon: Icons.check_circle,
              iconColor: Colors.greenAccent,
              title: 'Completed Manga',
              content: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var title in user.completedManga.keys)
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6), // Apply border radius here
                                child: Image.asset(
                                  user.completedManga[title]!,
                                  width: 103,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 103, // Set width to match the image size
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Helvetica',
                                    overflow: TextOverflow.ellipsis, // Adds ellipsis if title is too long
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  softWrap: true, // Allow text to wrap
                                  maxLines: 2, // Limit to 2 lines for better UI
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
