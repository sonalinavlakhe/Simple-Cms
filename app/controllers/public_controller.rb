class PublicController < ApplicationController
	layout 'public'

	before_action :setup_nevigation

  def index
  	#intro text
  end

  def show
  	#page where permalink 
  	@page = Page.where(permalink: params[:permalink], visible: true).first
  	if @page.nil?
  		redirect_to(action: 'index')
  	else
  	end
  end

  private

  def setup_nevigation
  	@subjects =  Subject.visible.sorted
  end

end

