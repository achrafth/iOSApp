import SwiftUI
import SimpleForm

struct SwiftUIView: View {
    
    var simpleForm = SF()
    
    var body: some View {
        
        // Section One
        let sectionOne = SimpleFormSection()
        
        sectionOne.model.fields.append(SimpleFormField(textField: "First Name", labelPosition: .above, name: "first_name", value: "", validation: [.required]))
        
        sectionOne.model.fields.append(SimpleFormField(textField: "Last Name", name: "last_name", value: "", validation:[.required, .regex(#"^\d*$"#, "Please enter numbers only.")]))
        
        sectionOne.model.fields.append(SimpleFormField(textField: "Email", labelPosition: .above, name: "email", value: "", validation: [.required, .email], keyboardType: .emailAddress))
        
        sectionOne.model.fields.append(SimpleFormField(sliderField: "Opacity", name: "opacity", value: 0.85, range: 0...1))
        
        self.simpleForm.model.sections.append(sectionOne)
        
        // Section Two
        let sectionTwo = SimpleFormSection()
        
        sectionTwo.model.fields.append(SimpleFormField(pickerField: "Greetings", name: "greeting", selection: 2, options: [1,13,24], display: { options in
            return  AnyView(
                
                List(0 ..< options.count) { row in
                    HStack {
                        Rectangle().fill(Color.black).frame(width: 100, height: 100)
                        Text("\(options[row] as! Int)").frame(minWidth:100)
                    }
                    
                }
                
            )
            
            
        }))
        
        sectionTwo.model.fields.append(SimpleFormField(stepperField: "How many steps?", name: "steps", value: 20, range: 0...50))
        
        sectionTwo.model.fields.append(SimpleFormField(toggleField: "Agree to Terms", name: "agree_to_terms", value: false))

        self.simpleForm.model.sections.append(sectionTwo)
        
        return NavigationView {
            simpleForm
                .navigationBarTitle("Simple Form", displayMode: .inline).navigationBarItems(trailing: Button(action: {
                    let formValues = self.simpleForm.getValues()
                    print(formValues)
                    let formValid = self.simpleForm.isValid()
                    print("Form Valid: ", formValid)
                }){
                    Text("Submit")
                })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
