class EvaluationsController < ApplicationController
  # For a page to list all evaluations (GET)
  # Named route: evaluations_path
  def index
    @evaluations = Evaluation.all
  end

  # For a page to show evaluation (GET)
  # Named route: evaluation_path(evaluation)
  def show
    @evaluations = Evaluation.find(params[:id])
  end

  # For a page to make a new evaluation (GET)
  # Named route: new_evaluation_path
  def new
    @evaluations = Evaluation.new
  end

  # To create a new evaluation (POST)
  # Named route: evaluations_path
  def create
    @evaluations = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # For a page to edit evaluation with specific id number (GET)
  # Named route: edit_evaluation_path(evaluation)
  def edit
  end

  # To update a evaluation (PATCH)
  # Named route: evaluation_path(evaluation)
  def patch
  end

  # To delete a evaluation (DELETE)
  # Named route: evaluation_path(evaluation)
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Only allow a list of trusted parameters through
  private def evaluation_params
    params.require(:evaluation).permit(:u_name, :email, :password)
  end
end
