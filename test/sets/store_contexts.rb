module Contexts 
    module StoreContexts
        def create_stores
         @baskin = FactoryBot.create(:store) 
         @horton = FactoryBot.create(:store, name:"Tim Horton", active:  false)
         @cold = FactoryBot.create(:store, name:"Cold Stone")
        end
      
       def destroy_stores
        @baskin.destroy
        @horton.destroy
        @cold.destroy
       end
      
       def create_additional_stores
         @godiva = FactoryBot.create(:store, name: "Godiva")
         @dazs = FactoryBot.create(:store, name: "Haagen Dazs", active: false)
       end
      
       def destroy_additional_stores
         @godiva.destroy
         @dazs.destroy
       end
        
    end 
    
end