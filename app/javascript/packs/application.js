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


const gsap = require("gsap/dist/gsap").gsap;
const MotionPathPlugin = require("gsap/dist/MotionPathPlugin").MotionPathPlugin;
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
    slidesPerView: 2,
    slidesPerGroup: 2,
    spaceBetween: 5,
    grabCursor: true,
    loop: true,
    breakpoints: {
      // when window width is >= 600px
      600: {
        slidesPerView: 2,
        slidesPerGroup: 2,
        spaceBetween: 5,
        grabCursor: true,
        loop: true,
        centeredSlides: true

      },
      // when window width is >= 900px
      900: {
        slidesPerView: 3,
        slidesPerGroup: 3,
        grabCursor: true,
        loop: true,
        speed: 1500,
        spaceBetween: 5,
        centeredSlides: false

      },
      // when window width is >= 1200px
      1200: {
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
});
