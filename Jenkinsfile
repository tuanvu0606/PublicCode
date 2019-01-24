pipeline {
    agent any 
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

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
                
                sh "chmod +x -R ./html_parsing.rb"
                sh "pwd"
                sh "ruby /var/lib/jenkins/workspace/AWS_flashing_creatives_pipeline/html_parsing.rb"
            }
        }
        stage('Test') { 
            steps {
                echo 'test'
            }
        }
        stage('Export HTML') { 
            steps {
                def files = findFiles(glob: '*.*') echo """${files[0].name} ${files[0].path} ${files[0].directory} ${files[0].length} ${files[0].lastModified}"""
            }
        }
    }
}
