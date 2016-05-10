class SearchController < ApplicationController
def search 
        
          @breeder = Breeder.find_by_sql(["select * from breeders where breeds like? OR gender LIKE?OR city LIKE?",
            "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%"])
        if @breeder.length ==0
          if params[:search].empty? == false && params[:search].blank? == true
            flash[:notice] = "Can not be blank!" 
            redirect_to :action => 'home',:controller=> 'static_pages'
          else
            flash[:notice] = "Not Found!" 
            redirect_to :action => 'index',:controller=> 'breeders'
          end
        end
      end
    end