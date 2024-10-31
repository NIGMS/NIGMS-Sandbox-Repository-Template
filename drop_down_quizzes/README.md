# JupyterDropDownQuizzes
Create matching-type quizzes in jupyter notebooks, with options to include distractors, randomization, and/or provide instant feedback.

## Dependencies (most or all should already be present with python3 jupyter):
* Jupyter Notebook or Jupyter Lab running python3
* ipywidgets
* IPython (display)
* json
* random
* requests

## Usage:
Follow the example inside the jupyter notebook found in this repository: [DropDownQuizExamples.ipynb](DropDownQuizExamples.ipynb). The first cell is required to load in required dependencies and the quiz_module. 

Questions, answers, hints, and distractors are stored in a JSON file, an example of which can be found in the questions folder: [TestingExample.json](questions/TestingExample.json). You can download and import using this path or, alternatively, import the data using the raw github url (see examples below). 

![image](https://github.com/user-attachments/assets/dd9b3e22-7814-4b72-9c65-104c179715cd)

Replace the values for question, answer, and explanation. Add additional blocks as needed. Distractors are optional and provide items to the dropdown menu that are not false answers to the questions. If you do not want to include distractors, simply delete everything within the corresponding brackets.

The command to run the quiz using the downloaded json file is <b> run_quiz("json", "path_to_questions.json", instant_feedback=BOOLEAN, shuffle_questions=BOOLEAN, shuffle_answers=BOOLEAN) </b>.

Our example using the json file import method: <b> run_quiz("questions/TestingExample.json", instant_feedback=False, shuffle_questions=False, shuffle_answers=True) </b>.

The command to run the quiz using a url is <b> run_quiz("url", "https://raw.githubusercontent.com/repo_name/branch/file_directory/file.json", instant_feedback=BOOLEAN, shuffle_questions=BOOLEAN, shuffle_answers=BOOLEAN) </b>.

Our example using the url import method: <b> run_quiz("url", "https://raw.githubusercontent.com/JRowleyLab/JupyterDropDownQuizzes/main/questions/TestingExample.json", instant_feedback=BOOLEAN, shuffle_questions=BOOLEAN, shuffle_answers=BOOLEAN) </b>. 

The examples above will keep the order of questions (shuffle_questions=False), but randomize the order of items within the dropdown menus (shuffle_answers=True). It will also wait until they have selected answers to each and clicked "Check Answers" before providing feedback.

![image](https://github.com/user-attachments/assets/e2b8baf6-cbec-4736-a31f-c73d967738c1)

Changing the instant_feedback and shuffle_questions parameters to True enables immediate feedback, and randomizes both the order of questions and the order of answers.

![image](https://github.com/user-attachments/assets/b6cc96a5-de69-4e54-a223-a9f5a466b288)

That's it! Enjoy making dynamic quizzes in Jupyter!
