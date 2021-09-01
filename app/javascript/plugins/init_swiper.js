import Swiper from 'swiper';
// import Swiper styles

const initSwiper = () => {
  const swiper = new Swiper('.swiper', {
    // Optional parameters
    loop: true,
    spaceBetween: 10,
  });
  global.swiper = swiper;
};

export { initSwiper }
