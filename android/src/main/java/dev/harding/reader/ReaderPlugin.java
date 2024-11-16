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
        String toolbarColor = call.getString("toolbarColor");

        implementation.open(bridge.getContext(), url, toolbarColor);
        call.resolve();
    }
}
