pipeline {
    agent any
    environment {    

        BUTLER_API_KEY = "67KVRNHaLmELCChM9RCSN2j1UP3E1LAe3y0kDtI2"

        String gitUrl = "https://github.com/ZephyrRaine/creajam"
        String gitCredentials = "7a6cd3c7-241d-4687-be25-63477cb25d32" // set a PrivateKey credential if your repo is private
        String gitBranch = "main"
        String repoFolder = "creajam"

        // Unity Build params
        BUILD_NAME = "creajam"
        
    }
    //Options: add timestamp to job logs and limiting the number of builds to be kept.
    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: "10"))
    }

    stages {
        stage('Git pull') 
        {
                            steps {
                                echo "Git pull repo"
                                script {
                                    try {
                                        git url: "${gitUrl}", branch: "${gitBranch}", credentialsId: "${gitCredentials}"
                                    } catch (e) {
                                        currentBuild.result = "FAILED"
                                        echo "JOB FAILED: The selected branch does not exists."
                                    }
                                }
                            }
        }
        stage('WebGL')  {
            environment {
                GODOT_EXECUTABLE = "\"C:\\godot4.4\\godot.exe\""
                String outputFolder = "\"F:/JENKINS_BUILDS/creajam/WEBGL/index.html\""
            }
                    steps {
                        dir('game')
                        {
                            script {
                                echo "Importing assets because godot is trop bete..."
                                bat '%GODOT_EXECUTABLE% --verbose --editor --quit'
                            }
                            script {
                                echo "Build App Oui..."
                                bat '%GODOT_EXECUTABLE% --verbose --import --export-debug \"web\" %outputFolder%'
                            }
                           
                        }
                        

                    }
                
            post { 
                always { 
                     script {
                                echo "Deploying to itch"
                                bat 'C:\\butler\\butler push F:/JENKINS_BUILDS/creajam/WEBGL/\\ zephyrraine/creajam:webgl'
                            }
                        discordSend description: "NEW WEBGL BUILD WITH STATUS : " + currentBuild.currentResult, result : currentBuild.currentResult, title: BUILD_NAME, webhookURL: "https://discord.com/api/webhooks/1307014354742415370/3aQYgOw8GWqqT0VAscctQj4dZWqThyxYZ8KaHNZwnWVYNfMiY6NOOlL58dYD04XjIjD3"
                }
            }
        }
        stage('Windows') {
            environment {
                GODOT_EXECUTABLE = "\"C:\\godot4.4\\godot.exe\""
                String outputFolder = "\"F:/JENKINS_BUILDS/creajam/WIN64/game.exe\""
            }
                    steps {
                        dir('game')
                        {
                            script {
                                echo "Importing assets because godot is trop bete..."
                                bat '%GODOT_EXECUTABLE% --verbose --editor --quit'
                            }
                            script {
                                echo "Build App Oui..."
                                bat '%GODOT_EXECUTABLE% --verbose --import --export-debug \"win64\" %outputFolder%'
                            }
                           
                        }
                        

                    }
                
            post { 
                always { 
                     script {
                                echo "Deploying to itch"
                                bat 'C:\\butler\\butler push F:/JENKINS_BUILDS/creajam/WIN64/\\ zephyrraine/creajam:windows'
                            }
                        discordSend description: "NEW WINDOWS BUILD WITH STATUS : " + currentBuild.currentResult, result : currentBuild.currentResult, title: BUILD_NAME, webhookURL: "https://discord.com/api/webhooks/1307014354742415370/3aQYgOw8GWqqT0VAscctQj4dZWqThyxYZ8KaHNZwnWVYNfMiY6NOOlL58dYD04XjIjD3"
                }
            }
        }
    }
}

