#!/bin/sh

cd "$GITHUB_WORKSPACE"

echo PWD: "$(pwd)"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

echo KtLint version: "$(ktlint --version)"

ktlint --color --reporter=checkstyle "android/**/*.kt*" \
  | tee >("reviewdog -f=checkstyle -name=ktlint -reporter=github-pr-review -fail-on-error=true")
