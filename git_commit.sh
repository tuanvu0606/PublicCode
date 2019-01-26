#!/usr/bin/env bash
git add -A
git commit -m $(git diff HEAD 2>&1 | head -n 5)
git push