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

  /// `Added to Favorites`
  String get addedToFavorites {
    return Intl.message(
      'Added to Favorites',
      name: 'addedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Favorites`
  String get removedFromFavorites {
    return Intl.message(
      'Removed from Favorites',
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

  /// `Government`
  String get governments {
    return Intl.message(
      'Government',
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

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
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

  /// `Sign UP`
  String get signUP {
    return Intl.message(
      'Sign UP',
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

  /// `First character should be a letter`
  String get firstCapital {
    return Intl.message(
      'First character should be a letter',
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

  /// `Password should be at least 6 characters long`
  String get validPassword {
    return Intl.message(
      'Password should be at least 6 characters long',
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

  /// `Saint Catherine's Monastery`
  String get saint {
    return Intl.message(
      'Saint Catherine\'s Monastery',
      name: 'saint',
      desc: '',
      args: [],
    );
  }

  /// `The Sinai Peninsula in Egypt, located between Africa and Asia, is known for its beautiful landscape and long heritage. It is home to magnificent desert mountains, calm beaches, and hallowed religious locations. The area is popular for hiking, diving, and touring ancient monasteries.`
  String get aboutSinai {
    return Intl.message(
      'The Sinai Peninsula in Egypt, located between Africa and Asia, is known for its beautiful landscape and long heritage. It is home to magnificent desert mountains, calm beaches, and hallowed religious locations. The area is popular for hiking, diving, and touring ancient monasteries.',
      name: 'aboutSinai',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria, Egypt’s second-largest city, is a Mediterranean gem blending history and modernity. Founded by Alexander the Great, it was once the center of knowledge and culture in the ancient world.`
  String get aboutAlex {
    return Intl.message(
      'Alexandria, Egypt’s second-largest city, is a Mediterranean gem blending history and modernity. Founded by Alexander the Great, it was once the center of knowledge and culture in the ancient world.',
      name: 'aboutAlex',
      desc: '',
      args: [],
    );
  }

  /// `Luxor often called the biggest outdoor museum in the world. Its Eastern Bank, which is split by the Nile, represents life, while the West Bank is emblematic of the afterlife. Luxor, a centre of ancient Egyptian history, provides a singular combination of cultural experiences and historical marvels.`
  String get aboutLuxor {
    return Intl.message(
      'Luxor often called the biggest outdoor museum in the world. Its Eastern Bank, which is split by the Nile, represents life, while the West Bank is emblematic of the afterlife. Luxor, a centre of ancient Egyptian history, provides a singular combination of cultural experiences and historical marvels.',
      name: 'aboutLuxor',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria Library: A modern revival of the ancient Library of Alexandria, it serves as a cultural hub with millions of books, art exhibits, and planetarium shows.`
  String get alexLibrary {
    return Intl.message(
      'Alexandria Library: A modern revival of the ancient Library of Alexandria, it serves as a cultural hub with millions of books, art exhibits, and planetarium shows.',
      name: 'alexLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Citadel of Qaitbay: A 15th-century fortress built on the ruins of the ancient Lighthouse of Alexandria, offering stunning sea views and a glimpse into Alexandria’s defensive history.`
  String get qaitbay {
    return Intl.message(
      'Citadel of Qaitbay: A 15th-century fortress built on the ruins of the ancient Lighthouse of Alexandria, offering stunning sea views and a glimpse into Alexandria’s defensive history.',
      name: 'qaitbay',
      desc: '',
      args: [],
    );
  }

  /// `Mount Sinai is a holy location in many religions  where Moses is said to have received the Ten Commandments. Beautiful views may be seen from the summit, particularly at dawn.`
  String get mountSinai {
    return Intl.message(
      'Mount Sinai is a holy location in many religions  where Moses is said to have received the Ten Commandments. Beautiful views may be seen from the summit, particularly at dawn.',
      name: 'mountSinai',
      desc: '',
      args: [],
    );
  }

  /// `Saint Catherine's Monastery i one of the oldest surviving Christian monasteries in the world,  is situated at the base of Mount Sinai. It contains old manuscripts and treasures.`
  String get saintCatherine {
    return Intl.message(
      'Saint Catherine\'s Monastery i one of the oldest surviving Christian monasteries in the world,  is situated at the base of Mount Sinai. It contains old manuscripts and treasures.',
      name: 'saintCatherine',
      desc: '',
      args: [],
    );
  }

  /// `Karnak Temple: a magnificent complex of buildings such as temples, palaces, and obelisks celebrating the Theban gods that shows the artistic and architectural ability of the ancient Egyptians.`
  String get karnak {
    return Intl.message(
      'Karnak Temple: a magnificent complex of buildings such as temples, palaces, and obelisks celebrating the Theban gods that shows the artistic and architectural ability of the ancient Egyptians.',
      name: 'karnak',
      desc: '',
      args: [],
    );
  }

  /// `Valley of the Kings: A royal burial site with over 60 tombs, including Tutankhamun's, adorned with intricate hieroglyphs and stunning wall paintings.`
  String get vallleyOfKings {
    return Intl.message(
      'Valley of the Kings: A royal burial site with over 60 tombs, including Tutankhamun\'s, adorned with intricate hieroglyphs and stunning wall paintings.',
      name: 'vallleyOfKings',
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

  /// `New Here?`
  String get new_here {
    return Intl.message(
      'New Here?',
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

  /// `Please Enter Email`
  String get please_enter_email {
    return Intl.message(
      'Please Enter Email',
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

  /// `Please Enter Password`
  String get please_enter_password {
    return Intl.message(
      'Please Enter Password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 chars.`
  String get password_must_be_at_least_6_chars {
    return Intl.message(
      'Password must be at least 6 chars.',
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

  /// `Login Successful`
  String get login_successful {
    return Intl.message(
      'Login Successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account ?',
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
