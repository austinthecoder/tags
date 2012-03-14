require 'spec_helper'

describe Tags do

  describe "instance methods" do
    subject { described_class.new @arg }

    describe "#to_s" do
      context "with a blank string" do
        before { @arg = "" }
        its(:to_s) { should eq("") }
      end

      context "with tags separated by commas or whitespace" do
        before { @arg = "barley, hops water, yeast" }
        its(:to_s) { should eq("barley, hops, water, yeast") }
      end

      context "given nil" do
        before { @arg = nil }
        its(:to_s) { should eq("") }
      end
    end

    describe "#to_a" do
      context "with a blank string" do
        before { @arg = "" }
        its(:to_a) { should eq([]) }
      end

      context "with tags separated by commas or whitespace" do
        before { @arg = "barley, hops water, yeast" }
        its(:to_a) { should eq(%w[barley hops water yeast]) }
      end

      context "with duplicate tags" do
        before { @arg = "barley, hops, barley" }
        it "eliminates duplicates" do
          subject.to_a.should eq(%w[barley hops])
        end
      end

      context "with mixed-case tags" do
        before { @arg = "Barley, hOps, YEAST" }
        it "lowercases the tags" do
          subject.to_a.should eq(%w[barley hops yeast])
        end
      end

      context "with duplicate mixed case tags" do
        before { @arg = "barley, hops, BarlEy" }
        it "eliminates duplicates ignoring case" do
          subject.to_a.should eq(%w[barley hops])
        end
      end
    end

    describe "#+" do
      it "combines tags into one" do
        @arg = "foo, bar"
        result = subject + described_class.new("baz, buz")
        result.should eq(described_class.new("foo, bar, baz, buz"))
      end

      # more examples
      it { (Tags.new(nil) + Tags.new("one")).should eq(Tags.new("one")) }
      it { (Tags.new("one") + Tags.new("one")).should eq(Tags.new("one")) }
      it { (Tags.new("one two") + Tags.new(nil)).should eq(Tags.new("one two")) }
      it { (Tags.new("one two") + Tags.new("three")).should eq(Tags.new("one two three")) }
    end

    describe "#-" do
      it "returns the difference of the tags" do
        @arg = "foo, buz"
        result = subject - described_class.new("baz, buz")
        result.should eq(described_class.new("foo"))
      end

      # more examples
      it { (Tags.new(nil) - Tags.new("one")).should eq(Tags.new(nil)) }
      it { (Tags.new("one") - Tags.new("one")).should eq(Tags.new(nil)) }
      it { (Tags.new("one two") - Tags.new("one")).should eq(Tags.new("two")) }
      it { (Tags.new("one two") - Tags.new("three")).should eq(Tags.new("one two")) }
      it { (Tags.new("one two three") - Tags.new("one three")).should eq(Tags.new("two")) }
    end
  end

end