class TopSitesController < ApplicationController
  before_action :set_top_site, only: [:show, :edit, :update, :destroy]

  def scrap
    AlexaWorker.perform_async("alexaJob",1)
    redirect_to :root
  end

  # GET /top_sites
  # GET /top_sites.json
  def index
    sorting = params[:sort_by]
    sorting ||= "rank"

    if params[:search]
      @top_sites = TopSite.search(params[:search]).order(sorting).page(params[:page]).per(25)
    else
      @top_sites = TopSite.all.order(sorting).page(params[:page]).per(25)
    end
  end

  def sort
    params[:order].each do |key,value|
      TopSite.find(value[:id]).update_attribute(:ordering,value[:position])
    end
    render :nothing => true
  end

  # GET /top_sites/1
  # GET /top_sites/1.json
  def show
  end

  # GET /top_sites/new
  def new
    @top_site = TopSite.new
  end

  # GET /top_sites/1/edit
  def edit

  end

  # POST /top_sites
  # POST /top_sites.json
  def create
    @top_site = TopSite.new(top_site_params)

    respond_to do |format|
      if @top_site.save
        format.html { redirect_to @top_site, notice: 'Top site was successfully created.' }
        format.json { render json: @top_site, status: :created }
      else
        format.html { render :new }
        format.json { render json: @top_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top_sites/1
  # PATCH/PUT /top_sites/1.json
  def update
    respond_to do |format|
      if @top_site.update(top_site_params)
        format.html { redirect_to top_sites_url , notice: 'Top site was successfully updated.' }
        format.json { render json: @top_site , status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @top_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_sites/1
  # DELETE /top_sites/1.json
  def destroy
    @top_site.destroy
    respond_to do |format|
      format.html { redirect_to top_sites_url, notice: 'Top site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_site
      @top_site = TopSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_site_params
      params.require(:top_site).permit(:name, :url, :rank, :ordering)
    end
end
