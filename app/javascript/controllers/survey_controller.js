import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['question', 'flash', 'disclaimer'];
    static classes = ['hidden'];
    initialize() {
        this.currentIndex = 0;
        this.boolFlashShowing = false;
        this.boolDisclaimerShowing = true;
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

    validateCurrentQuestion() {
        const currentQuestion = this.questionTargets[this.currentIndex];

        if (this.currentIndex === 0) {
            const input= currentQuestion.querySelector('input[type="text"]');
            if (input.value.trim() === '') {
                return false;
            }
        } else {
            const selectedOption= currentQuestion.querySelector('input[type="radio"]:checked');
            if (!selectedOption) {
                return false;
            }
        }

        return true;
    }

    showFlashError() {
        this.flashTarget.classList.remove(this.hiddenClass);
    }

    hideFlashError() {
        this.flashTarget.classList.add(this.hiddenClass);
    }

    goToNextQuestion() {
        if (!this.validateCurrentQuestion()) {
            this.showFlashError();
            this.boolFlashShowing = true;
            return;
        }

        if (this.currentIndex < this.questionTargets.length - 1) {
            if(this.boolFlashShowing) {
                this.hideFlashError();
            }

            if (this.boolDisclaimerShowing) {
                this.disclaimerTarget.classList.add(this.hiddenClass);
            }
            this.currentIndex++;
            this.hideQuestions();
            this.showCurrentQuestion();
        }
    }
}