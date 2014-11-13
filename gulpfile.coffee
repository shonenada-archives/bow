gulp = require 'gulp'
del = require 'del'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
nib = require 'nib'
wiredep = require('wiredep').stream
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'
webpack = require 'webpack'
{argv} = require 'yargs'

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
      directory: "#{project.src}/bower_components/"
    )
    .pipe gulp.dest("#{project.dest}/")

gulp.task 'clean', (done) ->
  del ["#{project.dest}"], done

gulp.task 'stylus', ->
  options =
    use: nib()
    compress: not argv.debug
  gulp.src "#{assets.src}/styles/*.styl"
    .pipe stylus options
    .pipe gulp.dest "#{assets.dest}/styles/"

gulp.task 'coffee', ->
  options =
    base: true
  gulp.src "#{assets.src}/scripts/*.coffee"
    .pipe sourcemaps.init()
    .pipe coffee options
    .pipe uglify()
    .pipe sourcemaps.write("#{assets.sourcemap}")
    .pipe gulp.dest "#{assets.dest}/scripts/"

gulp.task 'copy', ->
  gulp.src "#{project.src}/bower_components/**/*.js"
    .pipe gulp.dest "#{project.dest}/bower_components/"

gulp.task 'build', ['wiredep', 'stylus', 'coffee', 'copy']
