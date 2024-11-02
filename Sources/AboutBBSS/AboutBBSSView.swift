import SwiftUI

public struct AboutBBSSView: View {
    // MARK: - Colors
//    private let backgroundColor = Color(red: Double(250)/255.0, green: Double(240)/255.0, blue: Double(180)/255.0)
//    private let buttonColor = Color(red: Double(152)/255.0, green: Double(29)/255.0, blue: Double(32)/255.0)

    // MARK: - Values Array
    private let values = [
        "Reflection",
        "Enterprise",
        "Self-discipline",
        "Perseverance",
        "Empathy",
        "Creativity",
        "Teamwork"
    ]
    
    public init() {
    }
    
    public var body: some View {
        ScrollView {
            mainContent
        }
//        .background(backgroundColor.ignoresSafeArea())
        .navigationTitle("About BBSS")
    }
    
    // MARK: - Content Views
    private var mainContent: some View {
        VStack {
            imagesGroup
            visionMissionGroup
            valuesGroup
            philosophyGroup
        }
        .padding(.vertical)
    }
    
    private var imagesGroup: some View {
        Group {
            Image("BBSSLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 200)
            
            Image("Sideshow_1")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 200)
        }
    }
    
    private var visionMissionGroup: some View {
        Group {
            SectionHeader(title: "Our Vision")
            
            Text("Bukit Batok Secondary School is a premier school that provides quality holistic education to every BBSSian.")
                .font(.body)
                .padding(.horizontal, 20)
            
            SectionHeader(title: "Our Mission")
                .padding(.top, 20)
            
            missionText
        }
    }
    
    private var missionText: some View {
        HStack(spacing: 0) {
            Text("To nurture BBSSians to be ")
                .font(.body)
            Text("self-directed learners")
                .font(.body)
                .foregroundStyle(.blue)
            Text(" with an abundance mentality.")
                .font(.body)
        }
    }
    
    private var valuesGroup: some View {
        Group {
            SectionHeader(title: "Our Values")
                .padding(.top, 20)
            
            VStack(alignment: .leading) {
                ForEach(values, id: \.self) { value in
                    Text(value)
                        .font(.body)
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var philosophyGroup: some View {
        Group {
            SectionHeader(title: "Our Philosophy")
                .padding(.top, 20)
            
            Text("We believe that every child is unique and has innate abilities that can be developed.")
                .font(.body)
                .padding(.horizontal, 20)
            
            navigationButton
        }
    }
    
    private var navigationButton: some View {
        NavigationLink(destination: AboutBBSSView()) {
            Text("Our Programmes")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(25)
                .background(
                    RoundedRectangle(cornerRadius: 30)
//                        .fill(buttonColor)
                )
        }
        .padding(.top, 20)
    }
}

// Helper view for consistent section headers
public struct SectionHeader: View {
    let title: String
    
    public var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
    }
}

#if DEBUG
struct AboutBBSSView_Previews: PreviewProvider {
    public static var previews: some View {
        NavigationStack {
            AboutBBSSView()
        }
    }
}
#endif
