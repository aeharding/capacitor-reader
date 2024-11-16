# capacitor-reader

Opens a simplified in app browser, prioritizing readability.

If you're looking for additional functionality, this plugin is not for you. ;)

## Install

```bash
npm install capacitor-reader
npx cap sync
```

## API

<docgen-index>

* [`open(...)`](#open)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### open(...)

```typescript
open(options: CapacitorReaderOpenOptions) => Promise<void>
```

| Param         | Type                                                                              |
| ------------- | --------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#capacitorreaderopenoptions">CapacitorReaderOpenOptions</a></code> |

--------------------


### Interfaces


#### CapacitorReaderOpenOptions

| Prop                          | Type                 | Description                                        | Default            |
| ----------------------------- | -------------------- | -------------------------------------------------- | ------------------ |
| **`url`**                     | <code>string</code>  |                                                    |                    |
| **`toolbarColor`**            | <code>string</code>  | The color of the toolbar                           |                    |
| **`entersReaderIfAvailable`** | <code>boolean</code> | Whether to enter reader mode if available iOS only | <code>false</code> |

</docgen-api>
