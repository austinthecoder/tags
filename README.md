# Tags

A Ruby object that acts like a set of tags.

## Examples

``` ruby
tags = Tags.new("one, two, three")

tags - Tags.new("one, three")
# Tags.new("two")

tags + Tags.new("three, four, five")
# Tags.new("one, two, three, four, five")

tags.to_s
# "one, two, three"

tags.to_a
# ["one", "two", "three"]

# see the tests for more examples
```