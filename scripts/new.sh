#!/bin/bash

NAME=""
DRAFT=true

print_usage() {
    echo "${0} <name of the article> [--no-draft]"
}

# Argument parsing
for arg in "$@"; do
    case $arg in
        --no-draft)
            DRAFT=false
            shift
            ;;
        -*)
            echo "Unknown option: $arg"
            print_usage
            exit 1
            ;;
        *)
            if [ -z "$NAME" ]; then
                NAME="$arg"
            fi
            ;;
    esac
done

if [ -z "${NAME}" ]; then
    echo "Please specify a name for the new article!"
    print_usage
    exit 1
fi

SLUG=$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | tr -cd '[:alnum:]-')
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"
ARTICLE_DIRECTORY="${PROJECT_DIR}/content/posts"
ARTICLE_PATH="${ARTICLE_DIRECTORY}/${SLUG}.md"

cat > "${ARTICLE_PATH}" << EOF
---
title: "${NAME}"
date: "$(date +"%Y-%m-%d")"
description: "A description"
draft: ${DRAFT}
---

Intro

<!--more-->

Lorem ipsum
EOF