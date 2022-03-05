const colors = require("tailwindcss/colors");
// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex',
    // We need to include the Petal dependency so the classes get picked up by JIT.
    "../deps/petal_components/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.purple,
        secondary: colors.pink,
      },
      fontFamily: {
        serif: [
          'Libre Baskerville',
          'sans-serif'
        ],
        sans: [
          'Inter',
          'Rubik,-apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif',
        ],
        monospace: [
          'Space Mono',
          'monospace'
        ]
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
