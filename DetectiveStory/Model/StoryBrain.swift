//
//  StoryBrain.swift
//  DetectiveStory
//
//  Created by Maksym Ponomarchuk on 10.02.2022.
//

import Foundation
import AVFoundation

struct StoryBrain {
    
    var currentStory = 0
    var player = AVAudioPlayer()
    var musicTrack = "music01"
    
    let stories = [
        Story(
            number: 0, text: "У вашего автомобиля лопнула шина на извилистой дороге в глуши, где нет сотовой связи. Вы решаете поехать автостопом. Ржавый пикап с грохотом останавливается рядом с вами. Человек в широкополой шляпе с бездушными глазами открывает перед вами пассажирскую дверь и спрашивает: «Вас подвезти?».",
            choice1: "Я запрыгнув говорю: Спасибо за помощь!", destination1: 2,
            choice2: "Сначала спрошу его, убийца ли он.", destination2: 1
        ),
        Story(
            number: 1, text: "Он медленно кивает, не обращая внимания на вопрос.",
            choice1: "По крайней мере, он честен. Я полезу в машину.", destination1: 2,
            choice2: "Подождите, я знаю, как поменять шину", destination2: 3
        ),
        Story(
            number: 2, text: "Когда вы садитесь в машину, незнакомец начинает рассказывать о своих отношениях с матерью. С каждой минутой он злится все больше и больше. Он просит вас открыть бардачок. Внутри вы находите окровавленный нож, два отрубленных пальца и кассету. Элтона Джона. Он тянется к бардачку.",
            choice1: "Я люблю Элтона Джона! Даю ему кассету", destination1: 5,
            choice2: "Он или я! Ты берешь нож и наносишь ему удары...", destination2: 4
        ),
        Story(
            number: 3, text: "Что? Знаете ли вы, что дорожно-транспортные происшествия являются второй по значимости причиной смерти от несчастных случаев?",
            choice1: "Да вы правы, лучше поеду с Вами", destination1: 5,
            choice2: "Ничего страшного, я справлюсь!", destination2: 14
        ),
        Story(
            number: 4, text: "Когда вы разбиваете ограждение и кренитесь к зазубренным камням внизу, вы размышляете о сомнительной мудрости нанесения удара ножом кому-то, когда он ведет машину, в которой вы находитесь.",
            choice1: "Закрыть руками глаза...", destination1: 6,
            choice2: "Попытаться открыть дверь и выскочить", destination2: 6
        ),
        Story(
            number: 5, text: "Вы связываетесь с убийцей, напевая стихи «Чувствуете ли вы любовь сегодня вечером?». Он высадит вас в следующем городе. Прежде чем вы уйдете, он спрашивает вас, знаете ли вы какие-нибудь хорошие места, где можно сбросить тела?",
            choice1: "Вы отвечаете: «Попробуйте на пирсе»", destination1: 8,
            choice2: "Вы не ожидали такого... Нервы сдают и вы бросаетесь на него с кулаками", destination2: 6
        ),
        
        // MARK: Конец негативный
        
        Story(number: 6, text: "На этом истрия смелого человека обрывается... А нам остается догадываться была это драмма или триллер...", choice1: "Попробовать еще раз.", destination1: 0, choice2: "Хватит!", destination2: 41),
        
        
        
        Story(number: 7, text: "ХэППи Энд! \nСыграть еще?", choice1: "Да", destination1: 0, choice2: "Нет", destination2: 41),
        Story(number: 8, text: "Ваш новый знакомый уловил иронию и улыбается в ответ. Затем спрашивая Вас, сможете ли вы ему помочь в этом.", choice1: "А почему бы и нет?", destination1: 9, choice2: "Думаю, луче это сделать Вам одному...", destination2: 10),
        Story(number: 9, text: "Вы снова садитесь в машину и едете в сторону пирса. Ваш собесседник улыбается и протягивает Вам свою руку... ", choice1: "Пожать руку", destination1: 11, choice2: "Махнете ему в ответ, не пожав руки.", destination2: 10),
        Story(number: 10, text: "Я Вас чем то обидел?", choice1: "Пожалуй мне лучше будет уйти. Открываете дверь машины...", destination1: 12, choice2: "Нет, все ок", destination2: 11),
        Story(number: 11, text: "Вы приехали на пирс и вышли из машины. Незнакомец просит помочь ему достать что то из багажника", choice1: "Вы соглашаетесь и подходите к нему...", destination1: 26, choice2: "Вы понимаете что сейчас самое время и быстро убегаете... ", destination2: 12),
        
        // MARK: Первый выбор лес или дом
        
        Story(number: 12, text: "Вы убегате от убийцы, оборачиваетесь назад и понимаете что он преследует Вас... Перед Вами слева лес, справа в далеке веднеется дом", choice1: "Побегу в лес", destination1: 13, choice2: "Побегу к дому", destination2: 27),
        Story(number: 13, text: "Вы забегаете в темный лес, через пару минут вы не понимаете куда бежать, вокруг болото.", choice1: "Спрятаться за деревом", destination1: 15, choice2: "Вернусь назад и нападу на маньяка", destination2: 17),
        Story(number: 14, text: "Вы подходите к своей машине, осматривая колесо. Он подходит к вам и говорит: Скоро будет дождь, Вам лучше поехать со мной...", choice1: "Наверно он прав.", destination1: 5, choice2: "Надо бежать!", destination2: 12),
        Story(number: 15, text: "Вы затаились за деревом в самой глуши леса. С одной стороны вы слышите приближающиеся шаги... а с другой тихий шум трассы.", choice1: "Останусь на месте", destination1: 16, choice2: "Побегу к трассе", destination2: 17),
        Story(number: 16, text: "Вы начинаете продераться через густые заросли леса, слушая тяжелое дыхание позади себя, вы спотыкаетесь об ветку и падаете в глубокую яму...", choice1: "Буду сидеть тихо и молиться.", destination1: 18, choice2: "Буду кричать и звать на помощь", destination2: 21),
        Story(number: 17, text: "Спустя какое то время вы выбегаете на пустую дорогу, пресмотревшись - вы понимаете что вы здесь уже были. И перед вами тот же выбор...", choice1: "В лес", destination1: 13, choice2: "К дому", destination2: 27),
        Story(number: 18, text: "Прошло много времени... Вы пытаетесь вылезти из ямы, но у вас не получается.", choice1: "Звать на помощь", destination1: 21, choice2: "Попытаться позвонить по телефону", destination2: 19),
        Story(number: 19, text: "Вы ищите телефон, но его нет. Видимо он выпал когда вы бежали.", choice1: "Звать на помощь", destination1: 20, choice2: "Ждать чуда...", destination2: 20),
        Story(number: 20, text: "Чуда не произошло... Вы теряете сознание...", choice1: "...", destination1: 6, choice2: "...", destination2: 6),
        Story(number: 21, text: "Вы просите помочь и долго кричите... и вот слышны шаги. Вы видете знакомое вам лицо. Он улыбается и бросает вам веревку. Вы вылазите из ямы.", choice1: "Спасибо Вам за помощь!", destination1: 22, choice2: "Нападу на него и постараюсь вырубить...", destination2: 6),
        Story(number: 22, text: "Незнакомец протягивает ваш телефон и говорит: Вы потеряли его в лесу. Пойдемте к машине я подвезу Вас", choice1: "Попытаться убежать через лес в сторону дома", destination1: 27, choice2: "Спросить не собирается ли он Вас убить", destination2: 23),
        Story(number: 23, text: "Незнакомец смеется и спрашивает Вас: С чего вы взяли что я убью Вас?", choice1: "Но эти отрезанные пальцы и нож в крови...", destination1: 24, choice2: "Да я пошутил, идем к машине", destination2: 25),
        Story(number: 24, text: "Ах... как вот оно что..ха-ха-ха. Все дело в том что я работаю реквизитором на съемочной площадке и это нужно было для съемок фильма.", choice1: "А как же пирс? И трупы?", destination1: 26, choice2: "Вот и хорошо, пойдем к машине", destination2: 25),
        Story(number: 25, text: "Вы подходите к машине, и замечаете кровавую лужу под багажником.", choice1: "Наверно это краска", destination1: 26, choice2: "Он точно маньяк, побегу к дому", destination2: 27),
        
        // MARK: Негативный конец. Убийство
        
        Story(number: 26, text: "Это было ошибкой... Ваш незнакомец оказался маньяком. Вы чувствуете глухой удар и ...", choice1: "...", destination1: 6, choice2: "...", destination2: 6),
        
        // MARK: Подбегаете к дому
        
        Story(number: 27, text: "Вы снова бежите из последних сил. Подбегаете к старому деревяному дому, незнакомец бежит за вами, он в сотне метров от вас", choice1: "Зайти в дом", destination1: 28, choice2: "Спрятаться сзади дома в гараже", destination2: 36),
        Story(number: 28, text: "Забегаете в дом, проходите по скрипучему корридору в гостинную, на встречу Вам выходит хозяин дома. Спрашивает что вам нужно?!", choice1: "За мной гонится маньяк.", destination1: 31, choice2: "Побежать на кухню искать что то для обороны", destination2: 30),
        Story(number: 29, text: "Он внимательно слушает Вас.. Но потом начинает смеяться...", choice1: "Напасть на него", destination1: 6, choice2: "Побежать на кухню", destination2: 30),
        Story(number: 30, text: "Вы забегаете на кухню, находите большой нож.", choice1: "Прячетесь под столом", destination1: 32, choice2: "Вылезти в окно и спрятаться в гараже...", destination2: 36),
        Story(number: 31, text: "Хозяин дома уходит и возвращается через время с ружьем. Он целиться в Вас и велит лечь на пол...", choice1: "Так и сделаю", destination1: 32, choice2: "Попробую забрать ружье", destination2: 6),
        Story(number: 32, text: "Через какое то время слышится стук в дверь... шаги... скрип открывания... звуки драки... Выстрел...", choice1: "Идти посмотреть что произошло.", destination1: 39, choice2: "Тихо сидеть и ждать...", destination2: 40),
        
        // MARK: Хэппи Энд 33 и 35
        
        Story(number: 33, text: "Оказывается хозяин дома это шериф, он застрелил маньяка, который уже давно находится в розыске. Вам очень повезло что вы остались живы!", choice1: "...", destination1: 7, choice2: "...", destination2: 7),
        Story(number: 34, text: "Вы прыгате из окна и бежите в сторону гаража. Вы слышите сзади шаги.", choice1: "Продолжать бежать", destination1: 36, choice2: "Обернуться", destination2: 6),
        Story(number: 35, text: "Вы слышите громкий выстрел поблизости и падаете на землю... Оказывается хозяин дома это шериф, он застрелил маньяка, который уже давно находится в розыске. Вам очень повезло что вы отсались живы!", choice1: "...", destination1: 7, choice2: "...", destination2: 7),
        
        // MARK: Бежите в гараж
        
        Story(number: 36, text: "Вы бежите за дом, заходите в гараж. Через время слышны шаги. Включается свет...", choice1: "Буду сидеть тихо", destination1: 38, choice2: "Посмотрю кто зашел", destination2: 37),
        Story(number: 37, text: "Зашел маньяк... Вы были очень близки к счастливом концу... :) ", choice1: "...", destination1: 7, choice2: "...", destination2: 7),
        Story(number: 38, text: "Через время слышен громкий выстрел...", choice1: "Выйду и посмотрю что произошло.", destination1: 39, choice2: "Буду просить не убивать меня.", destination2: 33),
        Story(number: 39, text: "Вы встаете и видете хозяина дома с ружьем. Перед ним лежит незнакомец в красной луже...", choice1: "Буду просить не убивать меня.", destination1: 33, choice2: "Нападу на мужика с ружьем. Вдруг у него был один патрон...", destination2: 6),
        Story(number: 40, text: "Вы слышите голос хозяина дома: Выходите, уже не опасно. Маньяк убит.", choice1: "Послушаюсь и выйду", destination1: 33, choice2: "Дождусь когда он подойдет ближе и постараюсь отобрать оружие", destination2: 6),
        Story(number: 41, text: "Спасибо за игру)) Я старался. Карта привата: \n1111 2222 3333 4444", choice1: "...", destination1: 0, choice2: "...", destination2: 0)
        
    ]
    
    
    mutating func getStory() -> String {
        
        if currentStory == 0 {
            musicPause()
            musicTrack = "music01"
            startMusic()
            
        } else if currentStory == 6 {
            musicPause()
            musicTrack = "lose"
            startMusic()
            
        } else if currentStory == 33 && currentStory == 35 {
            musicPause()
            musicTrack = "win"
            startMusic()
            
        } else if currentStory == 41 {
            musicPause()
            musicTrack = "coins"
            startMusic()
        }
        return stories[currentStory].text
    }
    
    func getButton1() -> String {
        return stories[currentStory].choice1
    }
    
    func getButton2() -> String {
        return stories[currentStory].choice2
    }
    
    mutating func choice(_ playerChoice: Int) -> Int {
        if playerChoice == 1 {
            currentStory = stories[currentStory].destination1
            print(currentStory)
            return currentStory
        } else {
            currentStory = stories[currentStory].destination2
            print(currentStory)
            return currentStory
        }
    }
    
    
    
    // MARK: Sound
    
    mutating func startMusic() {
        
        guard let url = Bundle.main.url(forResource: musicTrack, withExtension: "mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error")
        }
        //player.enableRate = true //вкл измен скорости
        //player.numberOfLoops = 1
        //player.volume = 0 //громкость выкл
        player.play()
        //player.setVolume(1, fadeDuration: 10) //фейд до норм громкости - 10сек
    }
    
    func musicPause() {
        player.pause()
    }
    
    func musicContinue() {
        player.play()
    }
}
