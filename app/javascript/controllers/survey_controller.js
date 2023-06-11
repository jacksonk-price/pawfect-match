import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['question'];
    static classes = ['hidden'];
    initialize() {
        this.currentIndex = 0;
        this.hideQuestions();
        this.showCurrentQuestion();
    }

    hideQuestions() {
        this.questionTargets.forEach(question => {
            question.classList.add(this.hiddenClass);
        });
    }

    showCurrentQuestion() {
        const currentQuestion = this.questionTargets[this.currentIndex];
        currentQuestion.classList.remove(this.hiddenClass);
    }

    goToNextQuestion() {
        if (this.currentIndex < this.questionTargets.length - 1) {
            this.currentIndex++;
            this.hideQuestions();
            this.showCurrentQuestion();
        }
    }
}