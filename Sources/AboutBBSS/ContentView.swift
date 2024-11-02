import SwiftUI

public struct ContentView: View {
    @AppStorage("tab") var tab = Tab.welcome
    @State var navigationManager = NavigationManager()
    
    public init() {
    }
    
    public var body: some View {
        TabView(selection: $tab) {
            // Welcome Tab
            ZStack {
//                Color(UIColor(red: 250/255, green: 240/255, blue: 180/255, alpha: 1.0))
//                    .ignoresSafeArea()
                
                VStack {
                    NavigationStack {
                        VStack {
                            NavigationLink(destination: propoganda()) {
                                Image("BBSS")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .padding(.top, 50)
                                    .shadow(radius: 20)
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: AboutBBSSView()) {
                                Text("About BBSS")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
//                                    .background(Color(UIColor(red: 152/255, green: 29/255, blue: 32/255, alpha: 1.0)))
//                                    .cornerRadius(20)
                            }
                            
                            //                            NavigationLink(destination: HowToGetToBBSSView()) {
                            NavigationLink(destination: AboutBBSSView()) {
                                
                                Text("How to get to BBSS")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
//                                    .background(Color(UIColor(red: 152/255, green: 29/255, blue: 32/255, alpha: 1.0)))
//                                    .cornerRadius(20)
                            }
                            
                            Spacer()
                            
                            //                            NavigationLink(destination: TriviaQuizView()) {
                            NavigationLink(destination: AboutBBSSView()) {
                                
                                Text("Trivia Quiz")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 200, height: 50)
//                                    .background(Color(UIColor(red: 152/255, green: 29/255, blue: 32/255, alpha: 1.0)))
//                                    .cornerRadius(20)
                            }
                            .padding(.bottom, 30)
                            
                            Spacer()
                            
                            VStack {
                                Text("Made by Saumil, Zenneth and Daivik")
                                    .font(.title)
                                    .fontWeight(.bold)
                                //                                NavigationLink(destination: HackClubView()) {
                                NavigationLink(destination: AboutBBSSView()) {
                                    
                                    HStack {
                                        Text("A product of")
                                            .font(.title)
                                            .fontWeight(.bold)
                                        HStack {
                                            Text("Hack Club BBSS")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundStyle(.blue)
                                            Image("HC LOGO")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: 40)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .tabItem { Label("Welcome", systemImage: "house.fill") }
            .tag(Tab.welcome)
            
            // About Tab
            NavigationStack {
                AboutBBSSView()
            }
            .tabItem { Label("About", systemImage: "info.circle.fill") }
            .tag(Tab.about)
            
            // Quiz Tab
            NavigationStack {
                //                TriviaQuizView()
                NavigationLink(destination: AboutBBSSView()) {
                    
                }
                .tabItem { Label("Quiz", systemImage: "pencil.circle.fill") }
                .tag(Tab.quiz)
            }
            .environmentObject(navigationManager)
        }
    }
    
    enum Tab: String, Hashable {
        case welcome, about, quiz
    }
    
    // Keep your existing propoganda view
    struct propoganda: View {
        var body: some View {
            NavigationStack {
                ZStack {
//                    Color(UIColor(red: 250/255, green: 240/255, blue: 180/255, alpha: 1.0))
//                        .ignoresSafeArea()
                    
                    WebView(url: URL(string:"https://www.moe.gov.sg/schoolfinder/schooldetail?schoolname=bukit-batok-secondary-school")!)
                }
                .navigationTitle("BBSS")
                .foregroundColor(Color.black)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    
//    struct WebView: UIViewRepresentable {
//        let url: URL
//        
//        func makeUIView(context: Context) -> WKWebView {
//            return WKWebView()
//        }
//        
//        func updateUIView(_ webView: WKWebView, context: Context) {
//            let request = URLRequest(url: url)
//            webView.load(request)
//        }
//    }
    
    
    class NavigationManager: ObservableObject {
        @Published var shouldNavigateToContentView = false
        @Published var shouldNavigateToQuizView = false
        
        func navigateToContentView() {
            shouldNavigateToContentView = true
        }
        
        func navigateToQuizView() {
            shouldNavigateToQuizView = true
        }
    }
}


import SwiftUI
#if SKIP
import androidx.compose.runtime.Composable
import androidx.compose.ui.viewinterop.AndroidView
import android.webkit.WebView
import android.webkit.WebViewClient
#else
import WebKit
#endif

public struct WebView: View {
    let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public var body: some View {
        #if SKIP
        createAndroidWebView(urlString: url.absoluteString)
        #else
        WebViewUIKit(url: url)
        #endif
    }
}

#if SKIP
@Composable
func createAndroidWebView(urlString: String) -> ComposeView {
    return ComposeView {
        AndroidView { (context: android.content.Context) -> android.webkit.WebView in
            android.webkit.WebView(context).also { webView in
                webView.settings.javaScriptEnabled = true
                webView.webViewClient = android.webkit.WebViewClient()
                webView.loadUrl(urlString)
            }
        }
    }
}
#else
private struct WebViewUIKit: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
#endif
