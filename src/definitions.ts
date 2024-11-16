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
  open(options: CapacitorReaderOpenOptions): Promise<void>;
}
