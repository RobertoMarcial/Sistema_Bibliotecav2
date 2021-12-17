class AuthorsController < ApplicationController

  before_action :set_author, only: [:edit, :update, :destroy]

  def index
    if params[:pais_id]
      @autores = Country.find(params[:pais_id]).authors
      
      else
   
      @autores = Author.all
      end
  end

  def new
    @autor = Author.new
  end

  def edit
  end

  def create
    @autor = Author.new(author_params)
      respond_to do |format|
        if @autor.save
          format.js
          format.json {head :no_content}
        else
            format.js do 
              errors_count = @autor.errors.size
             flash.now.alert = "#{errors_count} #{"Errores".pluralize(errors_count)} favor de verificar que los campos no se encuentren vacios !!"
             render :new 
            end

            format.json {render json: @autor.errors, status: :unprocessable_entity}
        end
      end

  end

  def update
    respond_to do |format|
      if @autor.update(author_params)
        format.js
        format.json {head :no_content}
      else
        format.js do
          errors_count = @autor.errors.size
          flash.now.alert = "#{errors_count} #{"Errores".pluralize(errors_count)} favor de verificar que los campos no se encuentren vacios !!"
           render :new 
        end

        format.json {render json: @autor.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @autor.destroy
    respond_to do |format|
      format.js
      format.json {head :no_content}
    end
  end

private
  def set_author
    @autor = Author.find(params[:id])
  end
  def author_params
    params.require(:author).permit(:nombre,:idioma,:ganancias_anuales,:pais_id )
  end

end
