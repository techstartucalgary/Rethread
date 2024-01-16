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

## 📝 Contributors

- [Lujaina]() - Project Manager
- [Parsa]() - Frontend Developer
- [Morteza]() - Full Stack Developer
- [Alison]() - Backend Developer
- [Axel](https://github.com/Axeloooo) - Backend Developer
- [Anfaal]() - Backend Developer
- [Ryan]() - Backend Developer

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
