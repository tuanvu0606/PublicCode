#!/usr/bin/env groovy

import java.util.Date

def date = new Date()

pipeline {
    agent any 
    parameters {
        string(name: 'HTML_BANNER_LINK', defaultValue: 'https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_3+-+Copy.html')

        string(name: 'IMAGE_URL', defaultValue: 'https://s3-ap-southeast-1.amazonaws.com/yoose-tmp/Banner_for_v4/TheCoffeeHouse_1/TheCoffeeHouse_creative_3+-+Copy.html')
        
        //text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')        

        choice(name: 'FROM_TO_COLOR', choices: ['red', 'white', 'brown'], description: 'Pick from to color')

        choice(name: 'CAMPAIGN', choices: ['The_Coffee_House', 'Honda', 'Yamaha'], description: 'Pick from to color')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')

        file(name: "FILE", description: "Choose a file to upload")
    }
    environment {
    PATH = "/usr/local/rvm/rubies/ruby-2.5.3/bin/:$PATH"
    }
    stages {
        stage('Parsing HTML') { 
            steps {                

                //sh "pip install awscli --upgrade --user"
                //check ruby version
                sh "which ruby"
                sh "which gem"
                //sh "gem install google_places"
                //change wokring mode to execute for python and ruby scripts
                sh "chmod +x -R ./html_parsing.rb"  
                sh "chmod +x -R ./css_utils_parsing.py"
                sh "chmod +x -R ./js_modify.py"
                sh "pwd"

                //parse html, change HTML and image source files url                
                sh "ruby ${workspace}/html_parsing.rb ${params.HTML_BANNER_LINK} date"

                //parse javascript, change color from from_to characters.
                sh "python ${workspace}/js_modify.py ${params.FROM_TO_COLOR}"                

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
            archiveArtifacts artifacts: 'o*.html', onlyIfSuccessful: true
            archiveArtifacts artifacts: '*.css', onlyIfSuccessful: true
            archiveArtifacts artifacts: '*.js', onlyIfSuccessful: true
        }
        success {
                sh "echo /var/lib/jenkins/jobs/AWS_flashing_creatives_pipeline/builds/${BUILD_NUMBER}/archive"
                sh """~/.local/bin/aws s3 cp /var/lib/jenkins/jobs/AWS_flashing_creatives_pipeline/builds/${BUILD_NUMBER}/archive s3://tuan.vu.yoose/${params.CAMPAIGN}/${BUILD_NUMBER} --recursive --exclude "*" --include "*.html" --include "*.js" --include "*.css" --acl public-read"""
            }       
        }            
    }

