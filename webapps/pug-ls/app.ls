require! components

ractive = new Ractive do
    el: '#main-output'
    template: RACTIVE_PREPARSE('app.pug')
    data:
        name: "guest"
