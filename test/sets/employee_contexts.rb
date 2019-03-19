module Contexts 
    module EmployeeContexts
        def create_employees
         @ahmad = FactoryBot.create(:employee) 
         @yara = FactoryBot.create(:employee, first_name: "Yara", last_name:"Al-Abdulghani", date_of_birth: 2002-04-13, role: "manager" )
        end
      
       def destroy_employees
        @ahmad.destroy
        @yara.destroy
       end
      
       def create_additional_employees
         @noora = FactoryBot.create(:employee, first_name: "Noora", last_name: "Abbarah", date_of_birth: 1999-05-31, role: "employee")
         @sara = FactoryBot.create(:employee, first_name: "Sara", last_name: "Al-Hemaidi", date_of_birth: 1998-03-21)
       end
      
       def destroy_additional_employees
         @noora.destroy
         @sara.destroy
       end
        
        
    end 
    
    
end