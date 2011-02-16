require 'set'
require 'active_support'

class Tags

  include Comparable

  ##################################################

  def initialize(str_or_ary = nil)
    ary = str_or_ary.is_a?(Array) ? str_or_ary : str_or_ary.to_s.split(' ')
    @tags_set = Set.new(ary)
  end

  def to_s
    to_a.join(' ')
  end

  def to_a
    tags_set.to_a
  end

  def to_set
    tags_set.dup
  end

  def -(other)
    raise ArgumentError, "must be a #{self.class} object" unless other.is_a?(self.class)
    ary_diff = (tags_set - other.to_set).to_a
    self.class.new(ary_diff)
  end

  def +(other)
    raise ArgumentError, "must be a #{self.class} object" unless other.is_a?(self.class)
    ary_add = (tags_set + other.to_set).to_a
    self.class.new(ary_add)
  end

  def <=>(other)
    tags_set <=> other.to_set
  end

  ##################################################
  private

  attr_reader :tags_set

end