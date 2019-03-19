module Contexts 
    module AssignmentContexts
        def create_assignments
         @a1 = FactoryBot.create(:assignment, employee: @yara, store: @baskin) 
         @a2 = FactoryBot.create(:assignment, employee: @noora, store: @godiva, pay_level: 3)
         @a3 = FactoryBot.create(:assignment, employee: @sara, store: @horton, start_date: 2019-03-18)
        end
      
       def destroy_assignments
        @a1.destroy
        @a2.destroy
        @a3.destroy
       end
      
       def create_additional_assignments
         @a4 = FactoryBot.create(:assignment, employee: @yara, store: @cold, pay_level: 1)
         @a5 = FactoryBot.create(:assignment, employee: @godiva, store: @horton, start_date: 2018-05-11)
       end
      
       def destroy_additional_assignments
         @a4.destroy
         @a5.destroy
       end
        
        
    end 
    
    
end