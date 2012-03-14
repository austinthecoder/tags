require 'forwardable'

class Tags
  extend Forwardable
  include Enumerable

  def_delegators :tags, :empty?, :to_ary, :to_a, :each, :size

  def initialize(tags)
    @tags = tags.is_a?(Array) ? tags : tags.to_s.split(/\W+/)
    @tags.each &:downcase!
    @tags.uniq!
  end

  def to_s
    tags.join ', '
  end

  def +(other)
    self.class.new(to_a + other.to_a)
  end

  def -(other)
    self.class.new(to_a - other.to_a)
  end

  def ==(other)
    to_a == Array(other)
  end

private

  attr_reader :tags

end