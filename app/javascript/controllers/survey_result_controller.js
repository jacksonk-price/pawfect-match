import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['card'];
    static classes = ['hidden'];

    show(event) {
        this.hideAllCards();
        this.removeAllSelectedClass();
        this.addSelectedClass(event.target);
        const target = event.target.dataset.card;
        const card = this.cardTargets.find((card) => card.dataset.cardTarget === target);
        card.classList.remove('hidden');
        card.classList.add('fade-in');
    }

    hideAllCards() {
        this.cardTargets.forEach((el) => {
            el.classList.add(this.hiddenClass);
            el.classList.remove('fade-in');
        });
    }

    addSelectedClass(element) {
        element.classList.add('selected');
    }

    removeAllSelectedClass() {
        document.querySelector('.selected').classList.remove('selected');
    }
}