package me.muhrahmatullah.adr_in_app_review.inappreview

import android.app.Activity
import android.os.Build
import com.google.android.play.core.review.ReviewManagerFactory
import io.flutter.plugin.common.MethodChannel.Result

/**
 * Created by muh.rahmatullah on 23/08/20.
 */
class InAppReviewHandler(private val activityContext: Activity, private val result: Result) {

    fun startInAppReviewDialog() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {

            val manager = ReviewManagerFactory.create(activityContext)
            val request = manager.requestReviewFlow()

            request.addOnCompleteListener {
                if (it.isSuccessful) {
                    val flow = manager.launchReviewFlow(activityContext, it.result)
                    flow.addOnCompleteListener {
                        // The flow has finished. The API does not indicate whether the user
                        // reviewed or not, or even whether the review dialog was shown. Thus, no
                        // matter the result, we continue our app flow.
                        result.success(true)
                    }
                } else {
                    result.error("UNAVAILABLE", "The review flow is unavailable, it might exceed the trigger quota", null)
                }
            }
        } else {
            result.error("UNAVAILABLE", "In app review only support api 21 above", null)
        }


    }

}