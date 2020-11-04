class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]
 
  before_action :require_authorization!, only: [:show, :update, :destroy]
    
   # GET /api/v1/cars/1
  def index
  
    @cars = current_user.cars
  
    render json: @cars
  
  end
  
  def show
  
    render json: @cars
  
  end

  def create
  
    @car = Car.new(car_params.merge(car: current_user))
  
    if @car.save
  
      render json: @car, status: :created
  
    else

      render json: @car.errors, status: :unprocessable_entity
  
    end
  
  end
  
  # PATCH/PUT /api/v1/cars/1
  
  def update
  
    if @car.update(car_params)
  
      render json: @car
  
    else
  
      render json: @car.errors, status: :unprocessable_entity
  
    end
  
  end
  
  # DELETE /api/v1/contacts/1
  
  def destroy
  
    @car.destroy
  
  end
  
  private
  
    # Use callbacks to share common setup or constraints between actions.
  
    def set_car
  
      @car = car.find(params[:id])
  
    end
  
    # Only allow a trusted parameter "white list" through.
  
    def contact_params
  
      params.require(:car).permit(:marca, :veiculo, :ano, :descricao)
  
    end
  
  #  def require_authorization!
  
   #   unless current_car == @contact.user
  
    #    render json: {}, status: :forbidden
  
     # end
  
   # end
  
 end
end
