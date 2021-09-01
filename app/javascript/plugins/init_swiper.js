import Swiper from 'swiper';
// import Swiper styles

const initSwiper = () => {
  const swiper = new Swiper('.swiper', {
    // Optional parameters
    loop: true,
    spaceBetween: 10,
  });
  global.swiper = swiper;

  swiper.on('slideChangeTransitionEnd', () => {
    const pharmacySlide = swiper.slides[swiper.activeIndex];
    const pharmacyId = pharmacySlide.dataset.pharmacyId;

    document.querySelectorAll('.marker').forEach((marker) => {
      marker.classList.remove("active");
    });

    document.getElementById(pharmacyId).classList.add('active');
  });
};

export { initSwiper }
