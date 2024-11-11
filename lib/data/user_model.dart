// lib/user_model.dart
class User {
  final String username;
  final String displayName;
  final String bio;
  final String location;
  final String birthday;
  final String profilePicture; // Image path or URL
  final Map<String, String> currentlyReading; // Map of manga titles to image paths/URLs
  final Map<String, String> completedManga; // Map of completed manga titles to image paths/URLs
  final Map<String, String> favoriteManga; // Map of favorite manga titles to image paths/URLs
  final List<String> favoriteGenres; // List of favorite genres (e.g., Shonen, Shojo)
  final int readingStreak; // Consecutive days the user has been reading
  final List<String> achievements; // Achievements or badges
  final String password; // New password field for login

  User({
    required this.username,
    required this.displayName,
    required this.bio,
    required this.location,
    required this.birthday,
    required this.profilePicture,
    required this.currentlyReading,
    required this.completedManga,
    required this.favoriteManga,
    required this.favoriteGenres,
    required this.readingStreak,
    required this.achievements,
    required this.password, // Initialize the password field
  });

// You can also add methods to handle specific operations related to the user.
}
