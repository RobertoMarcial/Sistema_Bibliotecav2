class AuthorsController < ApplicationController

  before_action :set_authors, only: [:edit, :update, :destroy]
  before_action :set_countries, only: [:new, :edit,:create]

  def index
      @autores = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end


  def edit
  end

  def create
    @author = Author.new(author_params)
      respond_to do |format|
        if @author.save
          format.json {head :no_content}
          format.js
       
        else
        

            format.js do 
                errors_count = @author.errors.size
                flash.now.alert = "#{errors_count} #{"Errores".pluralize(errors_count)} favor de verificar que los campos no se encuentren vacios !!"
                render :new 
            end
            format.json { render json: @author.errors.full_messages, status: :unprocessable_entity } 

          
        end
      end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.js
        format.json {head :no_content}
      else
        format.json {render json: @author.errors, status: :unprocessable_entity}
        format.js do
          errors_count = @author.errors.size
          flash.now.alert = "#{errors_count} #{"Errores".pluralize(errors_count)} favor de verificar que los campos no se encuentren vacios !!"
           render :edit 
        end

      
      end
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.js
      format.json {head :no_content}
    end
  end

private
  def author_params
      params.require(:author).permit(:nombre, :idioma, :gat, :country_id)
  end

   def set_authors
    @author = Author.find(params[:id])
  end

  def set_countries
    @paises = Country.all
  end

end
