# assert

## What this is

Yet another GitHub Actions toolkit for value assertion.

## Why use this

Minimal API. All you have to remember is:

```yml
    - uses: <my name>/assert/<action name>@<ref>
      with:
        x: <value>
        <action name>: <the other value>
```

For example,

```yml
    - uses: wooseopkim/assert/eq@main
      with:
        x: 1
        eq: 1
```

For valid `<action name>` values, see directories in `templates` which have `.env` files.

## Using outputs instead

```yml
    - id: assert
      uses: wooseopkim/assert/eq@main
      with:
        x: 1
        eq: 2
    - if: always()
      run: |
        echo ${{ steps.assert.outputs.ok }}
```
