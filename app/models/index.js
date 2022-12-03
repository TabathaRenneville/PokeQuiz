const Answer = require('./answer');
const Question = require('./question');
const Quiz = require('./quiz');

// QUESTION possede plusieurs ANSWER
Question.hasMany(Answer, {
    foreignKey: "question_id",
    as : "answers"
});

// ANSWER appartient a 1 QUESTION
Answer.belongsTo(Question,{
    foreignKey : "question_id",
    as : "question"
});

//quiz a plusieurs questions
Quiz.hasMany(Question, {
    foreignKey: "quiz_id",
    as: "questions"
});

//question appartient à 1 quiz
Question.belongsTo(Quiz, {
    foreignKey: "quiz_id",
    as: "quiz"
});

module.exports = {
    Answer,
    Question,
    Quiz
}



