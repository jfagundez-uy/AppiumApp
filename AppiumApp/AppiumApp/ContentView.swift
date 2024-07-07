import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FormView()) {
                    Text("Go to Form")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .accessibilityIdentifier("goToFormButton")
                }
                .padding()

                NavigationLink(destination: ListView()) {
                    Text("Go to List")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .accessibilityIdentifier("goToListButton")
                }
                .padding()
            }
            .navigationTitle("Home")
            .background(
                LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct FormView: View {
    @State private var name = ""
    @State private var email = ""

    var body: some View {
        Form {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityIdentifier("nameField")

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityIdentifier("emailField")

            Button(action: {
                // Acción de enviar
            }) {
                Text("Submit")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .accessibilityIdentifier("submitButton")
            }
            .padding()
        }
        .navigationTitle("Form")
    }
}

struct ListView: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 5)
                .padding(.vertical, 5)
                .accessibilityIdentifier(item)
        }
        .navigationTitle("List")
        .background(
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
