.PHONY: release test check-version check-version-number check-build compile package

MVN=mvn
POM=pom.xml
VERSION=$(shell grep -m1 '<version>' $(POM) | sed -E 's/.*<version>(.*)<\/version>.*/\1/')
VERSION_NUMBER = $(shell echo $(VERSION) | sed 's/-SNAPSHOT//')
DEV_VERSION=$(VERSION_NUMBER)-SNAPSHOT

check-version:
	@echo "Current version is: $(VERSION)"
	@if echo "$(VERSION)" | grep -q "SNAPSHOT"; then \
		echo "Development build: $(VERSION_NUMBER)"; \
	else \
		echo "Release build: $(VERSION_NUMBER)"; \
	fi

check-version-number:
	@echo "Current version number is: $(VERSION_NUMBER)"


check-build:
	@if echo "$(VERSION)" | grep -q "SNAPSHOT"; then \
		echo "Development build (SNAPSHOT detected)"; \
	else \
		echo "Release version is: $(VERSION)"; \
	fi

compile:
	@echo "Compiling the project..."
	@$(MVN) clean compile

package:
	@echo "Packaging the project..."
	@$(MVN) package


test:
	@echo "Running tests..."
	@$(MVN) test

push-tags:
	@echo "Pushing tags to remote repository..."
	@git push --tags

# release:
# 	@echo "Usage: make release-VERSION (e.g., make release-0.2.0)"

# release-%:
# 	@./script/release_version.sh $*


version-release-%:
	@echo "Setting version to $* for release"
	sed -i 's/<version>$(VERSION)<\/version>/<version>$*<\/version>/' $(POM)
	git tag -a "v$*" -m "Release version $*"
	git push origin "v$*"
	@echo "Pushed release tag v$*"

version-development-%:
	@echo "Setting version to $*-SNAPSHOT for development"
	sed -i 's/<version>$(VERSION)<\/version>/<version>$*-SNAPSHOT<\/version>/' $(POM)
	@echo "Pushed development tag v$*"


help:
	@echo "Available targets:"
	@echo "  compile                - Compile the project"
	@echo "  package                - Package the project"
	@echo "  test                   - Run tests"
	@echo "  check-version          - Check current version"
	@echo "  check-version-number   - Check current version number"
	@echo "  check-build            - Check if it's a development or release build"
	@echo "  version-release-VERSION - Set version for release"
	@echo "  version-development-VERSION - Set version for development (SNAPSHOT)"

