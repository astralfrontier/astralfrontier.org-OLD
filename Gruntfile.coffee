module.exports = (grunt) ->
  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")
    aws_s3:
      options:
        accessKeyId: '<%= process.env.AWS_ACCESS_KEY %>'
        secretAccessKey: '<%= process.env.AWS_SECRET_KEY %>'
        region: 'us-east-1'
        uploadConcurrency: 5
        downloadConcurrency: 5
      production:
        options:
          bucket: 'astralfrontier.org'
        files: [
          {expand: true, cwd: 'build/', src: ['**'], dest: '/', stream: true},
        ]
    bower:
      install:
        options:
          copy: false
    exec:
      build: 'node -r coffee-script/register index.coffee'
  )

  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.loadNpmTasks 'grunt-aws-s3'

  grunt.registerTask 'build', ['bower:install', 'exec:build']
  grunt.registerTask 'default', ['build']
  grunt.registerTask 'deploy', ['build', 'aws_s3:production']
