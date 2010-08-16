class ContributionsController < ApplicationController
  before_filter :find_collection

  def index
    @contributions = @collection.contributions
  end

  def show
    @contribution = @collection.contributions.find(params[:id])
  end

  def new
    @contribution = @collection.contributions.build
  end
  
  def create
    @contribution = @collection.contributions.new(params[:contribution])
    if @contribution.person && params[:attribute_to_household] == 'true'
      @contribution.household = @contribution.person.household 
    else
      @contribution.household = nil
    end
    
    if @contribution.save
      redirect_to collection_contribution_url(@collection, @contribution)
    else
      render :action => "new"
    end
  end

  def edit
    @contribution = @collection.contributions.find(params[:id])
  end
  
  def update
    @contribution = Contribution.find(params[:id])

    if params[:contribution][:person_id] && params[:attribute_to_household] == 'true'
      @contribution.household = Person.find(params[:contribution][:person_id]).household 
    else
      @contribution.household = nil
    end

    if @contribution.update_attributes(params[:contribution])
      redirect_to collection_contribution_url(@collection, @contribution)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy

    respond_to do |format|
      format.html { redirect_to collection_contributions_path(@collection) }
      format.xml  { head :ok }
    end
  end

  private
    def find_collection
      @collection = Collection.find(params[:collection_id])
    end
end
