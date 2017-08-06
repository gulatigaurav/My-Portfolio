class PortfoliosController < ApplicationController
  layout "portfolio"
  before_action :set_portfolio_item, only: [:edit, :update, :show , :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

   def index
    @items = Portfolio.all
   end

   def angular
    @angular = Portfolio.angular
   end

  def show
    #  binding.pry
    end


   def new
   @item = Portfolio.new
   3.times { @item.technologies.build }
   end


   def create
  @item = Portfolio.new(portfolio_params)
   if @item.save
       redirect_to  portfolios_path
       flash[:notice] = "Successfully created..."
   else
      render 'new'
   end
   end

  def edit
  end

  def update
       if @item.update(portfolio_params)
    redirect_to portfolios_path
    flash[:notice] = "Successfully updated..."
       else
    render 'edit'
     end
   end

   def destroy
     if @item.destroy
       redirect_to portfolios_path
       flash[:notice] = "Successfully deleted..."
     else
       redirect_to portfolios_path
         flash[:notice] = "Please retry..."
     end
   end

    private

    def portfolio_params
       params.require(:portfolio).permit(:title, :subtitle, :body,
                       technologies_attributes: [:name])
    end

     def set_portfolio_item
       @item = Portfolio.find(params[:id])
     end

end
