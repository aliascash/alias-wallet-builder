#!groovy

pipeline {
    agent any
    options {
        timestamps()
        timeout(time: 2, unit: 'HOURS')
//	ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '5'))
    }
    stages {
        stage ('Parallel steps') {
            parallel {
                stage('Debian') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            def spectre_base = docker.build("spectreproject/spectre-builder")
                            docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                spectre_base.push("latest")
                            }
                        }
                    }
                }
                stage('CentOS') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
                            // So copy required Dockerfile to root dir for each build
                            sh "cp ./CentOS/Dockerfile ."
                            def spectre_base = docker.build("spectreproject/spectre-builder-centos")
                            docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                spectre_base.push("latest")
                            }
                            sh "rm Dockerfile"
                        }
                    }
                }
                stage('Fedora') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
                            // So copy required Dockerfile to root dir for each build
                            sh "cp ./Fedora/Dockerfile ."
                            def spectre_base = docker.build("spectreproject/spectre-builder-fedora")
                            docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                spectre_base.push("latest")
                            }
                            sh "rm Dockerfile"
                        }
                    }
                }
                stage('Raspberry Pi') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
                            // So copy required Dockerfile to root dir for each build
                            sh "cp ./RaspberryPi/Dockerfile ."
                            def spectre_base = docker.build("spectreproject/spectre-builder-raspi")
                            docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                spectre_base.push("latest")
                            }
                            sh "rm Dockerfile"
                        }
                    }
                }
                stage('Ubuntu') {
                    agent {
                        label "docker"
                    }
                    steps {
                        script {
                            // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
                            // So copy required Dockerfile to root dir for each build
                            sh "cp ./Ubuntu/latest/Dockerfile ."
                            def spectre_base = docker.build("spectreproject/spectre-builder-ubuntu")
                            docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
                                spectre_base.push("latest")
                            }
                            sh "rm Dockerfile"
                        }
                    }
                }
            }
        }
    }
}
