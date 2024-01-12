# SDKgen Code Generator

This GitHub action integrates the [SDKgen](https://sdkgen.app/) code generator.
It reads the `sdkgen.json` [schema file](https://sdkgen.app/schema) in your current working directory and generates all
defined dependencies, it also automatically commits then generated code to your repository. To obtain a client id and
secret you need to register an account at [sdkgen.app](https://sdkgen.app/).

## Inputs

## `client_id`

**Required** The sdkgen.app client id, this is either your username or an app key.

## `client_secret`

**Required** The sdkgen.app client secret, this is either your password or an app secret.

## Example usage

```yaml
name: SDKgen
on:
  - workflow_dispatch
jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: apioo/sdkgen-generator-action@v0.1.3
        with:
          client_id: '${{ secrets.SDKGEN_CLIENT_ID }}'
          client_secret: '${{ secrets.SDKGEN_CLIENT_SECRET }}'
```
