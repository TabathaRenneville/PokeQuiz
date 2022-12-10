const { Router } = require('express');
const quizController = require('./controllers/quizControllers');

const router = Router();

router.route('/')
.get(quizController.getAllQuiz);

router.route('/quiz/:id')
.get(quizController.getOneQuiz);

module.exports = router;

