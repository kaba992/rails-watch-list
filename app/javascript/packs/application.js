// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require 'greensock/TweenLite'
//= require 'greensock/easing/EasePack'
//= require 'greensock/TweenMax'

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
require("packs/main")


import Swiper, { Navigation } from 'swiper'
Swiper.use([Navigation])
import 'swiper/swiper-bundle.min.css'
import "controllers"

Rails.start()
Turbolinks.start()
ActiveStorage.start()



document.addEventListener("turbolinks:load", function () {

  const tl = gsap.timeline();

  tl.from(".title_ac", 1, { x: 90, opacity: 0 }, "+=1")
  console.log("hello");
  console.log("hello");


  console.log(document.querySelector(".swiper-button-next"));
  const swiper = new Swiper(".swiper-container", {
    slidesPerView: 8,
    slidesPerGroup: 2,
    spaceBetween: 5,
    grabCursor: true,
    loop: true,
    breakpoints: {
      // when window width is >= 600px
      300: {
        slidesPerView: 2,
        slidesPerGroup: 1,
        spaceBetween: 5,
        grabCursor: true,
        loop: false,
        centeredSlides: true

      },
      700: {
        slidesPerView: 4,
        slidesPerGroup: 1,
        spaceBetween: 5,
        grabCursor: true,
        loop: false,
        centeredSlides: true

      },
      // when window width is >= 900px

      // when window width is >= 1200px
      1200: {
        slidesPerView: 5,
        slidesPerGroup: 1,
        grabCursor: true,
        loop: true,
        spaceBetween: 5,
        centeredSlides: false
      },
      1500: {
        slidesPerView: 8,
        slidesPerGroup: 4,
        grabCursor: true,
        loop: true,
        spaceBetween: 5,
        centeredSlides: false
      },


      // when window width is >= 1500px

    }
  });

  //Animation cards
  const TLhover = new TimelineMax();
  const cards = document.querySelectorAll(".card-hover img");


  var hover = false;

  cards.forEach(function (element, i) {

    element.addEventListener("mouseover", function (event) {
      if (!hover) {
        TweenMax.to(element, 1, { transformOrigin: "50% 50%", scale: 1.1 });
      }
      hover = true;
    }, false);

    element.addEventListener("mouseleave", function (event) {
      hover = false;
      TweenMax.to(element, 1, { transformOrigin: "50% 50%", scale: 1 });
    }, false);

  });
});
