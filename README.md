# ReCaps

ReCaps is an app that lets you create "memory capsules," digital objects that include a title, a description, and a set of images. Each capsule is a way to save your most meaningful moments, ready to be revisited anytime.

The app uses **SwiftData** to ensure data persistence, so your capsules are always available even after closing the app.

## Key Features

- **Create memory capsules**: Assign a title, description, and add images from your gallery.
- **Data persistence**: Thanks to SwiftData, all capsules are saved locally on the device.
- **Intuitive interface**: Clean and easy-to-use design, developed with SwiftUI.

## Project Structure

- **Model**:
  - `DataItem.swift`: Defines the data model for a memory capsule.
  - `Photo.swift`: Manages the image data associated with capsules.

- **View**:
  - `MainPageView.swift`: The main interface displaying all memory capsules.
  - `CapsuleView.swift`: Shows an overview of a single capsule.
  - `CapsuleDetailView.swift`: Allows viewing the details of a capsule, including title, description, and images.
  - `ImportImageView.swift`: Handles image importing from the user's library.
  - `ModalView.swift`: Displays modals for additional actions or confirmations.

