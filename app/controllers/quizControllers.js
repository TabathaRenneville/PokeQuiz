const {Quiz} = require('../models');

const quizController = {

    // je veux recuperer tous les quiz
    async getAllQuiz(req,res) {
        try {

            const dataQuiz = await Quiz.findAll();
            res.send(dataQuiz);

        } catch (error) {
            res.status(500).send('Failed !');
            
        }        
    },

    // je veux recuperer 1 seul quiz
    async getOneQuiz(req,res) {
        try {
            const quizId = req.params.id;

            const quiz = await Quiz.findByPk(quizId);

            if(!quiz) {
                next();
                return;
            }
            res.json(quiz);

        } catch(error) {
            res.status(500).send('Failed !');
            
        }
    },

};

module.exports = quizController;