class SearchesController < ApplicationController
def searches 
        
          @product = Product.find_by_sql(["select * from products where breeds like? OR gender LIKE?OR city LIKE?",
            "%#{params[:searches]}%","%#{params[:searches]}%","%#{params[:searches]}%"])
        if @product.length ==0
          if params[:searches].empty? == false && params[:searches].blank? == true
            flash[:notice] = "Can not be blank!" 
            redirect_to :action => 'home',:controller=> 'static_pages'
          else
            flash[:notice] = "Not Found!" 
            redirect_to :action => 'index',:controller=> 'products'
          end
        end
      end
    end