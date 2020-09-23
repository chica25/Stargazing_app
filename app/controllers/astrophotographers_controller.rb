class AstrophotographersController < ApplicationController

    def new
        @astrophotographer = Astrophotographer.new
    end
end
