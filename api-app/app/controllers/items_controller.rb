class ItemsController < ApplicationController
    def show
        @item = Item.find(params[:id])
        render json: @item
    end
    def index
        @items = Item.all
        render json: @items
    end
    def new
        @item = Item.new
      end
    
      def edit
      end

    def create
        @item = Item.new(item_params)
        
        if @item.save
            render json: @item, status: :created
        else
            render json: { errors: @item.errors }, status: :unprocessable_entity
        end
    end

    def update
        @item = Item.find(params[:id])
        
        if @item.update(item_params)
            render json: @item, status: :ok
        else
            render json: { errors: @item.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        head 204
        end
        
        private
            def item_params
                params.require(:item).permit(:name, :description)
            end

       
      
end
