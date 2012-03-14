require 'spec_helper'

describe Tags do

  describe "#to_s" do
    it { Tags.new("one two").to_s.should eq("one two") }
    it { Tags.new.to_s.should eq("") }
  end

  describe "#to_a" do
    it { Tags.new("one two").to_a.should eq(["one", "two"]) }
    it { Tags.new.to_a.should eq([]) }
  end

  describe "#to_set" do
    it { Tags.new("one two").to_set.should eq(Set.new(["one", "two"])) }
    it { Tags.new.to_set.should eq(Set.new) }
  end

  describe "#-" do
    context "with a Tags" do
      it { (Tags.new - Tags.new("one")).should eq(Tags.new) }
      it { (Tags.new("one") - Tags.new("one")).should eq(Tags.new) }
      it { (Tags.new("one two") - Tags.new("one")).should eq(Tags.new("two")) }
      it { (Tags.new("one two") - Tags.new("three")).should eq(Tags.new("one two")) }
      it { (Tags.new("one two three") - Tags.new("one three")).should eq(Tags.new("two")) }
    end

    it "argument must be of the Tags type" do
      lambda do
        Tags.new("one") - ["one"]
      end.should raise_error(ArgumentError, "must be a Tags object")
    end
  end

  describe "#+" do
    context "with a Tags" do
      it { (Tags.new + Tags.new("one")).should eq(Tags.new("one")) }
      it { (Tags.new("one") + Tags.new("one")).should eq(Tags.new("one")) }
      it { (Tags.new("one two") + Tags.new).should eq(Tags.new("one two")) }
      it { (Tags.new("one two") + Tags.new("three")).should eq(Tags.new("one two three")) }
    end

    it "argument must be of the Tags type" do
      lambda do
        Tags.new("one") + ["one"]
      end.should raise_error(ArgumentError, "must be a Tags object")
    end
  end

  describe "#==" do
    context "with a Tags containing the same items" do
      it { Tags.new("one two").should eq(Tags.new("one two")) }
      it { Tags.new("one two three").should eq(Tags.new("one two three")) }
      it { Tags.new("one two").should eq(Tags.new("one two")) }
      it { Tags.new.should eq(Tags.new) }

      it { Tags.new("one two").should_not eq(Tags.new("one two three")) }
      it { Tags.new.should_not eq(Tags.new("one two three")) }
    end

    context "with a non-Tags" do
      it { Tags.new("one").should_not eq("str") }
      it { Tags.new("one").should_not eq(["str"]) }
      it { Tags.new("one").should_not eq(Set.new(["str"])) }
      it { Tags.new.should_not eq(nil) }
    end
  end

end