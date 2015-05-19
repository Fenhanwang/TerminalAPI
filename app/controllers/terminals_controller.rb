class TerminalsController < ApplicationController
  before_action :set_terminal, only: [:show, :edit, :update, :destroy]

  # GET /terminals
  # GET /terminals.json
  def index
    # byebug
    @terminals = Terminal.all
    respond_to do |format|
      if request.format.symbol == :json
        format.json { render json: @terminals.to_json }
      elsif request.format.symbol == :xml
        format.xml  { render xml: @terminals.to_xml }
      else
        format.html
        format.json { render json: @terminals.to_json }
        format.xml  { render xml: @terminals.to_xml }
      end    
    end
  end

  # GET /terminals/1
  # GET /terminals/1.json
  def show
    @terminal = Terminal.find(params[:id])
    respond_to do |format|
      if request.format.symbol == :json
        format.json { render json: @terminal.to_json }
      elsif request.format.symbol == :xml
        format.xml { render xml: @terminal.to_xml }
      else
        format.html
        format.json { render json: @terminal.to_json }
        format.xml  { render xml: @terminal.to_xml }
      end    
    end
  end

  # GET /terminals/new
  def new
    @terminal = Terminal.new
  end

  # GET /terminals/1/edit
  def edit
  end

  # POST /terminals
  # POST /terminals.json
  def create
    @terminal = Terminal.new(terminal_params)

    respond_to do |format|
      if @terminal.save
        format.html { redirect_to @terminal, notice: 'Terminal was successfully created.' }
        format.json { render json: @terminal }
      else
        format.html { render :new }
        format.json { render json: @terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terminals/1
  # PATCH/PUT /terminals/1.json
  def update
    respond_to do |format|
      if @terminal.update(terminal_params)
        format.html { redirect_to @terminal, notice: 'Terminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @terminal }
      else
        format.html { render :edit }
        format.json { render json: @terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terminals/1
  # DELETE /terminals/1.json
  def destroy
    @terminal.destroy
    respond_to do |format|
      format.html { redirect_to terminals_url, notice: 'Terminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terminal
      @terminal = Terminal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def terminal_params
      # all_options = params.require(:terminal).fetch(:attributes_of_terminals, nil).try(:permit!)
      # params.require(:terminal).permit(:id, :name, :description).merge(:attributes_of_terminals => :att_name).merge(:attributes_of_terminals => :att_time)
      params.require(:terminal).permit(:name, :description, :attributes_of_terminals)
    end
end
