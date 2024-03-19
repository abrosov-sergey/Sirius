//
//  main.swift
//  2
//
//  Created by Sergey Abrosov on 19.03.2024.
//

import Foundation

// 1) VCS - version control system

// гит хранит файлы целиком

// blob - длина файла + его содержимое
// tree - хранит в себе блоб и сабдерево (subtree)

// commit:
//      - tree
//      - parent - предыдущий хэш коммита
//      - author
//      - commiter

//beb4cf4e7e8145c4b624afa9e3ee00beac704fb0

//untracked / tracked / staged / commited / modified

//exclude - как гит игнор, но локальный

//ветка - это указатель на последний коммит который был сделан в этой ветке

// HEAD - ластовый коммит

// git bisect - поиск бага в бинарном представлении файлов
// git restore - откат файла до предыдущего состояние, затирает все правки по файлу

//
//чтобы правильно черри пикать, необходимо
//1) создать новую ветку
//2) выбрать нужные коммиты
//3) перенести их в новую созданную ветку
//4) протестироватиь изменения
//5) MR

// 6) Регламент в работе

// итоговый хэш коммита? - хэширует блобы + хэширует деревья для проверки изменения файлов, в конечный
// хэш попадает конечный tree


// что с застешанными файлами? -
// вопрос про файлы, которые были добавлены на удаленный репозиторий, но не добавлены в гит игнор? -
// подливать в фича ветку правки? -
// бест-практис по черри пику? -
