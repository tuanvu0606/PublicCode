#!/usr/bin/env bash
git commit -m $(git diff HEAD 2>&1 | head -n 1)
git push