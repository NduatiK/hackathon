// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {
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
