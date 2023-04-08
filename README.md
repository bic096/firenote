# Firenote
Firenote is a note-taking app built with Flutter that uses Firebase as its backend.  
The app follows Domain Driven Design principles and utilizes the Flutter Bloc library  
for state management.

## Features
* Create, edit, and delete notes
* Organize notes into categories
* Search for notes by keyword
* Sync notes across devices using Firebase Cloud Firestore
## Installation
To install Firenote, follow these steps:

1. Clone the repository to your local machine.
2. Create a new Firebase project and add an Android app to it. Follow the steps provided by  
Firebase to download the google-services.json file and place it in the android/app directory  
of the project.
3. In the Firebase console, enable Cloud Firestore and set up security rules for the database.
4. Run the app on an emulator or physical device using flutter run.
## Usage
To use Firenote, follow these steps:

1. Open the app and sign in with your Google account.
2. Create a new note by tapping the "New Note" button on the home screen.
3. Edit a note by tapping on it in the list and making changes to the content.
4. Delete a note by swiping it to the left in the list and tapping the delete button.
5. Organize notes into categories by using the dropdown menu on the home screen.
6. Search for notes by typing a keyword into the search bar on the home screen.
## Architecture
Firenote follows Domain Driven Design principles and utilizes the Flutter Bloc library for state  
management. The app is organized into the following layers:

* Presentation: The user interface and user input handling.
* Application: Orchestrates the use cases of the app and manages the state of the presentation layer.
* Domain: Contains the business logic and domain models.
* Infrastructure: Implements the repository interfaces and provides the implementation details of the  
Firebase backend.
## Contributing
Contributions to Firenote are welcome! To contribute, follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make changes to the code.
4. Write tests for your changes.
5. Run the tests using flutter test.
6. Submit a pull request to the main branch of the repository.
## License
Firenote is released under the MIT License. See the LICENSE file for details.
