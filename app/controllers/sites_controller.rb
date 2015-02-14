class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find_by_subdomain!(request.subdomain)
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to sites_path, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to sites_path, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  private
    def set_site
      @site = Site.find(params[:id])

    end

    def site_params
      params.require(:site).permit(:subdomain)
    end
end
