# React Native Device Activity
> Device Activity Events for React Native (iOS and Android)

## Install

```
npm i rn-device-activity --save
```

## Configure

```
react-native link rn-device-activity
```

## Usage

```js
import {DeviceEventEmitter} from "react-native";

function handleResume() {
  // called on resume of app
}

function handlePause() {
  // called on pause of app
}

function handleDestroy() {
  // called on destroy of app
}

// Resume / Pause
DeviceEventEmitter.addListener("deviceResume", handleResume);
DeviceEventEmitter.addListener("devicePause", handlePause);

// Android ONLY
DeviceEventEmitter.addListener("deviceDestroy", handleDestroy);
```
