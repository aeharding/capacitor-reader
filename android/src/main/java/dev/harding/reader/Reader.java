package dev.harding.reader;

import android.content.Context;
import android.graphics.Color;
import android.net.Uri;

import androidx.browser.customtabs.CustomTabColorSchemeParams;
import androidx.browser.customtabs.CustomTabsIntent;

public class Reader {
    public void open(Context context, String url, String toolbarColor) throws ReaderException {
        // Validate URL scheme
        Uri uri = Uri.parse(url);
        String scheme = uri.getScheme();
        if (scheme == null || (!scheme.equalsIgnoreCase("http") && !scheme.equalsIgnoreCase("https"))) {
            throw new ReaderException("The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported.");
        }

        CustomTabsIntent.Builder builder = new CustomTabsIntent.Builder();
        CustomTabColorSchemeParams.Builder params = new CustomTabColorSchemeParams.Builder();

        if (toolbarColor != null && !toolbarColor.isEmpty()) {
            params.setToolbarColor(Color.parseColor(toolbarColor));
        }

        CustomTabColorSchemeParams builtParams = params.build();

        builder.setDefaultColorSchemeParams(builtParams);
        builder.setColorSchemeParams(CustomTabsIntent.COLOR_SCHEME_DARK, builtParams);

        CustomTabsIntent customTabsIntent = builder.build();

        customTabsIntent.launchUrl(context, Uri.parse(url));
    }
}
