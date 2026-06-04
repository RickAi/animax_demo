package com.rickai.animaxdemo;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.lynx.animax.ui.AnimaXView;
import com.lynx.animax.ui.ObjectFit;
import com.lynx.animax.util.UriUtil;

public final class MainActivity extends Activity {
  private AnimaXView animaxView;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    FrameLayout root = new FrameLayout(this);
    root.setBackgroundColor(Color.rgb(250, 250, 250));

    animaxView = new AnimaXView(this);
    animaxView.setObjectFit(ObjectFit.CONTAIN);
    animaxView.setAutoPlay(true);
    animaxView.setLoop(true);
    animaxView.setSrc(UriUtil.fromLocalAsset("sample/simple_shape.json"));

    int size = (int) (280 * getResources().getDisplayMetrics().density);
    FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size);
    params.gravity = Gravity.CENTER;
    root.addView(animaxView, params);

    setContentView(root, new ViewGroup.LayoutParams(
        ViewGroup.LayoutParams.MATCH_PARENT,
        ViewGroup.LayoutParams.MATCH_PARENT));
  }

  @Override
  protected void onDestroy() {
    if (animaxView != null) {
      animaxView.release();
      animaxView = null;
    }
    super.onDestroy();
  }
}
