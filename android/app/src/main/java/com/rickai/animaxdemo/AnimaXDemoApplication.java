package com.rickai.animaxdemo;

import android.app.Application;
import com.lynx.animax.util.AnimaX;

public final class AnimaXDemoApplication extends Application {
  @Override
  public void onCreate() {
    super.onCreate();
    AnimaX.inst().init(this);
  }
}
