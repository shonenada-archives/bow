gulp = require 'gulp'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
del = require 'del'
nib = require 'nib'
wiredep = require('wiredep').stream

debug = true

project =
  name: 'bow'
  src: './bow'
  dest: './build'
assets =
  src: "#{project.src}/assets"
  dest: "#{project.dest}/static"

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

gulp.task 'stylus', ->
  options =
    use: nib()
    compress: !debug
  gulp.src "#{assets.src}/styles/*.styl"
    .pipe stylus options
    .pipe gulp.dest "#{assets.dest}/styles/"

gulp.task 'coffee', ->
  options =
    base: true
  gulp.src "#{assets.src}/scripts/*.coffee"
    .pipe coffee options
    .pipe gulp.dest "#{assets.dest}/scripts/"

gulp.task 'build', ['style']
