class CommentsController < ApplicationController


  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "You've posted a new comment!"

      redirect_to company_job_path(@job.company, @job)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
