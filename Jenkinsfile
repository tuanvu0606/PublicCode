#!/usr/bin/env groovy
pipeline {
    agent any 
    parameters {
        string(name: 'HTML_BANNER-LINK', defaultValue: 'https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_3.html', description: 'Please input your link to public html banner?')

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')

        file(name: "FILE", description: "Choose a file to upload")
    }
    environment {
    PATH = "/usr/local/rvm/rubies/ruby-2.5.3/bin/:$PATH"
    }
    stages {
        stage('Parsing HTML') { 
            steps {
                sh "which ruby"
                sh "which gem"
                //sh "gem install google_places"
                sh "chmod +x -R ./html_parsing.rb"
                sh "pwd"
                sh "ruby ${workspace}/html_parsing.rb"
                //sh "echo $JOB_NAME"
                //sh "echo $BUILD_TAG"
                //sh "echo ${workspace}"
            }
        }
        stage('Test') { 
            steps {
                echo 'test'
            }
        }
        stage('Export HTML') { 
            steps {
                echo 'test'
            }
        }        
    }
    post {
            always {
                archiveArtifacts artifacts: '*.html', onlyIfSuccessful: true
            }
    }
}
