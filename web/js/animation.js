document.addEventListener("DOMContentLoaded", function() {
    gsap.registerPlugin(ScrollTrigger);

    const elementsToAnimate = [
        { trigger: ".content", targets: ".content" },
        { trigger: ".producten", targets: ".producten h2" },
        { trigger: ".info", targets: [".info .title", ".info .uitleg"] },
        { trigger: ".product-row", targets: ".product-row > div", stagger: 0.3 },
        { trigger: ".contact", targets: [".contact .title", ".contact .gegevens"] },
        { trigger: ".producten-titel", targets: [".producten-titel h1", ".producten-titel p"] },
        { trigger: ".form__title", targets: [".form__title h1", ".form__title p"] },
        { trigger: ".contact-form", targets: ".contact-form" },
    ];

    elementsToAnimate.forEach(({ trigger, targets, stagger = 0 }) => {
        gsap.fromTo(targets, { opacity: 0, y: 50 }, {
            opacity: 1,
            y: 0,
            duration: 1.5,
            stagger: stagger,
            scrollTrigger: {
                trigger: trigger,
                start: "top 80%",
                end: "bottom 60%",
                toggleActions: "play none none none"
            }
        });
    });
});
