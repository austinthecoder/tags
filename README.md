# Tags

A Ruby object that acts like a set of tags.

## Current API

### Removing tags

``` ruby
Tags.new("one two three") - Tags.new("one three")
# Tags.new("two")
```

### Adding tags

``` ruby
Tags.new("one two three") - Tags.new("three four five")
# Tags.new("one two three four five")
```

### Conversions

``` ruby
Tags.new("one two three").to_s
# "one two three"

Tags.new("one two three").to_a
# ["one", "two", "three"]

Tags.new("one two three").to_set
# #<Set: {"one", "two", "three"}>
```