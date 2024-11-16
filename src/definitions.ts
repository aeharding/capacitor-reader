export interface ReaderPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
