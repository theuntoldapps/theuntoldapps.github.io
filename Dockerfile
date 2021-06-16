FROM jekyll/jekyll:4.0
ENV JEKYLL_ENV=development
CMD ["jekyll", "serve", "--livereload", "--host", "0.0.0.0"]