//
//  main.swift
//  3
//
//  Created by Sergey Abrosov on 20.03.2024.
//

import Foundation

// 1) autoresizingMask - указывает на то как будут изменять размеры дочерней вью,
// если изменится баундс нашей родительской вью - в пропорции
// !!! кейс когда можно использовать в проде - если изначально размеры родительской вью не известны

// 2) по итогу все складывается в систему уравнений которое должно иметь решение

// 3) CALayer отрисовывает контент внутри вью

// 4) Можно синхронизировать анимации

// 5) view controller учествует в сохранении и восстановлении состояния

// 6) xib при компиляции превращается в ниб

// 7) viewDidLoad - 1 раз вызывается сразу после загрузки вью (вью еше не добавлено в иерархию, поэтому у нее нет фрейма)
// 8) во вью will лейаут сабвьюс уже известен фрейм вью

// 9) Container - когда в одном вью контроллере несколько вью контроллеров
// 10) Presentation stack - когда вью контроллер содержит вью контроллер и внутри другого вью контроллера еще один вью
// контроллер

// 11)
//add subview
//first view.addsubview(second view)
//viewcontroller .didMove(to parent)

// isDescent - проверка на графе предков, как работает? - главное чтобы в одном из поддеревьев текущего графа
// оно находилось
// layoutMargins? -
// Можно синхронизировать анимации ? -
// насколько правильно использовать несколько подходов верстки к примеру на фреймах и аутолейаут? - можно главное не близко
// не выстрелит ли это в ногу потому при добавлении новых компонентов? - не выстрелит
// перед лейаут ивентс слайд не понял? -
// конфликты нажатий когда tapgesturerecognizer и базовые обработки нажатий коллекций? -


//CV воркшоп

// Как правильно составлять резюме

// Написать средний балл в резюме
// Указать то что был участником ВСЕРОСА
// Ссылку на гит (надо поправить гит)
// В америке нельзя вставлять фотографию в резюме / в германии обязательно - изучать особенности страны
// Уточнить уровень владения технологиями
