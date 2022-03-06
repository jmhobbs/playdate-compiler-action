# Playdate Compiler Action

This GitHub action compiles your Playdate app.

## Inputs

## `path`

**Required** Path to your source code. Default `"src"`.

## `output`

Name of your output file. Default `"app.pdx"`.

## `strip`

Strip debug symbols. Default `true`.

## `compress`

Compress output files. Default `true`.

## `package`

Create a `.tar.gz` of the `output` after compilation. Default `true`.

## Outputs

## `version`

The version of `pdc` used.

## Example usage

```yaml
uses: jmhobbs/playdate-compiler-action@v1
with:
  path: 'src'
  output: 'party-parrot.pdx'
  strip: true
  compress: true
  package: true
```