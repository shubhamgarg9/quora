require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

	def setup
		@question = Question.new(text: "cheeti kaali ku hoti h", description: "pata ni ku kar rakha h kambaqt ko kala")
	end

	test "question should be valid" do
		assert @question.valid?
	end

	test "question should be present" do
		@question.text = " "
		assert_not @question.valid?
	end

	test "question not be too long" do
		@question.text = "a" * 101
		assert_not @question.valid?
	end

	test "question not to be too short" do
		@question.text = "aaaa"
		assert_not @question.valid?
	end

	test "description not to be too long" do
		@question.description = "a" * 401
		assert_not @question.valid?
	end

end