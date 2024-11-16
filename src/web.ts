import { WebPlugin } from '@capacitor/core';

import type { ReaderPlugin } from './definitions';

export class ReaderWeb extends WebPlugin implements ReaderPlugin {
  async open(): Promise<void> {
    throw this.unavailable('Not available on web. launch with regular web apis instead');
  }
}
