class Admin::UniversitiesController < AdminController
  before_action :set_admin_university, only: [:show, :edit, :update, :destroy]

  # GET /admin/universities
  # GET /admin/universities.json
  def index
    @admin_universities = Admin::University.page(params[:page]).per(params[:per])
  end

  # GET /admin/universities/1
  # GET /admin/universities/1.json
  def show
  end

  # GET /admin/universities/new
  def new
    @admin_university = Admin::University.new
  end

  # GET /admin/universities/1/edit
  def edit
  end

  # POST /admin/universities
  # POST /admin/universities.json
  def create
    @admin_university = Admin::University.new(admin_university_params)

    respond_to do |format|
      if @admin_university.save
        format.html { redirect_to @admin_university, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @admin_university }
      else
        format.html { render :new }
        format.json { render json: @admin_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/universities/1
  # PATCH/PUT /admin/universities/1.json
  def update
    respond_to do |format|
      if @admin_university.update(admin_university_params)
        format.html { redirect_to @admin_university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_university }
      else
        format.html { render :edit }
        format.json { render json: @admin_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/universities/1
  # DELETE /admin/universities/1.json
  def destroy
    @admin_university.destroy
    respond_to do |format|
      format.html { redirect_to admin_universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_university
      @admin_university = Admin::University.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_university_params
      params.require(:admin_university).permit(:name)
    end
end
