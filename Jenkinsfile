pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWSKEY_ASANC35')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_PASS_ASANC35')
    }
    stages {
        stage ("Init") {
            steps {
                sh  "echo \"Primer mensaje\""
            }
        }  
        stage ("Terraform init") {
            steps {
                sh "terraform init"
            }
        }

        stage ("Terraform plan") {
            when {
                not {
                    anyOf {
                        branch 'main'
                    }
                }
            }
            steps {
                sh "terraform plan"
            }
        }

        stage ("Terraform apply") {
            when {
                anyOf {
                    branch 'main'
                }
            }
            steps {
                sh "terraform apply --auto-approve"
            }
        }
        stage ("Ansible test") {
            steps {
                sh "ansible-playbook ansible-reto.yml --check"
            }
        }
        stage ("Ansible apply") {
            when {
                anyOf {
                    branch 'main'
                }
            }
            steps {
                sh "ansible-playbook ansible-reto.yml"
            }
        }
    }
}
