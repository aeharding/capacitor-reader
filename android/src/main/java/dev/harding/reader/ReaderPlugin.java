package dev.harding.reader;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Reader")
public class ReaderPlugin extends Plugin {

    private Reader implementation = new Reader();

    @PluginMethod
    public void open(PluginCall call) {
        String url = call.getString("url");
        if (url == null) {
            call.reject("URL parameter is required");
            return;
        }

        String toolbarColor = call.getString("toolbarColor");

        try {
            implementation.open(bridge.getContext(), url, toolbarColor);
            call.resolve();
        } catch (ReaderException e) {
            call.reject(e.getMessage());
        } catch (Exception e) {
            call.reject("Failed to open reader", e);
        }
    }
}
