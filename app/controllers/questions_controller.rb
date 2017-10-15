class QuestionsController < ApplicationController

	before_action :set_question, only: [:edit, :update, :show, :follow_question]
	before_action :require_user, except: [:show,:index]
	before_action :require_same_user, only: [:edit, :update]

	def index
		@questions = Question.paginate(page: params[:page], per_page: 4)
	end

	def show
		@question = Question.find(params[:id])
	end

	def new 
		@question = Question.new
	end

	def create
		@question  = Question.new(question_params)
		@question.user = current_user
		if @question.save
			flash[:success] = "your question got created successfully"
			redirect_to questions_path
		else
			render :new
		end
	end

	def edit

	end

	def update
		if @question.update(question_params)
			flash[:success] = "question updated"
			redirect_to question_path(@question)		
		else
			redirect_to :edit
		end
	end

	def follow_question
		follow = FollowQuestion.create(follow: params[:follow], user: current_user, question: @question)
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

		def set_question
			@question = Question.find(params[:id])
		end

		def require_same_user
			if current_user != @question.user
				flash[:danger] = "you can edit your only"
				redirect_to question_path
			end
		end

end