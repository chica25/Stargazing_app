class AstrophotographersController < ApplicationController

    def index 
        @astrophotographer = Astrophotographer.all
    end

    def new
       
    end
end
