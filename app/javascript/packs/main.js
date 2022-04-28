
const gsap = require("gsap/dist/gsap").gsap;
const MotionPathPlugin = require("gsap/dist/MotionPathPlugin").MotionPathPlugin;


document.addEventListener("DOMContentLoaded", function (event) {
  const tl = gsap.timeline();

  tl.from(".title_ac", 1, { x: 90, opacity: 0 }, "+=1")
  console.log("hello");
  console.log("hello");
});
