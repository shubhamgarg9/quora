class QuestionsController < ApplicationController

	def index
		@questions = Question.all	
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

	private

		def question_params
			params.require(:question).permit(:text, :description)
		end

end