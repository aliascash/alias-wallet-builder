#!groovy
// SPDX-FileCopyrightText: © 2020 Alias Developers
// SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
//
// SPDX-License-Identifier: MIT

pipeline {
    agent {
        label "docker"
    }
    options {
        timestamps()
        timeout(time: 2, unit: 'HOURS')
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '5'))
        disableConcurrentBuilds()
    }
    environment {
        // In case another branch beside master or develop should be deployed, enter it here
        BRANCH_TO_DEPLOY = 'xyz'
        DISCORD_WEBHOOK = credentials('991ce248-5da9-4068-9aea-8a6c2c388a19')
    }
    parameters {
        booleanParam defaultValue: true, description: "Build Debian Stretch image", name: 'BUILD_DEBIAN_STRETCH'
        booleanParam defaultValue: true, description: "Build Debian Buster image", name: 'BUILD_DEBIAN_BUSTER'
        booleanParam defaultValue: true, description: "Build Fedora image", name: 'BUILD_FEDORA'
        booleanParam defaultValue: true, description: "Build Raspbian Buster image", name: 'BUILD_RASPBIAN_BUSTER'
        booleanParam defaultValue: true, description: "Build Ubuntu 18.04 image", name: 'BUILD_UBUNTU_18_04'
        booleanParam defaultValue: true, description: "Build Ubuntu 19.04 image", name: 'BUILD_UBUNTU_19_04'
        booleanParam defaultValue: true, description: "Build Ubuntu 19.10 image", name: 'BUILD_UBUNTU_19_10'
    }
    stages {
        stage('Notification') {
            steps {
                // Using result state 'ABORTED' to mark the message on discord with a white border.
                // Makes it easier to distinguish job-start from job-finished
                discordSend(
                        description: "Started build #$env.BUILD_NUMBER",
                        image: '',
                        link: "$env.BUILD_URL",
                        successful: true,
                        result: "ABORTED",
                        thumbnail: 'https://wiki.jenkins-ci.org/download/attachments/2916393/headshot.png',
                        title: "$env.JOB_NAME",
                        webhookURL: "${DISCORD_WEBHOOK}"
                )
            }
        }
        stage('Build image') {
            when {
                not {
                    anyOf { branch 'develop'; branch 'master'; branch "${BRANCH_TO_DEPLOY}" }
                }
            }
            //noinspection GroovyAssignabilityCheck
            parallel {
                stage('Debian Stretch') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Debian/Dockerfile_Stretch_update --rm -t aliascash/aliaswallet-builder-debian-stretch:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Debian Buster') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Debian/Dockerfile_Buster --rm -t aliascash/aliaswallet-builder-debian-buster:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Fedora') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Fedora/Dockerfile --rm -t aliascash/alias-builder-fedora:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Raspberry Pi Buster') {
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f RaspberryPi/Dockerfile_Buster --rm -t aliascash/aliaswallet-builder-raspi-buster:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Ubuntu 18.04') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Ubuntu/Dockerfile_18_04 --rm -t aliascash/aliaswallet-builder-ubuntu-18-04:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Ubuntu 19.04') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Ubuntu/Dockerfile_19_04 --rm -t aliascash/aliaswallet-builder-ubuntu-19-04:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Ubuntu 19.10') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Ubuntu/Dockerfile_19_10 --rm -t aliascash/aliaswallet-builder-ubuntu-19-10:latest ."
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
            }
        }
        stage('Build and upload image') {
            when {
                anyOf { branch 'develop'; branch "${BRANCH_TO_DEPLOY}" }
            }
            //noinspection GroovyAssignabilityCheck
            parallel {
                stage('Debian Stretch') {
                    when {
                        expression {
                            env.BUILD_DEBIAN_STRETCH == 'true'
                        }
                    }
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Debian/Dockerfile_Stretch_update --rm -t aliascash/aliaswallet-builder-debian-stretch:latest ."
                                sh "docker push aliascash/aliaswallet-builder-debian-stretch:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Debian Buster') {
                    when {
                        expression {
                            env.BUILD_DEBIAN_BUSTER == 'true'
                        }
                    }
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Debian/Dockerfile_Buster --rm -t aliascash/aliaswallet-builder-debian-buster:latest ."
                                sh "docker push aliascash/aliaswallet-builder-debian-buster:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Fedora') {
                    when {
                        expression {
                            env.BUILD_FEDORA == 'true'
                        }
                    }
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Fedora/Dockerfile --rm -t aliascash/alias-builder-fedora:latest ."
                                sh "docker push aliascash/alias-builder-fedora:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Raspberry Pi Buster') {
                    when {
                        expression {
                            env.BUILD_RASPBIAN_BUSTER == 'true'
                        }
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f RaspberryPi/Dockerfile_Buster --rm -t aliascash/aliaswallet-builder-raspi-buster:latest ."
                                sh "docker push aliascash/aliaswallet-builder-raspi-buster:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Ubuntu 18.04') {
                    when {
                        expression {
                            env.BUILD_UBUNTU_18_04 == 'true'
                        }
                    }
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Ubuntu/Dockerfile_18_04 --rm -t aliascash/aliaswallet-builder-ubuntu-18-04:latest ."
                                sh "docker push aliascash/aliaswallet-builder-ubuntu-18-04:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Ubuntu 19.04') {
                    when {
                        expression {
                            env.BUILD_UBUNTU_19_04 == 'true'
                        }
                    }
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Ubuntu/Dockerfile_19_04 --rm -t aliascash/aliaswallet-builder-ubuntu-19-04:latest ."
                                sh "docker push aliascash/aliaswallet-builder-ubuntu-19-04:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
                stage('Ubuntu 19.10') {
                    when {
                        expression {
                            env.BUILD_UBUNTU_19_10 == 'true'
                        }
                    }
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            withDockerRegistry(credentialsId: '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                sh "docker build -f Ubuntu/Dockerfile_19_10 --rm -t aliascash/aliaswallet-builder-ubuntu-19-10:latest ."
                                sh "docker push aliascash/aliaswallet-builder-ubuntu-19-10:latest"
                            }
                        }
                    }
                    post {
                        always {
                            sh "docker system prune --all --force"
                        }
                    }
                }
            }
        }
        stage('Info') {
            when {
                branch 'master'
            }
            //noinspection GroovyAssignabilityCheck
            steps {
                script {
                    sh "echo 'No build steps on master branch performed, use tagImage-Job perform image releases'"
                }
            }
        }
    }
    post {
        success {
            script {
                if (!hudson.model.Result.SUCCESS.equals(currentBuild.getPreviousBuild()?.getResult())) {
                    emailext(
                            subject: "GREEN: '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                            body: '${JELLY_SCRIPT,template="html"}',
                            recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
//                            to: "to@be.defined",
//                            replyTo: "to@be.defined"
                    )
                }
                discordSend(
                        description: "Build #$env.BUILD_NUMBER finished successfully",
                        image: '',
                        link: "$env.BUILD_URL",
                        successful: true,
                        thumbnail: 'https://wiki.jenkins-ci.org/download/attachments/2916393/headshot.png',
                        title: "$env.JOB_NAME",
                        webhookURL: "${DISCORD_WEBHOOK}"
                )
            }
        }
        unstable {
            emailext(
                    subject: "YELLOW: '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: '${JELLY_SCRIPT,template="html"}',
                    recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
//                    to: "to@be.defined",
//                    replyTo: "to@be.defined"
            )
            discordSend(
                    description: "Build #$env.BUILD_NUMBER finished unstable",
                    image: '',
                    link: "$env.BUILD_URL",
                    successful: true,
                    result: "UNSTABLE",
                    thumbnail: 'https://wiki.jenkins-ci.org/download/attachments/2916393/headshot.png',
                    title: "$env.JOB_NAME",
                    webhookURL: "${DISCORD_WEBHOOK}"
            )
        }
        failure {
            emailext(
                    subject: "RED: '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: '${JELLY_SCRIPT,template="html"}',
                    recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
//                    to: "to@be.defined",
//                    replyTo: "to@be.defined"
            )
            discordSend(
                    description: "Build #$env.BUILD_NUMBER failed!",
                    image: '',
                    link: "$env.BUILD_URL",
                    successful: false,
                    thumbnail: 'https://wiki.jenkins-ci.org/download/attachments/2916393/headshot.png',
                    title: "$env.JOB_NAME",
                    webhookURL: "${DISCORD_WEBHOOK}"
            )
        }
    }
}
