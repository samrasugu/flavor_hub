.PHONY: generate
generate:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
	dart run build_runner clean