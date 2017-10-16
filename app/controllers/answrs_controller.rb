class AnswrsController < ApplicationController

	def create
		@question = Question.find(params[:id])
		@answer = Answr.new(text: params[:answer], user: current_user, question: @question)
		if @answer.save
			flash[:success] = "your answer added successfully"
			redirect_to question_path(@question)
		end
	end

end