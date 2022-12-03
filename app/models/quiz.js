const { Model, DataTypes } = require('sequelize');
const sequelize = require('../database');

class Quiz extends Model {}

Quiz.init({
    title : {
        type: DataTypes.TEXT,
        allowNull: false
    },
  
}, {
    sequelize,
    tableName: "quiz"
})

module.exports = Quiz;