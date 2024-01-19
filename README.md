# ♻️ ReThread

[![Continuous Integration](https://github.com/techstartucalgary/fashion/actions/workflows/ci.yml/badge.svg)](https://github.com/techstartucalgary/fashion/actions/workflows/ci.yml)
![GitHub repo size](https://img.shields.io/github/repo-size/techstartucalgary/rethread?logo=github&color=blue)
![Github tag](https://img.shields.io/github/v/tag/techstartucalgary/rethread?logo=github&color=red)
![GitHub contributors](https://img.shields.io/github/contributors/techstartucalgary/rethread?logo=github&color=yellow)
![Github pull requests](https://img.shields.io/github/issues-pr/techstartucalgary/rethread?logo=github)
![Github license](https://img.shields.io/github/license/techstartucalgary/rethread?logo=github&color=orange)

## 📖 Table of Contents

- [📝 Contributors](#-contributors)
- [👨‍💻 Tech Stack](#-tech-stack)
- [🚀 Backend Documentation](#-backend-documentation)
  - [🏃 Quick start](#-quick-start)
  - [🛠️ Installation](#️-installation)
  - [🧪 Testing](#-testing)
  - [🚧 Development Environment](#-development-environment)
- [🌟 Frontend Documentation](#-frontend-documentation)
  - [🏃 Quickstart](#-quickstart-1)
  - [🛠️ Setup and Installation](#%EF%B8%8F-setup-and-installation)
  - [🧪 Testing](#-testing-1)
  - [📱 Building and Deployment](#-building-and-deployment)
  - [📚 Additional Resources](#-additional-resources)

## 📝 Contributors

- [Lujaina]() - Project Manager
- [Aminata]() - Business Analyst
- [Mahnaz]() - UX/UI Designer
- [Parsa Kargari](https://github.com/ParsaKargari) - Full Stack Developer
- [Morteza](https://github.com/mortezafa) - Frontend Developer
- [Axel Sanchez](https://github.com/Axeloooo) - Backend Developer
- [Anfaal]() - Backend Developer
- [Ryan]() - Backend Developer
- [Alison]() - Backend Developer
  
## 👨‍💻 Tech Stack

- Frontend

  ![Swift](https://img.shields.io/badge/Swift-F05138.svg?style=for-the-badge&logo=Swift&logoColor=white)
  ![SwiftUI](https://img.shields.io/badge/SwiftUI-2d68f3.svg?style=for-the-badge&logo=Swift&logoColor=black)
  ![Figma](https://img.shields.io/badge/Figma-F24E1E.svg?style=for-the-badge&logo=Figma&logoColor=white)
  ![Xcode](https://img.shields.io/badge/Xcode-1575F9.svg?style=for-the-badge&logo=Xcode&logoColor=white)

- Backend

  ![Typescript](https://img.shields.io/badge/TypeScript-3178C6.svg?style=for-the-badge&logo=TypeScript&logoColor=white)
  ![Express](https://img.shields.io/badge/Express-000000.svg?style=for-the-badge&logo=Express&logoColor=white)
  ![Node.js](https://img.shields.io/badge/Node.js-339933.svg?style=for-the-badge&logo=nodedotjs&logoColor=white)
  ![Prisma](https://img.shields.io/badge/Prisma-5a67d8.svg?style=for-the-badge&logo=Prisma&logoColor=white)
  ![MySQL](https://img.shields.io/badge/MySQL-3e6e93.svg?style=for-the-badge&logo=MySQL&logoColor=white)

- Cloud

  ![PlanetScale](https://img.shields.io/badge/PlanetScale-000000.svg?style=for-the-badge&logo=PlanetScale&logoColor=white)


## 🚀 Backend Documentation

All the code is located in the `backend/src` directory. The backend is written using [Node.js](https://nodejs.org/en/) and [Express](https://expressjs.com/).

### 🏃 Quick start

1. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

2. `cd` into the `fashion` directory.

```bash
cd fashion
```

3. `cd` into the `backend` directory.

```bash
cd backend
```

### 🛠️ Installation

1. Make sure you have `Node.js` and `NPM` installed on your machine. Click [here](https://nodejs.org/en/) to download and install Node.js. Make sure you install the LTS version. NPM is installed automatically when you install Node.js.

2. Open the terminal and run `node -v` to check if `Node.js` is installed.

```bash
node -v
```

3. In the same terminal run `npm -v` to check if `npm` is installed.

```bash
npm -v
```

4. If you see the version number of `Node.js` and `npm` then you are good to go. If not, then try to reinstall `Node.js`.

5. Make sure you have `Docker Desktop` installed on your machine. Click [here](https://www.docker.com/products/docker-desktop) to download and install Docker Desktop. Make sure you install the latest version.

6. Make sure you have `Git` installed on your machine. Click [here](https://git-scm.com/downloads) to download and install Git. Make sure you install the latest version.

7. Open the terminal and run `git -v` to check if `Git` is installed.

```bash
git -v
```

8. If you see the version number of `Git` then you are good to go. If not, then try to reinstall `Git`.

### 🧪 Testing

All the tests are located in the `backend/test` directory. The tests suites are written using [Mocha](https://mochajs.org/) and [Chai](https://www.chaijs.com/).

1. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

2. `cd` into the `backend` directory.

```bash
cd backend
```

3. Run `npm install` to install all the dependencies.

```bash
npm install
```

4. Run `npm run test` to start the server.

```bash
npm run test
```

### 🚧 Development Environment

1. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

2. `cd` into the `fashion` directory.

```bash
cd fashion
```

3. `cd` into the `backend` directory.

```bash
cd backend
```

4. Run `npm install` to install all the dependencies.

```bash
npm install
```

5. Run `npx prisma init` to initialize the database.

```bash
npx prisma init
```

6. Update your `prisma/schema.prisma` file within the `backend` folder to use the `mysql` provider and set the relation mode type to `prisma`.

```prisma
datasource db {
  provider     = "mysql"
  url          = env("DATABASE_URL")
  relationMode = "prisma"
}
```

7. Once you are ready to push your schema to PlanetScale, run `prisma db push` against your PlanetScale database to update the schema in your database.

```bash
npx prisma db push
```


# 🌟 Frontend Documentation

The frontend is crafted for iOS platforms, utilizing Swift and SwiftUI. The code is primarily housed in the `Rethread` directory. This section details the setup, development practices, and testing for the frontend environment.

## 🏃 Quickstart

1. **Clone the Repository**:
    ```bash
    git clone git@github.com:techstartucalgary/fashion.git
    ```

2. **Navigate to the Frontend Directory**:
    ```bash
    cd Rethread
    ```

3. **Open the Project in Xcode**:
    Open the project file `.xcodeproj` in Xcode.

4. **Run the Application**:
    Select an iOS simulator or connected device in Xcode and click 'Run'.

## 🛠️ Setup and Installation

1. **Install Xcode**:
    Ensure you have Xcode installed on your macOS, available through the Mac App Store.

2. **Update Swift and SwiftUI**:
    Ensure you have the latest version of Swift and SwiftUI installed, as they are crucial for frontend development.

3. **Verify the Installation**:
    Open Xcode and check for Swift and SwiftUI updates in the preferences.

4. **Minimum iOS Version**: This app is built for `iOS 16` and above.

## Dependencies and Packages

- **swiftui-introspect**: We use the [swiftui-introspect](https://github.com/siteline/SwiftUI-Introspect) package for advanced introspection of SwiftUI views.

- **swiftui-navigation-transitions**: The [swiftui-navigation-transitions](https://github.com/davdroman/swiftui-navigation-transitions) package is used to add custom transitions to your SwiftUI navigation.

- **AVKit**: We utilize AVKit for video processing within the app.

## 🧪 Testing

- **Unit Testing**: Write unit tests for individual components using XCTest.

- **UI Testing**: Automate UI tests to simulate user interaction with the app.

## 📱 Building and Deployment

- **Build for Testing**: Use Xcode to build the app for testing on simulators or real devices.

- **Deployment**: Prepare the app for deployment to the App Store, internal distribution, or TestFlight.

## 📚 Additional Resources

- **Swift Documentation**: Refer to [Swift Documentation](https://swift.org/documentation/) for language specifics.

- **SwiftUI Tutorials**: Explore [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui) for hands-on learning.

- **Apple Developer Forums**: Utilize [Apple Developer Forums](https://developer.apple.com/forums/) for community support.
