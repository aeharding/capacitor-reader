import type { PluginListenerHandle } from '@capacitor/core';

export interface CapacitorReaderOpenOptions {
  url: string;
  /**
   * The color of the toolbar
   * @example "#000000"
   */
  toolbarColor?: string;

  /**
   * Whether to enter reader mode if available
   *
   * iOS only
   *
   * @default false
   */
  entersReaderIfAvailable?: boolean;
}

export interface ReaderPlugin {
  /**
   * iOS & Android only
   */
  open(options: CapacitorReaderOpenOptions): Promise<void>;

  /**
   * iOS only: Listen for the browser finished event.
   * It fires when the Browser is closed by the user.
   *
   * This is necessary for those that want to track
   * iOS status taps (since capacitor swizzles all
   * iOS navigation taps)
   */
  addListener(eventName: 'browserFinished', listenerFunc: () => void): Promise<PluginListenerHandle>;
}
