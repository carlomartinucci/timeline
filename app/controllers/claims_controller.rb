class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy]

  # GET /claims
  # GET /claims.json
  def index
    @claims = Claim.all
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
  end

  # GET /claims/new
  def new
    @claim = Claim.new
    @claim.involvements.build
    @claim.nop_evidences.build
    @claim.yes_evidences.build
  end

  # GET /claims/1/edit
  def edit
    @claim.involvements.build
    @claim.nop_evidences.build
    @claim.yes_evidences.build
  end

  # POST /claims
  # POST /claims.json
  def create
    @claim = Claim.new(claim_params)

    respond_to do |format|
      if @claim.save
        format.html { redirect_to @claim, notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: @claim }
      else
        format.html { render :new }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to @claim, notice: 'Claim was successfully updated.' }
        format.json { render :show, status: :ok, location: @claim }
      else
        format.html { render :edit }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to claims_url, notice: 'Claim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      nop_evidences_attributes = [:id, :claim_id, :source_id, :_destroy]
      yes_evidences_attributes = [:id, :claim_id, :source_id, :_destroy]
      involvements_attributes = [:id, :claim_id, :person_id, :_destroy]
      params.require(:claim).permit(
        :title, :body, :person_id, :claimed_at, :happened_at,
        involvements_attributes: involvements_attributes,
        nop_evidences_attributes: nop_evidences_attributes,
        yes_evidences_attributes: yes_evidences_attributes
      )
    end
end
