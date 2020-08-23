package me.muhrahmatullah.adr_in_app_review

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import me.muhrahmatullah.adr_in_app_review.inappreview.InAppReviewHandler

/** AdrInAppReviewPlugin */
public class AdrInAppReviewPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

  private var activity: Activity? = null

  private lateinit var channel : MethodChannel


  override fun onAttachedToActivity(@NonNull p0: ActivityPluginBinding) {
    activity = p0.getActivity()
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(@NonNull p0: ActivityPluginBinding) {
    activity = p0.getActivity()
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "adr_in_app_review")
    channel.setMethodCallHandler(this)
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "adr_in_app_review")
      val plugin = AdrInAppReviewPlugin()
      plugin.activity = registrar.activity()
      channel.setMethodCallHandler(plugin)
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if(call.method == "startInAppReview") {
      val inAppReviewHandler = activity?.let { InAppReviewHandler(it, result) }
      inAppReviewHandler?.startInAppReviewDialog()
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    activity = null
  }
}
