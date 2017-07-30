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
       flash[:notice] = "Successfully created..."
   else
      render 'new'
   end
   end

  def edit
    @item = Portfolio.find(params[:id])
  end

  def update
    @item = Portfolio.find(params[:id])
       if @item.update(portfolio_params)
    redirect_to portfolios_path
    flash[:notice] = "Successfully updated..."
       else
    render 'edit'
     end
   end

    private

    def portfolio_params
       params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end
