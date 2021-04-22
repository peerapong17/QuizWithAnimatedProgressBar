import 'models.dart';

List<QuestionModel> getQuestions() {
  List<QuestionModel> questions = <QuestionModel>[];

  //1
  QuestionModel questionModel = new QuestionModel(
      question: "A baby has more bones than an adult",
      answer: "True",
      imageUrl:
          "https://images.pexels.com/photos/789786/pexels-photo-789786.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
  questions.add(questionModel);

  //2
  questionModel = new QuestionModel(
      question: "A shark can blink its eyes",
      answer: "True",
      imageUrl:
          "https://images.pexels.com/photos/726478/pexels-photo-726478.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
  questions.add(questionModel);

  //3
  questionModel = new QuestionModel(
      question: "The U.S dollars are made from fiber",
      answer: "False",
      imageUrl:
          "https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500");
  questions.add(questionModel);

  //4
  questionModel = new QuestionModel(
      question: "Sandwich is named after a person",
      answer: "True",
      imageUrl:
          "https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500");
  questions.add(questionModel);

  //5
  questionModel = new QuestionModel(
      question: "A tiger has stripes on its skin",
      answer: "True",
      imageUrl:
          "https://images.pexels.com/photos/302304/pexels-photo-302304.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500");
  questions.add(questionModel);

  //6
  questionModel = new QuestionModel(
      question: "An ostrich has the largest eye in the world",
      answer: "False",
      imageUrl:
          "https://images.pexels.com/photos/60692/bird-animal-nature-strauss-60692.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500");
  questions.add(questionModel);

  //7
  questionModel = new QuestionModel(
      question: "Some 16 billion emails are send daily",
      answer: "False",
      imageUrl:
          "https://images.pexels.com/photos/374074/pexels-photo-374074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
  questions.add(questionModel);

  //8
  questionModel = new QuestionModel(
      question: "Gorilla's blood type is all B",
      answer: "True",
      imageUrl:
          "https://images.pexels.com/photos/2657973/pexels-photo-2657973.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500");
  questions.add(questionModel);

  return questions;
}
