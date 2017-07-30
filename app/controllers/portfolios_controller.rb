class PortfoliosController < ApplicationController
   def index
    @items = Portfolio.all
   end

   def new
   @item = Portfolio.new
   end


   def create
  @item = Portfolio.new(portfolio_params)
   if @item.save
       redirect_to  portfolios_path
   else
      render 'new'
   end
   end

    private

    def portfolio_params
       params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end
