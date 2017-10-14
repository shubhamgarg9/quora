require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

	def setup
		@user = User.create(username: "bob", email: "bob@example.com")    # hitting a sandbox and not database
		@question = @user.questions.new(text: "cheeti kaali ku hoti h", description: "pata ni ku kar rakha h kambaqt ko kala")
	end

	test "question should be valid" do    # need to set create coz here it would fail otherwise
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

	test "description not be too short" do
		@question.description = "a"*10
		assert_not @question.valid?
	end

	test "chef_id should be present" do
		@question.user_id = nil
		assert_not @question.valid?
	end

	test "description should be present" do
		@question.description = " "
		assert_not @question.valid?
	end


end