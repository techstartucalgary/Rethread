# ♻️ Fashion

## 🏃 Backend Quickstart

All the code is located in the `backend/src` directory. The backend is written using [Node.js](https://nodejs.org/en/) and [Express](https://expressjs.com/).

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

5. Open the terminal and clone this repository using https or ssh. (The example below uses ssh)

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
npm run start
```

9. Open the browser and go to `http://localhost:8888/` to see the server running.

```bash
http://localhost:8888/
```

## ❤️ Backend health check

To check if the backend is running, open the browser and go to `http://localhost:8888/health`. You should see the following message.

```bash
{"status":"healthy"}
```

## 🧪 Testing the backend

All the tests are located in the `backend/test` directory. The tests suites are written using [Mocha](https://mochajs.org/) and [Chai](https://www.chaijs.com/).

1. Open the terminal and clone this repository using https or ssh. (The example below uses ssh)

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
