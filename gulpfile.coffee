gulp = require 'gulp'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
del = require 'del'
nib = require 'nib'
wiredep = require('wiredep').stream
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'

debug = false

project =
  name: 'bow'
  src: './bow'
  dest: './build'
assets =
  src: "#{project.src}/assets"
  dest: "#{project.dest}/static"
  sourcemap: "./maps"

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
    compress: !debug
  gulp.src "#{assets.src}/scripts/*.coffee"
    .pipe sourcemaps.init()
    .pipe coffee options
    .pipe uglify()
    .pipe sourcemaps.write("#{assets.sourcemap}")
    .pipe gulp.dest "#{assets.dest}/scripts/"

gulp.task 'build', ['style']
