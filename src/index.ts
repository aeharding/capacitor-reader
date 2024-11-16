import { registerPlugin } from '@capacitor/core';

import type { ReaderPlugin } from './definitions';

const Reader = registerPlugin<ReaderPlugin>('Reader', {
  web: () => import('./web').then((m) => new m.ReaderWeb()),
});

export * from './definitions';
export { Reader };
