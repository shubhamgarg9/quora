class QuestionsController < ApplicationController

	def index
		@questions = Question.all.sort_by{|follow_questions| follow_questions.thumbs_up_total}.reverse
	end

	def show
		@question = Question.find(params[:id])
	end

	def new 
		@question = Question.new
	end

	def create
		@question  = Question.new(question_params)
		@question.user = User.find(4)

		if @question.save
			flash[:success] = "your question got created successfully"
			redirect_to questions_path
		else
			render :new
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			flash[:success] = "question updated"
			redirect_to question_path(@question)		
		else
			redirect_to :edit
		end
	end

	def follow_question
		@question = Question.find(params[:id])
		follow = FollowQuestion.create(follow: params[:follow], user: User.find(4), question: @question)
		if follow.valid?
			flash[:success] = "your selection was successful"
			redirect_to :back
		else
			flash[:danger] = "you can follow or unfollow only once"
			redirect_to :back
		end
	end

	private

		def question_params
			params.require(:question).permit(:text, :description, :picture)
		end

end