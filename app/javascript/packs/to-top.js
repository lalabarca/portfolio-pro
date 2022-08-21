const toTop = () => {
  const link = document.querySelector('.to-top');

  const scrollBtnDisplay =  () => {
    window.scrollY > window.innerHeight
      ? link.style.opacity = 1
      : link.style.opacity = 0;
  };

  window.addEventListener("scroll", scrollBtnDisplay);
}

export { toTop };
