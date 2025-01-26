// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Added to favorites`
  String get addedToFavorites {
    return Intl.message(
      'Added to favorites',
      name: 'addedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites`
  String get removedFromFavorites {
    return Intl.message(
      'Removed from favorites',
      name: 'removedFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Governorates`
  String get governments {
    return Intl.message(
      'Governorates',
      name: 'governments',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Places`
  String get places {
    return Intl.message(
      'Places',
      name: 'places',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Places`
  String get suggestedPlaces {
    return Intl.message(
      'Suggested Places',
      name: 'suggestedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Popular Places`
  String get popularPlaces {
    return Intl.message(
      'Popular Places',
      name: 'popularPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Sinai`
  String get sinai {
    return Intl.message(
      'Sinai',
      name: 'sinai',
      desc: '',
      args: [],
    );
  }

  /// `Dahab`
  String get dahab {
    return Intl.message(
      'Dahab',
      name: 'dahab',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get alexandria {
    return Intl.message(
      'Alexandria',
      name: 'alexandria',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get luxor {
    return Intl.message(
      'Luxor',
      name: 'luxor',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Famous Landmarks`
  String get famous_landmarks {
    return Intl.message(
      'Famous Landmarks',
      name: 'famous_landmarks',
      desc: '',
      args: [],
    );
  }

  /// `Mount Sinai`
  String get mount {
    return Intl.message(
      'Mount Sinai',
      name: 'mount',
      desc: '',
      args: [],
    );
  }

  /// `Saint Catherine Monastery`
  String get saint {
    return Intl.message(
      'Saint Catherine Monastery',
      name: 'saint',
      desc: '',
      args: [],
    );
  }

  /// `The Sinai Peninsula in Egypt, located between Africa and Asia, is known for its natural beauty and ancient heritage. It features stunning desert mountains, tranquil beaches, and sacred religious sites. The area is famous for hiking, diving, and visiting ancient monasteries.`
  String get aboutSinai {
    return Intl.message(
      'The Sinai Peninsula in Egypt, located between Africa and Asia, is known for its natural beauty and ancient heritage. It features stunning desert mountains, tranquil beaches, and sacred religious sites. The area is famous for hiking, diving, and visiting ancient monasteries.',
      name: 'aboutSinai',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria, Egypt's second-largest city, is a Mediterranean gem where history and modernity blend. Founded by Alexander the Great, it was a center of knowledge and culture in the ancient world.`
  String get aboutAlex {
    return Intl.message(
      'Alexandria, Egypt\'s second-largest city, is a Mediterranean gem where history and modernity blend. Founded by Alexander the Great, it was a center of knowledge and culture in the ancient world.',
      name: 'aboutAlex',
      desc: '',
      args: [],
    );
  }

  /// `Luxor is known as the 'world's greatest open-air museum.' The east bank of the Nile represents life, while the west bank symbolizes the afterlife. Luxor is a hub of ancient Egyptian history and offers a unique blend of cultural experiences and historical wonders.`
  String get aboutLuxor {
    return Intl.message(
      'Luxor is known as the \'world\'s greatest open-air museum.\' The east bank of the Nile represents life, while the west bank symbolizes the afterlife. Luxor is a hub of ancient Egyptian history and offers a unique blend of cultural experiences and historical wonders.',
      name: 'aboutLuxor',
      desc: '',
      args: [],
    );
  }

  /// `Library of Alexandria: A modern revival of the ancient library, it serves as a cultural center housing millions of books, art exhibitions, and planetarium shows.`
  String get alexLibrary {
    return Intl.message(
      'Library of Alexandria: A modern revival of the ancient library, it serves as a cultural center housing millions of books, art exhibitions, and planetarium shows.',
      name: 'alexLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Qaitbay Citadel: A 15th-century fortress built on the ruins of the ancient Lighthouse of Alexandria, offering stunning sea views and a glimpse into Alexandria's defensive history.`
  String get qaitbay {
    return Intl.message(
      'Qaitbay Citadel: A 15th-century fortress built on the ruins of the ancient Lighthouse of Alexandria, offering stunning sea views and a glimpse into Alexandria\'s defensive history.',
      name: 'qaitbay',
      desc: '',
      args: [],
    );
  }

  /// `Mount Sinai: A sacred site in many religions, believed to be where Moses received the Ten Commandments. The summit offers breathtaking views, especially at sunrise.`
  String get mountSinai {
    return Intl.message(
      'Mount Sinai: A sacred site in many religions, believed to be where Moses received the Ten Commandments. The summit offers breathtaking views, especially at sunrise.',
      name: 'mountSinai',
      desc: '',
      args: [],
    );
  }

  /// `Saint Catherine Monastery: One of the oldest Christian monasteries in the world, located at the foot of Mount Sinai. It houses ancient manuscripts and treasures.`
  String get saintCatherine {
    return Intl.message(
      'Saint Catherine Monastery: One of the oldest Christian monasteries in the world, located at the foot of Mount Sinai. It houses ancient manuscripts and treasures.',
      name: 'saintCatherine',
      desc: '',
      args: [],
    );
  }

  /// `Karnak Temple: A magnificent complex featuring structures like temples, palaces, and obelisks dedicated to the Theban gods, showcasing the artistic and architectural prowess of ancient Egyptians.`
  String get karnak {
    return Intl.message(
      'Karnak Temple: A magnificent complex featuring structures like temples, palaces, and obelisks dedicated to the Theban gods, showcasing the artistic and architectural prowess of ancient Egyptians.',
      name: 'karnak',
      desc: '',
      args: [],
    );
  }

  /// `Valley of the Kings: A royal burial site with over 60 tombs, including that of Tutankhamun, adorned with hieroglyphic inscriptions and stunning wall paintings.`
  String get valleyOfKings {
    return Intl.message(
      'Valley of the Kings: A royal burial site with over 60 tombs, including that of Tutankhamun, adorned with hieroglyphic inscriptions and stunning wall paintings.',
      name: 'valleyOfKings',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUP {
    return Intl.message(
      'Sign Up',
      name: 'signUP',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get enterName {
    return Intl.message(
      'Please enter your full name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get enterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get enterConfirmPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `First letter must be capitalized`
  String get firstCapital {
    return Intl.message(
      'First letter must be capitalized',
      name: 'firstCapital',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get validEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'validEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get validPassword {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'validPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsMatch',
      desc: '',
      args: [],
    );
  }

  /// `Tourist Guide App`
  String get tourist_guide_app {
    return Intl.message(
      'Tourist Guide App',
      name: 'tourist_guide_app',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `New here?`
  String get new_here {
    return Intl.message(
      'New here?',
      name: 'new_here',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get do_not_have_an_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'do_not_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters.`
  String get password_must_be_at_least_6_chars {
    return Intl.message(
      'Password must be at least 6 characters.',
      name: 'password_must_be_at_least_6_chars',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalid_email_or_password {
    return Intl.message(
      'Invalid email or password',
      name: 'invalid_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_successful {
    return Intl.message(
      'Login successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get profile_details {
    return Intl.message(
      'Profile Details',
      name: 'profile_details',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as Guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `User data saved successfully!`
  String get userDataSavedSuccessfully {
    return Intl.message(
      'User data saved successfully!',
      name: 'userDataSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is empty!`
  String get phoneNumberIsEmpty {
    return Intl.message(
      'Phone number is empty!',
      name: 'phoneNumberIsEmpty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
