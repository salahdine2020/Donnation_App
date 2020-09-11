import 'package:crudfirebaseapp/resources/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:crudfirebaseapp/resources/assets.dart';

class Article {
  final String name;
  final String occupation;
  final String imagePath;
  final String description;

  Article(
      { this.name,
         this.occupation,
         this.imagePath,
         this.description});
}

Article firstArticle = Article(
    name: "The influence of blood donation ",
    occupation: "blood donation on training effects",
    imagePath: Assets.blodblog1,
    description: " The influence of blood donation on training effects Donating 450 ml of blood and by the same token red cells makes the remaining blood in the organism diluted in order to preserve proper blood pressure. It happens as a result of increased volume of plasma and at the same time decreased concentration of red cells and hemoglobin, which leads to worsening VO2 max as a result of less effective transport of oxygen through blood.However, studies from the year 2014 did not show any differences in the time of performed effort by sportsmen 2-3 days after donation and also there were no considerable differences in HR max, resting and maximal lactate concentration and maximal power. It is caused by the fact that the organism balances worse oxygen efficiency, deriving energy from anaerobic processes."

);

Article secondArticle = Article(
    name: "TWhat is convalescent plasma?",
    occupation: "What is convalescent plasma?",
    imagePath: Assets.blodblog2,
    description: " What is convalescent plasma? Blood plasma is a yellowish liquid that makes up about half your blood volume. After a virus, your plasma contains antibodies that are used to help fight infection. Convalescent plasma is the antibody-rich plasma of someone who has recovered from a virus, in this case COVID-19. Who can donate convalescent plasma? Convalescent plasma can only be donated by someone who has had the virus. It is also important that donors have fully recovered from COVID-19, and that their body has had time to develop a good antibody response. We are currently collecting plasma no sooner than 28 days after recovery and can only accept donations from people who live in England."
);
Article thirdArticle = Article(
    name: "What is convalescent plasma? ",
    occupation: "What is convalescent plasma?",
    imagePath: Assets.blodblog1,
    description: " The influence of blood donation on training effects Donating 450 ml of blood and by the same token red cells makes the remaining blood in the organism diluted in order to preserve proper blood pressure. It happens as a result of increased volume of plasma and at the same time decreased concentration of red cells and hemoglobin, which leads to worsening VO2 max as a result of less effective transport of oxygen through blood.However, studies from the year 2014 did not show any differences in the time of performed effort by sportsmen 2-3 days after donation and also there were no considerable differences in HR max, resting and maximal lactate concentration and maximal power. It is caused by the fact that the organism balances worse oxygen efficiency, deriving energy from anaerobic processes."
);
Article fourthArticle = Article(
    name: "The influence of blood donation ",
    occupation: "blood donation on training effects",
    imagePath: Assets.blodblog1,
    description: " The influence of blood donation on training effects Donating 450 ml of blood and by the same token red cells makes the remaining blood in the organism diluted in order to preserve proper blood pressure. It happens as a result of increased volume of plasma and at the same time decreased concentration of red cells and hemoglobin, which leads to worsening VO2 max as a result of less effective transport of oxygen through blood.However, studies from the year 2014 did not show any differences in the time of performed effort by sportsmen 2-3 days after donation and also there were no considerable differences in HR max, resting and maximal lactate concentration and maximal power. It is caused by the fact that the organism balances worse oxygen efficiency, deriving energy from anaerobic processes."
);
Article fiveArticle = Article(
    name: "The influence of blood donation ",
    occupation: "blood donation on training effects",
    imagePath: Assets.blodblog1,
    description: " The influence of blood donation on training effects Donating 450 ml of blood and by the same token red cells makes the remaining blood in the organism diluted in order to preserve proper blood pressure. It happens as a result of increased volume of plasma and at the same time decreased concentration of red cells and hemoglobin, which leads to worsening VO2 max as a result of less effective transport of oxygen through blood.However, studies from the year 2014 did not show any differences in the time of performed effort by sportsmen 2-3 days after donation and also there were no considerable differences in HR max, resting and maximal lactate concentration and maximal power. It is caused by the fact that the organism balances worse oxygen efficiency, deriving energy from anaerobic processes."
);
Article sixArticle = Article(
    name: "The influence of blood donation ",
    occupation: "blood donation on training effects",
    imagePath: Assets.blodblog1,
    description: " The influence of blood donation on training effects Donating 450 ml of blood and by the same token red cells makes the remaining blood in the organism diluted in order to preserve proper blood pressure. It happens as a result of increased volume of plasma and at the same time decreased concentration of red cells and hemoglobin, which leads to worsening VO2 max as a result of less effective transport of oxygen through blood.However, studies from the year 2014 did not show any differences in the time of performed effort by sportsmen 2-3 days after donation and also there were no considerable differences in HR max, resting and maximal lactate concentration and maximal power. It is caused by the fact that the organism balances worse oxygen efficiency, deriving energy from anaerobic processes."
);
List<Article> members = [
  firstArticle,
  secondArticle,
  thirdArticle,
  fourthArticle,
  fiveArticle,
  sixArticle,
];
