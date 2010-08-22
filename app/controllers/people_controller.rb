class PeopleController < ApplicationController
  before_filter :find_person, :only => [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.xml
  def index
    @people = Person.find(:all,:conditions=>['first_name like ? or last_name like ?', "%#{params[:search]}%", "%#{params[:search]}%"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
      format.js #index.js.erb
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @household = Household.find(params[:household_id])
    @person = @household.people.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.xml
  def create
    @household = Household.find(params[:household_id])
    @person = @household.people.build(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(@household, :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    respond_to do |format|
      if @person.update_attributes(params[:person])
        @household = @person.household
        format.html { redirect_to(@household, :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @household = @person.household
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(@household, :notice => 'Person was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_person
      @person = Person.find(params[:id])
    end
end
