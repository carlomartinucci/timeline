class YesEvidencesController < ApplicationController
  before_action :set_yes_evidence, only: [:show, :edit, :update, :destroy]

  # GET /yes_evidences
  # GET /yes_evidences.json
  def index
    @yes_evidences = YesEvidence.all
  end

  # GET /yes_evidences/1
  # GET /yes_evidences/1.json
  def show
  end

  # GET /yes_evidences/new
  def new
    @yes_evidence = YesEvidence.new
  end

  # GET /yes_evidences/1/edit
  def edit
  end

  # POST /yes_evidences
  # POST /yes_evidences.json
  def create
    @yes_evidence = YesEvidence.new(yes_evidence_params)

    respond_to do |format|
      if @yes_evidence.save
        format.html { redirect_to @yes_evidence, notice: 'Yes evidence was successfully created.' }
        format.json { render :show, status: :created, location: @yes_evidence }
      else
        format.html { render :new }
        format.json { render json: @yes_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yes_evidences/1
  # PATCH/PUT /yes_evidences/1.json
  def update
    respond_to do |format|
      if @yes_evidence.update(yes_evidence_params)
        format.html { redirect_to @yes_evidence, notice: 'Yes evidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @yes_evidence }
      else
        format.html { render :edit }
        format.json { render json: @yes_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yes_evidences/1
  # DELETE /yes_evidences/1.json
  def destroy
    @yes_evidence.destroy
    respond_to do |format|
      format.html { redirect_to yes_evidences_url, notice: 'Yes evidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yes_evidence
      @yes_evidence = YesEvidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yes_evidence_params
      params.require(:yes_evidence).permit(:claim_id, :source_id)
    end
end
