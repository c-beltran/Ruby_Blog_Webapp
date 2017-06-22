class ItemsController < ApplicationController
    
    def index
#sql cammand that stores all items inside of @items global variable.
        @items = Item.all
    end
    
    def show
#this says - go to databese and get out an item with an specifid id that im looking for
        @item = Item.find(params[:id])
    end
#define a "new" action method in controller so that the controller can handle
# =>GET requests for visiting (this is the page that you visit)
     def new
        @item = Item.new
     end
#define a "create" action method so that the controller can handle the creation of
#a new item through a POST request, in this case it just prints the new item to the screen. 
     def create
         @item = Item.new(item_params)
         
         if @item.save
             redirect_to @item
        else
            render 'new'
        end
     end
     
    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
 
        if @item.update(item_params)
            redirect_to @item
        else
            render 'edit'
        end
    end
    
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
    
        redirect_to items_path
    end
     #this is for a user vote
     def upvote
        @item = Item.find(params[:id])
        @item.votes.create
        render 'new'
    end
    
     private
     def item_params
         params.require(:item).permit(:title, :notes)
     end
end
