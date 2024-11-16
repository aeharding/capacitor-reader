import { WebPlugin } from '@capacitor/core';

import type { ReaderPlugin } from './definitions';

export class ReaderWeb extends WebPlugin implements ReaderPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
