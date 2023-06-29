import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['card'];
    static classes = ['hidden'];

    show(event) {
        console.log('Card targets:', this.cardTargets);
        const target = event.target.dataset.card;
        const card = this.cardTargets.find((card) => card.dataset.cardTarget === target);
        this.hideAllCards();
        card.classList.remove('hidden');
    }

    hideAllCards() {
        this.cardTargets.forEach((el) => el.classList.add(this.hiddenClass));
    }
}