class AttendanceCategoriesController < ApplicationController
  # GET /attendance_categories
  # GET /attendance_categories.xml
  def index
    @attendance_categories = AttendanceCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendance_categories }
    end
  end

  # GET /attendance_categories/1
  # GET /attendance_categories/1.xml
  def show
    @attendance_category = AttendanceCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance_category }
    end
  end

  # GET /attendance_categories/new
  # GET /attendance_categories/new.xml
  def new
    @attendance_category = AttendanceCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance_category }
    end
  end

  # GET /attendance_categories/1/edit
  def edit
    @attendance_category = AttendanceCategory.find(params[:id])
  end

  # POST /attendance_categories
  # POST /attendance_categories.xml
  def create
    @attendance_category = AttendanceCategory.new(params[:attendance_category])

    respond_to do |format|
      if @attendance_category.save
        format.html { redirect_to(@attendance_category, :notice => 'AttendanceCategory was successfully created.') }
        format.xml  { render :xml => @attendance_category, :status => :created, :location => @attendance_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendance_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_categories/1
  # PUT /attendance_categories/1.xml
  def update
    @attendance_category = AttendanceCategory.find(params[:id])

    respond_to do |format|
      if @attendance_category.update_attributes(params[:attendance_category])
        format.html { redirect_to(@attendance_category, :notice => 'AttendanceCategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_categories/1
  # DELETE /attendance_categories/1.xml
  def destroy
    @attendance_category = AttendanceCategory.find(params[:id])
    @attendance_category.destroy

    respond_to do |format|
      format.html { redirect_to(attendance_categories_url) }
      format.xml  { head :ok }
    end
  end
end
