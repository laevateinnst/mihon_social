// lib/data/sample_data.dart
import 'user_model.dart';

List<User> sampleUsers = [
User(
  username: 'laevateinn',
  displayName: 'Karla Yzabela Santos',
  bio: "In the solitude, I felt the liberty you speak of. But I also felt your absence.\n— Céline Sciamma, *Portrait of a Lady on Fire*",
  location: 'Pampanga, Philippines',
  profilePicture: 'assets/images/laevateinn.jpg',
  birthday: 'April 28, 2003',// Example path for profile picture
  currentlyReading: {
    'Campfire Cooking in Another World': 'assets/images/campfire-cooking.jpg', // Example cover images
    'Dandadan': 'assets/images/dandadan.jpg',
    'Dysfunctional Family Therapy': 'assets/images/dysfunctional.jpeg',
    'Gokurakugai': 'assets/images/gokurakugai.jpg',
    'Windbreaker': 'assets/images/windbreaker.jpg',
  },
  completedManga: {
    'Bloom Into You': 'assets/images/bloom-into-you.jpg',
    'Death Note': 'assets/images/death-note.jpg',
  },
  favoriteManga: {
    'Dr. STONE': 'assets/images/dr-stone.jpg',
    'Steins;Gate': 'assets/images/steinsgate.jpg',
    'How Do We Relationship': 'assets/images/hdwr.jpg',
    'Hunter x Hunter': 'assets/images/hunterxhunter.jpg',
    'Chainsaw Man': 'assets/images/chainsaw-man.jpg',
    'Campfire Cooking in Another World': 'assets/images/campfire-cooking.jpg',
    'Windbreaker': 'assets/images/windbreaker.jpg',
  },
  favoriteGenres: ['Isekai', 'Action', 'Adventure', 'Yuri', 'Mystery', 'Shoujo Ai', 'Sci-Fi'],
  readingStreak: 10, // Example streak
  achievements: ['Read for 10 consecutive days', 'Completed a manga recently'],
  password: 'password1', // Password for login
  ),
  User(
    username: 'burgerwithpickl',
    displayName: 'Zak Roberto',
    bio: "Trust is not given, it's forged.",
    location: 'Laguna, Philippines',
    profilePicture: 'assets/images/burgerwithpickl.jfif',
    birthday: 'December 26, 2003', // Example path for profile picture
    currentlyReading: {
      'Spy x Family': 'assets/images/spy-family.jpg',
      'Tokyo Ghoul': 'assets/images/tokyo-ghoul.jpg',
      'One Punch Man': 'assets/images/one-punch-man.png',
      'Mushoku Tensei': 'assets/images/mushoku-tensei.jpg',
    },
    completedManga: {
      'Akira': 'assets/images/akira.jpg',
      'Slam Dunk': 'assets/images/slam-dunk.jpg',
      'Yu Yu Hakusho': 'assets/images/yu-yu-hakusho.jpg',
      'Attack on Titan': 'assets/images/attack-on-titan.jpg',
      'Cowboy Bebop': 'assets/images/cowboy-bebop.jpg',
    },
    favoriteManga: {
      'Demon Slayer': 'assets/images/demon-slayer.jpg',
      'How Do We Relationship' : 'assets/images/hdwr.jpg',
      'Berserk': 'assets/images/berserk.jpg',
      'The Promised Neverland': 'assets/images/the-promised-neverland.jpg',
      'Vinland Saga': 'assets/images/vinland-saga.jpg',
      'Mob Psycho 100': 'assets/images/mob-psycho-100.jpg',
    },
    favoriteGenres: ['Romance', 'Drama', 'Slice of Life', 'Comedy', 'Action', 'Fantasy', 'Supernatural'],
    readingStreak: 20, // Updated streak
    achievements: ['Completed 3 manga in a week', 'Read for 20 consecutive days'],
    password: 'password2', // Password for login
  ),
];
