# ♻️ ReThread

[![Continuous Integration](https://github.com/techstartucalgary/fashion/actions/workflows/ci.yml/badge.svg)](https://github.com/techstartucalgary/fashion/actions/workflows/ci.yml)

## 📖 Table of Contents

- [📝 Contributors](#-contributors)
- [👨‍💻 Teck Stack](#-tech-stack)
- [🚀 Backend Documentation](#-backend-documentation)
  - [🏃 Quickstart](#-quickstart)
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
  ![Xcode](https://img.shields.io/badge/Xcode-1575F9.svg?style=for-the-badge&logo=Xcode&logoColor=white)
  ![Figma](https://img.shields.io/badge/Figma-F24E1E.svg?style=for-the-badge&logo=Figma&logoColor=white)
  
  - Testing

    ![XCTest](https://img.shields.io/badge/XCTest-6ACD4D.svg?style=for-the-badge&logo=Apple&logoColor=white)

- Backend

  ![Typescript](https://img.shields.io/badge/TypeScript-1575F9.svg?style=for-the-badge&logo=TypeScript&logoColor=white)
  ![Node.js](https://img.shields.io/badge/Node.js-339933.svg?style=for-the-badge&logo=nodedotjs&logoColor=white)
  ![Express](https://img.shields.io/badge/Express-000000.svg?style=for-the-badge&logo=Express&logoColor=white)
  ![OpenAI](https://img.shields.io/badge/OpenAI-00b48c.svg?style=for-the-badge&logo=OpenAI&logoColor=white)
  
  - Testing

    ![Mocha](https://img.shields.io/badge/Mocha-8D6748.svg?style=for-the-badge&logo=Mocha&logoColor=white)
    ![Chai](https://img.shields.io/badge/Chai-A30701.svg?style=for-the-badge&logo=Chai&logoColor=white)

- Database

  ![Prisma](https://img.shields.io/badge/Prisma-5a67d8.svg?style=for-the-badge&logo=Prisma&logoColor=white)
  ![MySQL](https://img.shields.io/badge/MySQL-3e6e93.svg?style=for-the-badge&logo=MySQL&logoColor=white)
  ![Redis](https://img.shields.io/badge/redis-DC382D.svg?style=for-the-badge&logo=redis&logoColor=white)

- CI/CD

  ![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-000000.svg?style=for-the-badge&logo=GitHub%20Actions&logoColor=white)
  ![Docker](https://img.shields.io/badge/Docker-2496ED.svg?style=for-the-badge&logo=Docker&logoColor=white)


## 🚀 Backend Documentation

All the code is located in the `backend/src` directory. The backend is written using [Node.js](https://nodejs.org/en/) and [Express](https://expressjs.com/).

### 🏃 Quickstart

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

4. Run `npm install --only=production` to install all the dependencies.

```bash
npm install
```

5. Run `docker-compose up -d` to start the database.

```bash
docker-compose up -d
```

6. Run `npm run start` to start the server.

```bash
npm run start
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

6. Open the terminal and run `docker -v` to check if `Docker` is installed.

```bash
docker -v
```

8. In the same terminal run `docker-compose -v` to check if `Docker Compose` is installed.

```bash
docker-compose -v
```

9. If you see the version number of `Docker` and `Docker Compose` then you are good to go. If not, then try to reinstall `Docker Desktop`.

10. Make sure you have `Git` installed on your machine. Click [here](https://git-scm.com/downloads) to download and install Git. Make sure you install the latest version.

11. Open the terminal and run `git -v` to check if `Git` is installed.

```bash
git -v
```

12. If you see the version number of `Git` then you are good to go. If not, then try to reinstall `Git`.

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

5. Run `docker-compose up -d` to start the database.

```bash
docker-compose up -d
```

6. Run `npm run dev` to start the development server.

```bash
npm run dev
```

7. Run `npx prisma studio` to open Prisma Studio and view the database schema (Optional).

```bash
npx prisma studio
```


# 🌟 Frontend Documentation

The frontend  is crafted for iOS platforms, utilizing Swift and SwiftUI. The code is primarily housed in the `Rethread` directory. This section details the setup, development practices, and testing for the frontend environment.

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

## 🧪 Testing

- **Unit Testing**: Write unit tests for individual components using XCTest.
- **UI Testing**: Automate UI tests to simulate user interaction with the app.

## 📱 Building and Deployment

- **Build for Testing**: Use Xcode to build the app for testing on simulators or real devices.
- **Deployment**: Prepare App for deployment to the App Store, internal distribution, or TestFlight.

## 📚 Additional Resources

- **Swift Documentation**: Refer to [Swift Documentation](https://swift.org/documentation/) for language specifics.
- **SwiftUI Tutorials**: Explore [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui) for hands-on learning.
- **Apple Developer Forums**: Utilize [Apple Developer Forums](https://developer.apple.com/forums/) for community support.


