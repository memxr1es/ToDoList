//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Никита Котов on 04.09.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    let quotes: [String] = [
        "Если вы можете мечтать об этом, вы можете это сделать.",
        "Усердно работайте, мечтайте по-крупному.",
        "Не ждите. Время никогда не будет подходящим.",
        "Мотивация - это то, что заставляет вас начать. Привычка - это то, что заставляет вас продолжать.",
        "Измени свои мысли и ты изменишь мир.",
        "Неудача никогда не одолеет меня, если моя решимость добиться успеха достаточно сильна.",
        "Ум - это все. Вы становитесь тем, о чем думаете.",
        "Будь скромным. Будь голодным. И всегда будь самым усердным в комнате.",
        "Ваше время ограничено, не тратьте его на чужую жизнь.",
        "Успешные люди делают то, что неуспешные люди не хотят делать. Не желай, чтобы было легче, желай стать лучше.",
    ]
    let index: Int = Int.random(in: 0...9)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Group {
                    Text("Нет задач...")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(quotes[index])
                        .padding(.bottom, 20)
                }
                .foregroundColor(.secondary)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Добавь что-то 🥹")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : .accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 20 : 50)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
