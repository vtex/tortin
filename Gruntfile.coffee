GruntVTEX = require 'grunt-vtex'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  config = GruntVTEX.generateConfig grunt, pkg,
    open: 'http://basedevmkp.vtexlocal.com.br/tortin/'

  config['gh-pages'] = 
    options:
      base: 'build/<%= relativePath %>'
    src: ['**']

  tasks =
    build: ['clean', 'copy:main', 'copy:pkg', 'less']
    default: ['build', 'connect', 'watch']
    dist: ['build', 'gh-pages']

  # Project configuration.
  grunt.initConfig config
  grunt.loadNpmTasks name for name of pkg.devDependencies when name[0..5] is 'grunt-' and name isnt 'grunt-vtex'
  grunt.registerTask 'nolr', ->
    # Turn off LiveReload in development mode
    grunt.config 'watch.options.livereload', false
    return true
  grunt.registerTask taskName, taskArray for taskName, taskArray of tasks