module Regressor
  module Model
    class Expression

      attr_accessor :subject, :expectation, :matcher, :matcher_expectation, :modification

      def initialize(subject, expectation, matcher, matcher_expectation, modification = nil)
        self.subject = subject
        self.expectation = expectation
        self.matcher = matcher
        self.matcher_expectation = matcher_expectation
        self.modification = modification
      end

      def to_s
        if self.modification.nil?
          "it { #{self.subject}.#{self.expectation} #{self.matcher}(:#{self.matcher_expectation}) }"
        else
          "it { #{self.subject}.#{self.expectation} #{self.matcher}(:#{self.matcher_expectation}).#{self.modification} }"
        end
      end

    end
  end
end