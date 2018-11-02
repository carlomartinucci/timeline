class NopEvidencesController < ApplicationController
  before_action :set_nop_evidence, only: [:show, :edit, :update, :destroy]

  # GET /nop_evidences
  # GET /nop_evidences.json
  def index
    @nop_evidences = NopEvidence.all
  end

  # GET /nop_evidences/1
  # GET /nop_evidences/1.json
  def show
  end

  # GET /nop_evidences/new
  def new
    @nop_evidence = NopEvidence.new
  end

  # GET /nop_evidences/1/edit
  def edit
  end

  # POST /nop_evidences
  # POST /nop_evidences.json
  def create
    @nop_evidence = NopEvidence.new(nop_evidence_params)

    respond_to do |format|
      if @nop_evidence.save
        format.html { redirect_to @nop_evidence, notice: 'Nop evidence was successfully created.' }
        format.json { render :show, status: :created, location: @nop_evidence }
      else
        format.html { render :new }
        format.json { render json: @nop_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nop_evidences/1
  # PATCH/PUT /nop_evidences/1.json
  def update
    respond_to do |format|
      if @nop_evidence.update(nop_evidence_params)
        format.html { redirect_to @nop_evidence, notice: 'Nop evidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @nop_evidence }
      else
        format.html { render :edit }
        format.json { render json: @nop_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nop_evidences/1
  # DELETE /nop_evidences/1.json
  def destroy
    @nop_evidence.destroy
    respond_to do |format|
      format.html { redirect_to nop_evidences_url, notice: 'Nop evidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nop_evidence
      @nop_evidence = NopEvidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nop_evidence_params
      params.require(:nop_evidence).permit(:claim_id, :source_id)
    end
end
