# assert

## What this is

Yet another GitHub Actions toolkit for value assertion.

## Why use this

Minimal API. All you have to remember is:

```yml
    - uses: <my name>/assert/<action name>
      with:
        x: <value>
        <action name>: <the other value>
```

For example,

```yml
    - uses: wooseopkim/assert/eq
      with:
        x: 1
        eq: 1
```

## Using outputs instead

```yml
    - id: assert
      uses: wooseopkim/assert/eq
      with:
        x: 1
        eq: 2
    - if: always()
      run:
        echo ${{ steps.assert.outputs.ok }}
```
