import SwiftUI

struct ContentView: View {
    @State private var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    private var utcTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss 'UTC'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return formatter
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.05, green: 0.08, blue: 0.15), Color(red: 0.02, green: 0.03, blue: 0.06)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 35) {
                VStack(spacing: 8) {
                    HStack(spacing: 10) {
                        Image(systemName: "airplane.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.cyan)
                        Text("iPad M2 Radar Station")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    Text("Sideload Test Build")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Label("LOCAL TIME", systemImage: "clock.fill")
                                .font(.caption.bold())
                                .foregroundColor(.cyan)
                            Spacer()
                            Text(TimeZone.current.identifier)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        
                        Text(timeFormatter.string(from: currentDate))
                            .font(.system(size: 54, weight: .heavy, design: .monospaced))
                            .foregroundColor(.white)
                            .shadow(color: .cyan.opacity(0.3), radius: 10)
                        
                        Text(dateFormatter.string(from: currentDate))
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(24)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.cyan.opacity(0.2), lineWidth: 1)
                    )
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Label("ZULU TIME (AVIATION UTC)", systemImage: "globe.americas.fill")
                                .font(.caption.bold())
                                .foregroundColor(.orange)
                            Spacer()
                            Text("Standard ADS-B Reference")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        
                        Text(utcTimeFormatter.string(from: currentDate))
                            .font(.system(size: 44, weight: .heavy, design: .monospaced))
                            .foregroundColor(.orange)
                            .shadow(color: .orange.opacity(0.3), radius: 8)
                    }
                    .padding(24)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange.opacity(0.2), lineWidth: 1)
                    )
                }
                .frame(maxWidth: 550)
                
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                        Text("App Running via Sideloadly")
                            .font(.footnote.bold())
                            .foregroundColor(.white)
                    }
                    
                    Text("Ready for RTL-SDR Integration")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
        .onReceive(timer) { input in
            currentDate = input
        }
    }
}
