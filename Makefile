# Makefile for Flutter project

# ==============================================================================
# VARIABLES
# ==============================================================================
# Use the Flutter SDK found in the system PATH
SHELL := /bin/bash
FLUTTER_BIN       := flutter
DART_BIN          := dart
PUB_BIN           := pub

# Add Snap to the PATH if it's not already included
ifneq (,$(shell command -v snap))
  ifeq (,$(findstring /snap/bin, $(PATH)))
   export PATH := /snap/bin:$(PATH)
  endif
endif

# ==============================================================================
# CHECKS
# ==============================================================================
# Check for required tools at the start.
ifeq (,$(shell command -v flutter))
    $(error "Flutter SDK not found in your PATH. Please install it (e.g., 'sudo snap install flutter --classic')")
endif

.PHONY: help install test lint lint-fix format run clean setup-hooks test-hooks \
build build-apk build-appbundle build-web build-linux

.DEFAULT_GOAL := help

# ==============================================================================
# GENERAL COMMANDS
# ==============================================================================
help: ## Show this help message
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

install: ## Install project dependencies
	@$(FLUTTER_BIN) pub get

run: ## Run the application in debug mode
	@$(FLUTTER_BIN) run

clean: ## Remove caches and build artifacts
	@$(FLUTTER_BIN) clean

# ==============================================================================
# DEVELOPMENT & QA
# ==============================================================================
test: ## Run the test suite
	@$(FLUTTER_BIN) test

coverage: ## Run tests and generate a coverage report
	@$(FLUTTER_BIN) test --coverage

lint: ## Run linter checks
	@$(FLUTTER_BIN) analyze

lint-fix: ## Run linter checks and apply automatic fixes
	@$(DART_BIN) fix --apply

format: ## Format code with Dart formatter
	@$(DART_BIN) format .

# ==============================================================================
# BUILD COMMANDS
# ==============================================================================
build: build-linux ## Build the project (defaults to Linux)

build-apk: ## Build the Android APK (debug)
	@$(FLUTTER_BIN) build apk

build-appbundle: ## Build the Android App Bundle (release)
	@$(FLUTTER_BIN) build appbundle

build-web: ## Build the Web application
	@$(FLUTTER_BIN) build web

build-linux: ## Build the Linux desktop application
	@$(FLUTTER_BIN) build linux

# ==============================================================================
# GIT HOOKS
# ==============================================================================
setup-hooks: ## Install Git hooks using pre-commit
	@if ! command -v pre-commit &> /dev/null; then \
	   echo "pre-commit not found. Please install it (e.g., 'pip install pre-commit') and make sure it's in your PATH."; \
	   exit 1; \
	fi
	@pre-commit install --hook-type pre-commit
	@pre-commit install --hook-type pre-push
	@pre-commit install-hooks

test-hooks: ## Test Git hooks on all files
	@pre-commit run --all-files --show-diff-on-failure
