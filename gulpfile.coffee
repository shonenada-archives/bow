gulp = require 'gulp'
stylus = require 'gulp-stylus'
del = require 'del'
wiredep = require('wiredep').stream

project =
  name: 'bow'
  src: './bow'
  dest: './build'
assets =
  src: "#{project.src}/assets"
  dest: "#{project.dest}/styles"

gulp.task 'default', ['clean'], -> gulp.start('build')

gulp.task "wiredep", ->
  gulp.src "#{project.src}/*.html"
    .pipe wiredep(
      optional: 'configuration'
      goes: 'here'
    )
    .pipe gulp.dest("#{project.dest}/")

gulp.task 'clean', (done) ->
  del [
    "#{assets.dest}/**/*"
  ], done

gulp.task 'build', ['style']

gulp.task 'style', ->
  gulp.src '#{assets.src}/styles/*.stylus'
    .pipe stylus
    .pipe gulp.dest('#{assets.dest}/styles')
