enum QuestionType {
    case singleChoise
    case multipleChoise
}

struct Question {
    let id: String
    let text: String
    let imageURL: String?
    let type: QuestionType
    let answers: [Answer]
}
