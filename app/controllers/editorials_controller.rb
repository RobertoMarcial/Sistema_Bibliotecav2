class EditorialsController < ApplicationController
    
  before_action :set_editorial, only:[:edit, :update, :destroy]

  def index
    @editorials = Editorial.all
  end

  def new
    @editorial = Editorial.new
  end

  def edit
  end

  def create
      @editorial = Editorial.new(editorial_params)


      respond_to do |format|
        if @editorial.save
            format.js
            format.json{head :no_content}
        else
            format.js do 
              errors_count = @editorial.errors.size
              flash.now.alert = "#{errors_count} #{"ERRORES ".pluralize(errors_count)} FAVOR DE REVISAR!!"
              render :new
            end 

            format.json{ render json: @editorial.errors, status: :unprocessable_entity } 
    end
  end
end

  def update
    respond_to do |format|
      if@editorial.update(editorial_params)
        format.js
        format.json{head :no_content}
      else
          format.js do
              errors_count = @editorial.errors.size
              flash.now.alert = "#{errors_count} #{"Errores".pluralize(errors_count)} Favor de verificar que los campos se encuentren vacios!!"
          end
          format.json{render json:@editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @editorial.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end


  private
      def set_editorial 
        @editorial = Editorial.find(params[:id])
      end


      def editorial_params
        params.require(:editorial).permit(:nombre, :pais, :telefono)
      end
  end


