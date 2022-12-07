local wk = require('which-key')

wk.register({
    m = { 'h', 'Left' },
    M = { 'H', 'Top line of window' },

    h = { 'i', 'Insert' },
    H = { 'I', 'Insert at line start' },

    n = { 'j', 'Down' },
    N = { 'J', 'Join below line' },

    k = { 'n', 'Find next' },
    K = { 'N', 'Find previous' },

    e = { 'k', 'Up' },
    E = { 'K', 'Keyword lookup' },

    l = { 'e', 'Next end of word' },
    L = { 'E', 'Last char before white space' },

    i = { 'l', 'Right' },
    I = { 'L', 'Last line of window' },

    j = { 'm', '' },
    J = { 'M', 'Middle line of window' },
}, {
    mode = { 'n', 'x', 'o' },
})
