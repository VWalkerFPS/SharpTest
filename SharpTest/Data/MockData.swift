enum MockData {
    static func makeTests() -> [Test] {
        [
            Test(
                id: "t1",
                title: "Основы C#",
                description: "Базовые вопросы по синтаксису и типам данных",
                imageURL: nil,
                topic: "База",
                questions: [
                    Question(
                        id: "q1",
                        text: "Что выведет Console.WriteLine(1 + 1)?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "a1", text: "1", isCorrect: false),
                            Answer(id: "a2", text: "2", isCorrect: true),
                            Answer(id: "a3", text: "11", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q2",
                        text: "Какой тип используется для хранения целых чисел в C#?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "b1", text: "string", isCorrect: false),
                            Answer(id: "b2", text: "int", isCorrect: true),
                            Answer(id: "b3", text: "bool", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q3",
                        text: "Какие из перечисленных типов являются значимыми (value types) в C#?",
                        imageURL: nil,
                        type: .multipleChoise,
                        answers: [
                            Answer(id: "c1", text: "int", isCorrect: true),
                            Answer(id: "c2", text: "string", isCorrect: false),
                            Answer(id: "c3", text: "struct", isCorrect: true),
                            Answer(id: "c4", text: "class", isCorrect: false)
                        ]
                    )
                ]
            ),
            
            Test(
                id: "t2",
                title: "ООП в C#",
                description: "Классы, наследование и инкапсуляция",
                imageURL: nil,
                topic: "База",
                questions: [
                    Question(
                        id: "q4",
                        text: "Что используется для создания объекта класса?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "d1", text: "new", isCorrect: true),
                            Answer(id: "d2", text: "class", isCorrect: false),
                            Answer(id: "d3", text: "object", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t3",
                title: "Коллекции C#",
                description: "List, Dictionary и работа с коллекциями",
                imageURL: nil,
                topic: "Структуры данных",
                questions: [
                    Question(
                        id: "q5",
                        text: "Какая коллекция хранит элементы в виде ключ-значение?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "e1", text: "List", isCorrect: false),
                            Answer(id: "e2", text: "Dictionary", isCorrect: true),
                            Answer(id: "e3", text: "Array", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q6",
                        text: "Какие коллекции могут динамически изменять размер?",
                        imageURL: nil,
                        type: .multipleChoise,
                        answers: [
                            Answer(id: "f1", text: "List", isCorrect: true),
                            Answer(id: "f2", text: "Dictionary", isCorrect: true),
                            Answer(id: "f3", text: "Array", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t4",
                title: "LINQ",
                description: "Основы запросов и фильтрации данных",
                imageURL: nil,
                topic: "Работа с данными",
                questions: [
                    Question(
                        id: "q7",
                        text: "Для чего используется LINQ?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "g1", text: "Для работы с запросами к данным", isCorrect: true),
                            Answer(id: "g2", text: "Для создания интерфейсов", isCorrect: false),
                            Answer(id: "g3", text: "Для управления памятью", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q8",
                        text: "Какой метод LINQ используется для фильтрации элементов?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "h1", text: "Where", isCorrect: true),
                            Answer(id: "h2", text: "Select", isCorrect: false),
                            Answer(id: "h3", text: "OrderBy", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t5",
                title: "Асинхронность в C#",
                description: "Task, async и await",
                imageURL: nil,
                topic: "Продвинутый C#",
                questions: [
                    Question(
                        id: "q9",
                        text: "Какое ключевое слово используется для объявления асинхронного метода?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "i1", text: "await", isCorrect: false),
                            Answer(id: "i2", text: "async", isCorrect: true),
                            Answer(id: "i3", text: "task", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q10",
                        text: "Что делает оператор await?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "j1", text: "Ожидает завершения асинхронной операции", isCorrect: true),
                            Answer(id: "j2", text: "Создает поток", isCorrect: false),
                            Answer(id: "j3", text: "Останавливает приложение", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t6",
                title: "Делегаты и события",
                description: "Основы delegates, events и обработчиков событий",
                imageURL: nil,
                topic: "Продвинутый C#",
                questions: [
                    Question(
                        id: "q11",
                        text: "Для чего используются делегаты в C#?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "k1", text: "Для хранения файлов", isCorrect: false),
                            Answer(id: "k2", text: "Для хранения ссылок на методы", isCorrect: true),
                            Answer(id: "k3", text: "Для работы с базой данных", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q12",
                        text: "Какое ключевое слово используется для объявления события?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "l1", text: "event", isCorrect: true),
                            Answer(id: "l2", text: "delegate", isCorrect: false),
                            Answer(id: "l3", text: "signal", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t7",
                title: "Обработка исключений",
                description: "try, catch, finally и работа с ошибками",
                imageURL: nil,
                topic: "База",
                questions: [
                    Question(
                        id: "q13",
                        text: "Какой блок используется для перехвата исключений?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "m1", text: "catch", isCorrect: true),
                            Answer(id: "m2", text: "throw", isCorrect: false),
                            Answer(id: "m3", text: "finally", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q14",
                        text: "Какое ключевое слово используется для генерации исключения?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "n1", text: "catch", isCorrect: false),
                            Answer(id: "n2", text: "throw", isCorrect: true),
                            Answer(id: "n3", text: "try", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t8",
                title: "Массивы и строки",
                description: "Индексы, длина, перебор и базовые операции со строками",
                imageURL: nil,
                topic: "Структуры данных",
                questions: [
                    Question(
                        id: "q15",
                        text: "С какого индекса начинается массив в C#?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "o1", text: "0", isCorrect: true),
                            Answer(id: "o2", text: "1", isCorrect: false),
                            Answer(id: "o3", text: "-1", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q16",
                        text: "Какие операции можно выполнять со строками в C#?",
                        imageURL: nil,
                        type: .multipleChoise,
                        answers: [
                            Answer(id: "p1", text: "Получать длину через Length", isCorrect: true),
                            Answer(id: "p2", text: "Объединять через +", isCorrect: true),
                            Answer(id: "p3", text: "Изменять символ по индексу напрямую", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t9",
                title: "Файлы и потоки",
                description: "Чтение файлов и базовая работа с потоками данных",
                imageURL: nil,
                topic: "Работа с данными",
                questions: [
                    Question(
                        id: "q17",
                        text: "Какой класс можно использовать для чтения всего текста из файла?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "r1", text: "File", isCorrect: true),
                            Answer(id: "r2", text: "Console", isCorrect: false),
                            Answer(id: "r3", text: "Random", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q18",
                        text: "Какие классы связаны с потоковым чтением данных?",
                        imageURL: nil,
                        type: .multipleChoise,
                        answers: [
                            Answer(id: "s1", text: "Stream", isCorrect: true),
                            Answer(id: "s2", text: "StreamReader", isCorrect: true),
                            Answer(id: "s3", text: "StringBuilder", isCorrect: false)
                        ]
                    )
                ]
            ),
            Test(
                id: "t10",
                title: "Generics",
                description: "Обобщенные типы, методы и коллекции",
                imageURL: nil,
                topic: "Продвинутый C#",
                questions: [
                    Question(
                        id: "q19",
                        text: "Для чего используются generics в C#?",
                        imageURL: nil,
                        type: .singleChoise,
                        answers: [
                            Answer(id: "t1a", text: "Для создания типов и методов с параметром типа", isCorrect: true),
                            Answer(id: "t1b", text: "Для запуска асинхронных операций", isCorrect: false),
                            Answer(id: "t1c", text: "Для обработки исключений", isCorrect: false)
                        ]
                    ),
                    Question(
                        id: "q20",
                        text: "Какие записи являются примерами generic-типов?",
                        imageURL: nil,
                        type: .multipleChoise,
                        answers: [
                            Answer(id: "u1", text: "List<int>", isCorrect: true),
                            Answer(id: "u2", text: "Dictionary<string, int>", isCorrect: true),
                            Answer(id: "u3", text: "Console.WriteLine", isCorrect: false)
                        ]
                    )
                ]
            )
        ]
    }
}
