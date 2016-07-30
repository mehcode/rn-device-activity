package com.mehcode.reactnative.deviceactivity;

import android.bluetooth.BluetoothAdapter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.provider.Settings.Secure;

import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Nullable;

public class RNDeviceActivityModule extends ReactContextBaseJavaModule implements LifecycleEventListener {
    public RNDeviceActivityModule(ReactApplicationContext reactContext) {
        super(reactContext);

        reactContext.addLifecycleEventListener(this);
    }

    @Override
    public String getName() {
        return "RNDeviceActivity";
    }

    private void emit(String eventName) {
        getReactApplicationContext().
                getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).
                emit("RNDeviceActivity:" + eventName, null);
    }

    @Override
    public void onHostResume() {
        // Actvity `onResume`
        emit("deviceResume");
    }

    @Override
    public void onHostPause() {
        // Actvity `onPause`
        emit("devicePause");
    }

    @Override
    public void onHostDestroy() {
        // Actvity `onDestroy`
        emit("deviceDestroy");
    }
}
