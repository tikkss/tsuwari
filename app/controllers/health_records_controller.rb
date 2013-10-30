class HealthRecordsController < ApplicationController
  before_action :set_health_record, only: [:show, :edit, :update, :destroy]

  # GET /health_records
  # GET /health_records.json
  def index
    @health_records = HealthRecord.all
  end

  # GET /health_records/1
  # GET /health_records/1.json
  def show
  end

  # GET /health_records/new
  def new
    @health_record = HealthRecord.new
  end

  # GET /health_records/1/edit
  def edit
  end

  # POST /health_records
  # POST /health_records.json
  def create
    @health_record = HealthRecord.new(health_record_params)

    respond_to do |format|
      if @health_record.save
        format.html { redirect_to @health_record, notice: 'Health record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @health_record }
      else
        if @health_record.eatings_invalid?
          @not_found_food = @health_record.not_found_food
          @health_record.cut_eatings_invalid
        end
        format.html { render action: 'new' }
        format.json { render json: @health_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_records/1
  # PATCH/PUT /health_records/1.json
  def update
    result = false
    begin
      ActiveRecord::Base.transaction do
        @health_record.eatings.clear
        result = @health_record.update(health_record_params)
      end
    rescue
      logger.error $!
    end

    respond_to do |format|
      if result
        format.html { redirect_to @health_record, notice: 'Health record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @health_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_records/1
  # DELETE /health_records/1.json
  def destroy
    @health_record.destroy
    respond_to do |format|
      format.html { redirect_to health_records_url }
      format.json { head :no_content }
    end
  end

  def new_eating
    food = Food.find_by(name: params[:name])

    if food
      @eating = Eating.new(
        food: food, food_name: params[:name], amount: Eating::DEFAULT_AMOUNT
      )
      render layout: false
    else
      render layout: false, partial: "food_not_found",
        locals: { name: params[:name] }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_record
      @health_record = HealthRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_record_params
      params.require(:health_record).permit(
        :date, :time_period, :health,
        eatings_attributes: [:food_id, :amount, :food_name, :_destroy]
      )
    end
end
