# ♻️ Fashion

## 🚀 Backend Documentation

All the code is located in the `backend/src` directory. The backend is written using [Node.js](https://nodejs.org/en/) and [Express](https://expressjs.com/).

### 🏃 Quickstart with Node.js

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

5. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

6. `cd` into the `backend` directory.

```bash
cd backend
```

7. Run `npm install --only=production` to install all the dependencies.

```bash
npm install --only=production
```

8. Run `npm run start` to start the server.

```bash
npm run start
```

9. Open the browser and go to `http://localhost:8080/` to see the server running.

```bash
http://localhost:8080/
```

### 🐳 Quickstart with Docker

1. Make sure you have `Docker` installed on your machine. Click [here](https://docs.docker.com/get-docker/) to download and install Docker.

2. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

3. `cd` into the `backend` directory.

```bash
cd backend
```

4. Run `docker-compose up` to start the server.

```bash
docker-compose -f docker-compose.prod.yml up -d
```

5. Open the browser and go to `http://localhost:8080/` to see the server running.

```bash
http://localhost:8080/
```

### ❤️ Health check

To check if the backend is running, open the browser and go to `http://localhost:8080/api/v1/health`. You should see the following message.

```bash
{"status":"healthy"}
```

### 🚧 Development Environment

Using Docker (Recommended)

1. Make sure you have `Docker` installed on your machine. Click [here](https://docs.docker.com/get-docker/) to download and install Docker.

2. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

3. `cd` into the `backend` directory.

```bash
cd backend
```

4. Run `docker-compose up` to start the server.

```bash
docker-compose -f docker-compose.dev.yml up -d
```

5. Open the browser and go to `http://localhost:8080/` to see the server running.

```bash
http://localhost:8080/
```

Using Node.js

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

5. Open the terminal and clone this repository using HTTPS or SSH (The example below uses SSH).

```bash
git clone git@github.com:techstartucalgary/fashion.git
```

6. `cd` into the `backend` directory.

```bash
cd backend
```

7. Run `npm install` to install all the dependencies.

```bash
npm install
```

8. Run `npm run start` to start the server.

```bash
npm run dev
```

9. Open the browser and go to `http://localhost:8080/` to see the server running.

```bash
http://localhost:8080/
```

Environment Variables

The environment variables must be located in the `backend/.env` file (If not such file exists, create one). The following environment variables are required to run the server.

```bash
PORT=<port number>
```

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
