const smallButtons = () => {
  const button = document.querySelector('.small-btn');

  if (button) {
    window.addEventListener("resize", function () {
      if (window.matchMedia("(max-width: 768px)").matches) {
        button.classList.remove('small-btn');
      } else {
        button.classList.add('small-btn');
      }
    })
  }
}

export { smallButtons };
