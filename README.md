# Tourist App for Egypt

This app helps tourists explore Egypt by providing information about landmarks, integrating Google
Maps, and allowing users to manage their profile.

## Features

1. **Profile Picture Management**: Users can upload or remove their profile picture.
2. **Google Maps Integration**: Landmarks are displayed on a map, and users can navigate to them
   using Google Maps.
3. **Fingerprint Authentication**: Users must authenticate via fingerprint to access their profile.

## How to Use

- Clone the repository.
- Run `flutter pub get` to install dependencies.
- Run the app using `flutter run`.

## Dependencies

- `image_picker`: For selecting profile pictures.
- `shared_preferences`: For saving profile pictures locally.
- `google_maps_flutter`: For displaying maps.
- `url_launcher`: For opening Google Maps.
- `local_auth`: For fingerprint authentication.


## Screenshots

| Profile Image               | Map              | Marker                | Auth                 |
|-----------------------------|------------------|-----------------------|----------------------|
| ![Profile Image](login.png) | ![Map](sign.png) | ![Marker](logout.png) | ![Auth](Profile.png) |
