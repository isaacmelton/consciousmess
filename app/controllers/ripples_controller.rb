class RipplesController < ApplicationController

  before_action :set_ripple, only: [:show]

  # GET /ripples
  # GET /ripples.json
  def index

  if session[:page].nil?
	session[:page] = 0
   first_ripple = session[:page] * 10
   last_ripple = first_ripple + 9

    @ripples = Ripple.order('ripples.created_at DESC')[first_ripple..last_ripple]

else
 first_ripple = session[:page] * 10
   last_ripple = first_ripple + 9

    @ripples = Ripple.order('ripples.created_at DESC')[first_ripple..last_ripple]



end
end

  # GET /ripples/1
  # GET /ripples/1.json
  def show
	
  end

def newest
session[:page] = 0
    respond_to do |format|
format.html { redirect_to ripples_url}
format.json { head :no_content }
end
end

def next10
session[:page] += 1
    respond_to do |format|
format.html { redirect_to ripples_url}
format.json { head :no_content }
end
end

def prev10
session[:page] = session[:page] - 1
    respond_to do |format|
format.html { redirect_to ripples_url}
format.json { head :no_content }

end
end

def oldest

session[:page] = (Ripple.all.count / 10)
    respond_to do |format|
format.html { redirect_to ripples_url}
format.json { head :no_content }

end
end

  # GET /ripples/new
  def new
    @ripple = Ripple.new
  end

  # POST /ripples
  # POST /ripples.json
  def create
    session[:page] = 0
    @ripple = Ripple.new(ripple_params)

    respond_to do |format|
      if @ripple.save
        format.html { redirect_to ripples_url, notice: 'Ripple was successfully created.' }
        format.json { render :show, status: :created, location: @ripple }
      else
        format.html { render :new }
        format.json { render json: @ripple.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ripple
      @ripple = Ripple.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def ripple_params
      params.require(:ripple).permit(:name, :website, :message)
    end
end
