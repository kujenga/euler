TARGET := target

$(TARGET)/main: main.rs
	mkdir -p $(dir $@)
	rustc -o $@ $<

.PHONY: run
run: $(TARGET)/main
	./$<

$(TARGET)/tests: main.rs
	mkdir -p $(dir $@)
	rustc --crate-name test -o $@ $< --test

.PHONY: test
test: $(TARGET)/tests
	./$<
