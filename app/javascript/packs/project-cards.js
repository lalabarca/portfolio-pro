const colorCards = () => {

  const cards = document.querySelectorAll(".card-project");

  cards.forEach((card) => {
    if (card.dataset.color === "white") {
      card.classList.add("white-o");
    } else if (card.dataset.color === "orange") {
      card.classList.add("orange-o");
    } else if (card.dataset.color === "yellow") {
      card.classList.add("yellow-o");
    }
  });
}
export { colorCards };
