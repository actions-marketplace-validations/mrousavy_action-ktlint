# GitHub Action: Run ktlint with reviewdog

This action runs [ktlint](https://ktlint.github.io/) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests
to enforce best practices.

## Examples

### With `github-pr-check`

By default, with `reporter: github-pr-check` an annotation is added to
the line:
![Example comment made by the action, with github-pr-check](./github-pr-check.png)

### With `github-pr-review`

With `reporter: github-pr-review` a comment is added to
the Pull Request Conversation:
![Example comment made by the action, with github-pr-review](./github-pr-review.png)

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`.

## Example usage

```yml
name: reviewdog
on: [pull_request]
jobs:
  ktlint:
    name: Check Code Quality
    runs-on: ubuntu-latest

    steps:
      - name: Clone repo
        uses: actions/checkout@master
        with:
          fetch-depth: 1
      - name: ktlint
        uses: ScaCap/action-ktlint@master
        with:
          github_token: ${{ secrets.github_token }}
```
